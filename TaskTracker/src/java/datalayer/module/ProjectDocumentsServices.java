/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.ProjectDocumentsBean;
import java.sql.PreparedStatement;
import datalayer.common.ConnectDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author student
 */
public class ProjectDocumentsServices {
    public   List getAllProjectDocumentsSList(int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from ProjectDocuments where Project_Id=" + project_Id);
            while (rs.next()) {
                ProjectDocumentsBean objBean = new ProjectDocumentsBean();
                objBean.setProjectDocuments_Id(rs.getInt("ProjectDocuments_Id"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                objBean.setDocument_Title(rs.getString("Document_Title"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setUpdate_Date(rs.getString("Update_Date"));
                objBean.setDocument_Path(rs.getString("Document_Path"));
                list.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in ProjectDocumentsServices/getAllProjectTeamList()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
            }
            
        }
        return list;
    }
     
    
    
     public boolean addNewProjectDocument(ProjectDocumentsBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectDocuments(Project_Id,is_active,Document_Title,Description,Document_Path,Update_Date) values(?,?,?,?,?,sysdate());");
            pstmt.setInt(1, objBean.getProject_Id());
            pstmt.setInt(2, objBean.getIs_Active());
            pstmt.setString(3, objBean.getDocument_Title());
            pstmt.setString(4, objBean.getDescription());
            pstmt.setString(5, objBean.getDocument_Path());
            
            
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addNewProjectDocument()" + e);
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
