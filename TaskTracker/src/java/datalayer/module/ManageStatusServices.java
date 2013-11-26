/*
 * To change this template, choose Tools,Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditStatusBean;
import beans.module.ManageStatusBean;
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
public class ManageStatusServices {

    public   List<ManageStatusBean> getAllStatusList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManageStatusBean> statusList = new ArrayList<ManageStatusBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from StatusMaster;";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManageStatusBean objBean = new ManageStatusBean();
                objBean.setStatus_Id(rs.getInt("Status_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                statusList.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageStatusServices/getAllStatusList() : " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                //System.out.println("In finally of getAllOperators method of ManageOperatorService in admin datalayer: " + e);
            }

        }
        return statusList;
    }
    public   List<ManageStatusBean> getAllStatusListByTitle(String title) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManageStatusBean> statusList = new ArrayList<ManageStatusBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from StatusMaster where Title like '%"+title+"%';";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManageStatusBean objBean = new ManageStatusBean();
                objBean.setStatus_Id(rs.getInt("Status_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                statusList.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageStatusServices/getAllStatusList() : " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                //System.out.println("In finally of getAllOperators method of ManageOperatorService in admin datalayer: " + e);
            }

        }
        return statusList;
    }
 public boolean addNewStatus(AddEditStatusBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            
            pstmt = conn.prepareStatement("insert into StatusMaster  (Title  ,Description,Is_Active,Update_Date) values(?,?,1,sysdate());");
            pstmt.setString(1, objBean.getTxtStatus());
            pstmt.setString(2, objBean.getTaDescription());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addNewStatus()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }
 public boolean updateStatus(AddEditStatusBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            
            pstmt = conn.prepareStatement("update StatusMaster set Title=?  ,Description=?,Update_Date=sysdate() where Status_Id=?");
            pstmt.setString(1, objBean.getTxtStatus());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getHdnStatusId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in updateStatus()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }
 public String updateStatusIsActive(int status_Id, int is_Active) {
        Connection conn = null;
        PreparedStatement pstmt = null;
          String result = "Failed to change status";
        try {
            conn = ConnectDB.connect();
            
            pstmt = conn.prepareStatement("update StatusMaster set Is_Active=?  where Status_Id=?");
            pstmt.setInt(1, is_Active);
            pstmt.setInt(2, status_Id);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "Status changed successfull";
            }
        } catch (Exception e) {
            System.out.println("Exception in updateStatus()" + e);
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
