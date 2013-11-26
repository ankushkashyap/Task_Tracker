/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.common;

import beans.common.ForgotPasswordBean;
import beans.common.LoginBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author student
 */
public class CommonServices {

    public LoginBean authenticateUser(String username, String password) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        LoginBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = "select * from UserMaster where User_Name='" + username + "' ;";
            rs = stmt.executeQuery(str);

            while (rs.next()) {
                if (password.equals(rs.getString("Password"))) {
                    objBean = new LoginBean();
                    objBean.setUser_Id(rs.getInt("User_Id"));
                    objBean.setStatus(rs.getInt("Status"));
                    objBean.setUser_Name(username);
                    objBean.setUser_Type(rs.getString("User_Type"));
                    break;
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in CommonServices/authenticateUser(String username, String password): " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                System.out.println("In finally of validUser method of AuthUserService: " + e);
            }

        }
        return objBean;

    }

    public boolean changePassword(int user_Id, String password, String currentPassword) {
        Connection conn = null;
        PreparedStatement pstmt;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("select Password from UserMaster where User_Id=?;");
            pstmt.setInt(1, user_Id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("Password").equals(currentPassword)) {
                    pstmt = conn.prepareStatement("update UserMaster set Password=? where User_Id=? and Password=?;");
                    pstmt.setString(1, password);
                    pstmt.setInt(2, user_Id);
                    pstmt.setString(3, currentPassword);
                    int i = pstmt.executeUpdate();
                    if (i > 0) {
                        result = true;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in changePassword()" + e);
        } finally {
            try {
                conn.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public ForgotPasswordBean forgotPassword(String username) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ForgotPasswordBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String q = "select Password,Email_Id from UserMaster as a, UserDetail as b where a.User_Id=b.User_Id and a.User_Name='" + username + "';";
            rs = stmt.executeQuery(q);
            if (rs.next()) {
                objBean = new ForgotPasswordBean();
                objBean.setTxtPassword(rs.getString("Password"));
                objBean.setTxtEmail(rs.getString("Email_Id"));
            }

        } catch (Exception e) {
            System.out.println("ForgetPassword()" + e);
        } finally {
            try {
                conn.close();
                rs.close();
                stmt.close();
            } catch (Exception e) {
            }
        }
        return objBean;
    }
}
