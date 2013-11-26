/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditPriorityBean;
import beans.module.AddEditProjectPortfolioBean;
import beans.module.ManagePrioritiesBean;
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
public class ManagePrioritiesServices {

    public List<ManagePrioritiesBean> getAllPrioritiesList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManagePrioritiesBean> prioritiesBean = new ArrayList<ManagePrioritiesBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from PriorityMaster;";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManagePrioritiesBean objBean = new ManagePrioritiesBean();
                objBean.setPriority_Id(rs.getInt("Priority_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                prioritiesBean.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManagePrioritiesServices/getAllPrioritiesList() : " + e);
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
        return prioritiesBean;
    }

    public List<ManagePrioritiesBean> getAllPrioritiesListBYTitle(String title) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManagePrioritiesBean> prioritiesBean = new ArrayList<ManagePrioritiesBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from PriorityMaster where Title like '%" + title + "%';";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManagePrioritiesBean objBean = new ManagePrioritiesBean();
                objBean.setPriority_Id(rs.getInt("Priority_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                prioritiesBean.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManagePrioritiesServices/getAllPrioritiesList() : " + e);
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
        return prioritiesBean;
    }

    public ManagePrioritiesBean getPrioritybyId(int priority_Id) {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        ManagePrioritiesBean objBean = new ManagePrioritiesBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from PriorityMaster where priority_id=" + priority_Id);
            if (rs.next()) {
                objBean.setTitle(rs.getString("title"));
                objBean.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            System.out.println("Exception in getPrioritybyId()" + e);
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

    public boolean addNewPriority(AddEditPriorityBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();

            pstmt = conn.prepareStatement("insert into PriorityMaster  (Title  ,Description,Is_Active,Update_Date) values(?,?,1,sysdate());");
            pstmt.setString(1, objBean.getTxtPriority());
            pstmt.setString(2, objBean.getTaDescription());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addNewPriority()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public boolean updatePriority(AddEditPriorityBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();

            pstmt = conn.prepareStatement("update PriorityMaster set Title=?  ,Description=?,Update_Date=sysdate() where Priority_Id=?");
            pstmt.setString(1, objBean.getTxtPriority());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getHdnPriorityId());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in updatePriority()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public String updatePriorityStatus(int priority_Id, int is_Active) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String result = "Failed to change status";
        try {
            conn = ConnectDB.connect();

            pstmt = conn.prepareStatement("update PriorityMaster set Is_Active=? where Priority_Id=?");
            pstmt.setInt(1, is_Active);
            pstmt.setInt(2, priority_Id);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "Status changed successfull";
            }
        } catch (Exception e) {
            System.out.println("Exception in updatePriorityStatus()" + e);
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
