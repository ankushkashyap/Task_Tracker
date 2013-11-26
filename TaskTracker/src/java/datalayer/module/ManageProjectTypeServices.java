/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditProjectTypeBean;
import beans.module.ManageProjectTypeBean;
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
public class ManageProjectTypeServices {

    public List<ManageProjectTypeBean> getAllProjectTypeList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManageProjectTypeBean> statusList = new ArrayList<ManageProjectTypeBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from ProjectTypeMaster;";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManageProjectTypeBean objBean = new ManageProjectTypeBean();
                objBean.setProjectType_Id(rs.getInt("ProjectType_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                statusList.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageProjectTypeServices/getAllProjectTypeList() : " + e);
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

    public List<ManageProjectTypeBean> getAllProjectTypeListByTitle(String title) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManageProjectTypeBean> statusList = new ArrayList<ManageProjectTypeBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from ProjectTypeMaster where Title like '%" + title + "%';";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManageProjectTypeBean objBean = new ManageProjectTypeBean();
                objBean.setProjectType_Id(rs.getInt("ProjectType_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                statusList.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageProjectTypeServices/getAllProjectTypeList() : " + e);
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

    public ManageProjectTypeBean viewProjectTypeById(int projectType_Id) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ManageProjectTypeBean objBean = new ManageProjectTypeBean();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from ProjectTypeMaster where ProjectType_Id=" + projectType_Id;
            rs = st.executeQuery(str);
            while (rs.next()) {
                objBean.setProjectType_Id(rs.getInt("ProjectType_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageProjectTypeServices/viewProjectTypeById() : " + e);
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
        return objBean;
    }
    
    
    
    
    public boolean addNewProjectType(AddEditProjectTypeBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            
            pstmt = conn.prepareStatement("insert into ProjectTypeMaster  (Title  ,Description,Is_Active,Update_Date) values(?,?,1,sysdate());");
            pstmt.setString(1, objBean.getTxtProjectType());
            pstmt.setString(2, objBean.getTaDescription());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addNewProjectType()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }
    public boolean updateProjectType(AddEditProjectTypeBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            
          pstmt = conn.prepareStatement("update ProjectTypeMaster set Title=?  ,Description=?,Update_Date=sysdate() where ProjectType_Id=?");
            pstmt.setString(1, objBean.getTxtProjectType());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getHdnProjectTypeId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in updateProjectType()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }
    public String updateProjectTypeStatus(int projectType_Id, int is_Active) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String result = "Failed to change status";
        try {
            conn = ConnectDB.connect();
            
          pstmt = conn.prepareStatement("update ProjectTypeMaster set Is_Active=? where ProjectType_Id=?");
            pstmt.setInt(1, is_Active);
            pstmt.setInt(2, projectType_Id);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "Status changed successfull";
            }
        } catch (Exception e) {
            System.out.println("Exception in updateProjectType()" + e);
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
