/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.PhaseSheetOfWorkForProjectBean;
import beans.module.WorkDoneForProjectBean;
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
public class WorkDoneForProjectServices {

    public List getAllWorkDoneForProjectList() {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Project_Id,Title,Description,concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,Client  from ProjectMaster;");
            while (rs.next()) {
                WorkDoneForProjectBean objBean = new WorkDoneForProjectBean();
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setClient(rs.getString("client"));
                objBean.setDescription(rs.getString("Description"));
                projectList.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in WorkDoneForProjectServices/getAllWorkDoneForProjectList()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
            }

        }
        return projectList;
    }
    public List getAllWorkDoneForProjectListByProjectTitle(String title) {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Project_Id,Title,Description,concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,Client  from ProjectMaster  where title like '%" + title + "%';");
            while (rs.next()) {
                WorkDoneForProjectBean objBean = new WorkDoneForProjectBean();
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setClient(rs.getString("client"));
                objBean.setDescription(rs.getString("Description"));
                projectList.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in WorkDoneForProjectServices/getAllWorkDoneForProjectList()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
            }

        }
        return projectList;
    }
    public List<PhaseSheetOfWorkForProjectBean> getAllPhaseSheetOfWorkForProject(int project_Id) {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        List<PhaseSheetOfWorkForProjectBean> list = new ArrayList<PhaseSheetOfWorkForProjectBean>();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select pm.Phase,ptp.Percentage_Of_Work,ptm.Title from ProjectTeamPhases as ptp inner join ProjectTeamMaster as ptm on ptp.ProjectTeam_Id=ptm.ProjectTeam_Id inner join PhasesMaster as pm on pm.ProjectPhases_Id=ptp.Phase_Id and ptp.Project_id="+project_Id);
            while (rs.next()) {
                PhaseSheetOfWorkForProjectBean objBean = new PhaseSheetOfWorkForProjectBean();
                objBean.setPercentage_Of_Work(rs.getInt("Percentage_Of_Work"));
                objBean.setPhase(rs.getString("Phase"));
                objBean.setProjectTeam_Title(rs.getString("Title"));
                list.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in WorkDoneForProjectServices/getAllPhaseSheetOfWorkForProject()" + e);
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
    
}
