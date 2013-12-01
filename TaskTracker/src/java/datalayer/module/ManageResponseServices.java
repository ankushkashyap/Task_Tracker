/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.ManageRequestBean;
import beans.module.ManageResponseBean;
import datalayer.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author student
 */
public class ManageResponseServices {

    public List<ManageResponseBean> getAllRequestList() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<ManageResponseBean> lstRequest = new ArrayList();

        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            //rs = stmt.executeQuery("select r.request_text,r.request_date,r.request_title,c.name from RequestMaster as r inner join UserDetail as c on r.request_id=c.user_id  and c.User_Id=" + user_Id + ";");
            rs = stmt.executeQuery("select r.Status,r.Request_Id,r.request_text,r.request_date,r.request_title,c.name from RequestMaster as r inner join UserDetail as c on r.request_by=c.user_id");
            while (rs.next()) {
                ManageResponseBean objBean = new ManageResponseBean();
                objBean.setRequest_Id(rs.getInt("Request_Id"));
                objBean.setRequest_Text(rs.getString("Request_Text"));
                objBean.setRequest_Date(rs.getString("Request_Date"));
                objBean.setRequest_By(rs.getString("Name"));
                objBean.setRequest_Title(rs.getString("Request_Title"));
                objBean.setStatus(rs.getString("Status"));
                lstRequest.add(objBean);

            }
        } catch (Exception e) {
            System.out.println("Exception in getAllRequestByUserID/getAllRequestByUserID()" + e);
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

    public ManageResponseBean viewRequest(int requestId) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ManageResponseBean objBean = new ManageResponseBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            
            //rs = stmt.executeQuery("select r.request_text,r.request_date,r.request_title,c.name from RequestMaster as r inner join UserDetail as c on r.request_id=c.user_id where Request_Id=" + requestId);
            rs = stmt.executeQuery("select r.request_text,r.request_date,r.request_title from RequestMaster as r where Request_Id=" + requestId);
            System.out.println("select r.request_text,r.request_date,r.request_title from RequestMaster as r where Request_Id=" + requestId);
            while (rs.next()) {
                objBean.setRequest_Text(rs.getString("Request_Text"));
                objBean.setRequest_Date(rs.getString("Request_Date"));
                //objBean.setRequest_By(rs.getString("Name"));
                objBean.setRequest_Title(rs.getString("Request_Title"));

            }
        } catch (Exception e) {
            System.out.println("Exception in getAllRequestByUserID/getAllRequestByUserID()" + e);
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
    
    
    public boolean postResponse(ManageRequestBean objBean,int user_Id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            
            


            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ResponseMaster (Response_By,Response_Text,Response_Date,Status,Request_Id) values(?,?,sysdate(),1,?);");
            pstmt.setInt(1, user_Id);
            pstmt.setString(2, objBean.getResponse_Text());
            pstmt.setInt(3, objBean.getRequest_Id());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                pstmt=conn.prepareStatement("update RequestMaster set status=1 where Request_id=?");
                pstmt.setInt(1, objBean.getRequest_Id());
                pstmt.executeUpdate();
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in postResponse()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }
}
