/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import datalayer.common.ConnectDB;
import beans.module.ManageRequestBean;
import beans.module.ManageResponseBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author parwinder
 */
public class ManageRequestServices {

    public List<ManageRequestBean> getAllRequestResponseList(int user_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<ManageRequestBean> lstRequest = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select r.Request_Id,r.Request_Text,r.Request_Date,r.Request_Title,if(c.Response_Date is null,'N/A',c.Response_Date)as Response_Date,if(c.Response_Text is null ,'Pending',c.Response_Text) as Response_Text from RequestMaster as r left outer join ResponseMaster  c on r.Request_Id=c.Request_Id where Request_By=" + user_Id + ";");
            while (rs.next()) {
                ManageRequestBean objBean = new ManageRequestBean();
                objBean.setRequest_Title(rs.getString("Request_Title"));
                objBean.setRequest_Id(rs.getInt("Request_Id"));
                objBean.setRequest_Text(rs.getString("Request_Text"));
                objBean.setRequest_Date(rs.getString("Request_Date"));
                objBean.setResponse_Text(rs.getString("Response_Text"));
                objBean.setResponse_Date(rs.getString("Response_Date"));
                lstRequest.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in ManageResponseBean/getAllRequestResponseList()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();

            } catch (Exception e) {
            }

        }
        return lstRequest;



    }

    public boolean postNewRequest(ManageRequestBean objBean, int user_Id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {



            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into RequestMaster (Request_By,Request_Title,Request_Text,Request_Date,Status) values(?,?,?,sysdate(),0);");
            pstmt.setInt(1, user_Id);
            pstmt.setString(2, objBean.getRequest_Title());
            pstmt.setString(3, objBean.getRequest_Text());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in postNewRequest()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public ManageRequestBean viewResponse(int request_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ManageRequestBean objBean = new ManageRequestBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select r.Request_Text,r.Request_Date,r.Request_Title,if(c.Response_Date is null,'N/A',c.Response_Date)as Response_Date,if(c.Response_Text is null ,'Pending',c.Response_Text) as Response_Text from RequestMaster as r left outer join ResponseMaster  c on r.Request_Id=c.Request_Id where r.Request_Id=" + request_Id + ";");
            while (rs.next()) {

                objBean.setRequest_Title(rs.getString("Request_Title"));
                objBean.setRequest_Text(rs.getString("Request_Text"));
                objBean.setRequest_Date(rs.getString("Request_Date"));
                objBean.setResponse_Text(rs.getString("Response_Text"));
                objBean.setResponse_Date(rs.getString("Response_Date"));
            }
        } catch (Exception e) {
            System.out.println("Exception in ManageResponseBean/viewResponse()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();

            } catch (Exception e) {
            }

        }
        return objBean;



    }
}
