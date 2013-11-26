/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditEmployeeBean;
import beans.module.ManageEmployeeBean;
import datalayer.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author student
 */
public class ManageEmployeeServices {

    public ArrayList<ManageEmployeeBean> getAllEmployeeList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ManageEmployeeBean objBean;
        ArrayList<ManageEmployeeBean> al = new ArrayList<ManageEmployeeBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select um.User_Id,User_Name,Status,Name,Email_id,concat(Phone_Home,' / ',Phone_Mobile) as Phone, concat(Department,' / ',Designation) as Professional from UserMaster as um,UserDetail as ud,EmployeeDetail as ed where um.user_id=ud.User_id and um.User_id=ed.Employee_id;";
            rs = st.executeQuery(str);
            while (rs.next()) {
                objBean = new ManageEmployeeBean();
                objBean.setUser_Id(rs.getInt("user_id"));
                objBean.setUser_Name(rs.getString("User_Name"));
                objBean.setName(rs.getString("Name"));
                objBean.setEmail_Id(rs.getString("Email_Id"));
                objBean.setPhone(rs.getString("Phone"));
                objBean.setStatus(rs.getInt("Status"));
                objBean.setProfessional(rs.getString("Professional"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageEmployeeServices/getAllEmployeeList() : " + e);
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
        return al;
    }
    public ArrayList<ManageEmployeeBean> getAllEmployeeListByLoginNameAndName(String name,String logiName) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        ManageEmployeeBean objBean;
        ArrayList<ManageEmployeeBean> al = new ArrayList<ManageEmployeeBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select um.User_Id,User_Name,Status,Name,Email_id,concat(Phone_Home,' / ',Phone_Mobile) as Phone, concat(Department,' / ',Designation) as Professional from UserMaster as um,UserDetail as ud,EmployeeDetail as ed where um.user_id=ud.User_id and um.User_id=ed.Employee_id and Name like '%"+name+"%' and User_Name like '%"+logiName +"%';";
            rs = st.executeQuery(str);
            while (rs.next()) {
                objBean = new ManageEmployeeBean();
                objBean.setUser_Id(rs.getInt("user_id"));
                objBean.setUser_Name(rs.getString("User_Name"));
                objBean.setName(rs.getString("Name"));
                objBean.setEmail_Id(rs.getString("Email_Id"));
                objBean.setPhone(rs.getString("Phone"));
                objBean.setStatus(rs.getInt("Status"));
                objBean.setProfessional(rs.getString("Professional"));
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageEmployeeServices/getAllEmployeeList() : " + e);
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
        return al;
    }

    public AddEditEmployeeBean viewEmployeeById(int employee_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        AddEditEmployeeBean objBean = new AddEditEmployeeBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();


            rs = stmt.executeQuery("select e.gender,e.name,e.email_id,e.phone_home,e.phone_mobile,e.address,e.pin_code,e.dob,b.user_name, country_id,state_id,city_id,ed.* from UserDetail as e inner join UserMaster b on e.user_id=b.user_id inner join EmployeeDetail as ed on e.User_Id=ed.Employee_Id and b.user_id=" + employee_Id);

            if (rs.next()) {
                objBean.setRbGender(rs.getString("gender"));
                objBean.setDdlCountry(rs.getInt("country_id"));
                objBean.setDdlState(rs.getInt("state_id"));
                objBean.setDdlCity(rs.getInt("city_id"));

                objBean.setTxtDOJ(rs.getString("DOJ"));
                objBean.setTxtName(rs.getString("name"));
                objBean.setTxtEmailID(rs.getString("email_id"));
                objBean.setTxtPhone(rs.getString("phone_home"));
                objBean.setTxtMobile(rs.getString("phone_mobile"));
                objBean.setTaAddress(rs.getString("address"));
                objBean.setTxtPinCode(rs.getString("pin_code"));
                objBean.setTxtUserName(rs.getString("user_name"));
                objBean.setTxtDOB(rs.getString("dob"));
                objBean.setTxtDepartment(rs.getString("Department"));
                objBean.setTxtDesignation(rs.getString("Designation"));
                objBean.setTaOtherDetails(rs.getString("Other_Details"));
            }

        } catch (Exception e) {
            System.out.println("Exception in viewOperatorById()" + e);
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

    public boolean addNewEmployeeRecord(AddEditEmployeeBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {

            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into UserMaster(User_Name,Password,User_Type,Status,Last_Login,Update_Date) values (?,?,?,?,null,sysdate())");


            pstmt.setString(1, objBean.getTxtUserName());
            pstmt.setString(2, objBean.getTxtPassword());
            pstmt.setString(3, "Team Member");
            pstmt.setInt(4, objBean.getRbStatus());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select max(User_Id) as User_Id from UserMaster");
                int user_id = -1;
                if (rs.next()) {
                    user_id = rs.getInt("User_Id");
                }
                pstmt = conn.prepareStatement("insert into UserDetail values (?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setInt(1, user_id);
                pstmt.setString(2, objBean.getTxtName());

                pstmt.setString(3, objBean.getRbGender());
                pstmt.setString(4, objBean.getTxtDOB());
                pstmt.setString(5, objBean.getTaAddress());
                pstmt.setInt(6, objBean.getDdlCountry());
                pstmt.setInt(7, objBean.getDdlState());
                pstmt.setInt(8, objBean.getDdlCity());
                pstmt.setString(9, objBean.getTxtPinCode());
                pstmt.setString(10, objBean.getTxtMobile());
                pstmt.setString(11, objBean.getTxtPhone());
                pstmt.setString(12, objBean.getTxtEmailID());

                int j = pstmt.executeUpdate();
                if (j > 0) {

                    pstmt = conn.prepareStatement("insert into EmployeeDetail(Employee_Id,Department,Designation,DOJ,Other_Details)values (?,?,?,?,?)");
                    pstmt.setInt(1, user_id);
                    pstmt.setString(2, objBean.getTxtDepartment());

                    pstmt.setString(3, objBean.getTxtDesignation());
                    pstmt.setString(4, objBean.getTxtDOJ());
                    pstmt.setString(5, objBean.getTaOtherDetails());
                    int k = pstmt.executeUpdate();
                    if (k > 0) {
                        result = true;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("exception in addNewEmployeeRecord()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;

    }
    public boolean updateEmployeeRecord(AddEditEmployeeBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {

            conn = ConnectDB.connect();
           
                Statement stmt = conn.createStatement();
                pstmt = conn.prepareStatement("update UserDetail set"
                        + " Email_Id=?,Name=?,Gender=?,DOB=?,Address=?,Country_Id=?"
                        + ",State_ID=?,City_Id=?,Pin_Code=?,Phone_Mobile=?,Phone_Home=? where User_Id=?");
                
                pstmt.setString(1, objBean.getTxtEmailID());
                pstmt.setString(2, objBean.getTxtName());

                pstmt.setString(3, objBean.getRbGender());
                pstmt.setString(4, objBean.getTxtDOB());
                pstmt.setString(5, objBean.getTaAddress());
                pstmt.setInt(6, objBean.getDdlCountry());
                pstmt.setInt(7, objBean.getDdlState());
                pstmt.setInt(8, objBean.getDdlCity());
                pstmt.setString(9, objBean.getTxtPinCode());
                pstmt.setString(10, objBean.getTxtMobile());
                pstmt.setString(11, objBean.getTxtPhone());
                pstmt.setInt(12, objBean.getHdnEmployeeId());

                int j = pstmt.executeUpdate();
                if (j > 0) {

                    pstmt = conn.prepareStatement("update EmployeeDetail set Other_Details=?,Department=?,Designation=?,DOJ=? where Employee_Id=?");
                    
                    pstmt.setString(1, objBean.getTaOtherDetails());
                    pstmt.setString(2, objBean.getTxtDepartment());

                    pstmt.setString(3, objBean.getTxtDesignation());
                    pstmt.setString(4, objBean.getTxtDOJ());
                    pstmt.setInt(5, objBean.getHdnEmployeeId());
                    int k = pstmt.executeUpdate();
                    if (k > 0) {
                        result = true;
                    }
               
            }
        } catch (Exception e) {
            System.out.println("exception in updateEmployeeRecord()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;

    }
    
    public String updateEmployeeStatus(int user_Id, int is_Active) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String result = "Failed to change status";
        try {
            conn = ConnectDB.connect();

            pstmt = conn.prepareStatement("update UserMaster set Status=? where user_Id=?");
            pstmt.setInt(1, is_Active);
            pstmt.setInt(2, user_Id);
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
