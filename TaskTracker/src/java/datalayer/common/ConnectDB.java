/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.common;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author student
 */
public class ConnectDB {

    public static Connection connect() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3309/TaskTracker", "root", "idontknow");

        } catch (Exception e) {
            System.out.println("In getConnection method :" + e);
        }
        return con;
    }

}
