/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.ManageProjectPortfolioBean;
import beans.module.TeamMemberWorkBean;
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
public class AssignedProjectServices {

    public List getAllAssignedProjectList(int User_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Project_Id,Is_Active,Title,concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,Client   from ProjectMaster where Project_Id in (select Project_Id from ProjectTeamPhases where ProjectTeam_Id in (select ProjectTeam_Id from ProjectTeamDetails where User_Id=" + User_Id + "));");
            while (rs.next()) {
                ManageProjectPortfolioBean objBean = new ManageProjectPortfolioBean();
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setClient(rs.getString("client"));
                projectList.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in AssignedProjectServices/getAllAssignedProjectList()" + e);
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

    public List getAllAssignedProjectListByProjectTitle(int User_Id,String title) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Project_Id,Is_Active,Title,concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,Client   from ProjectMaster where Title like '%"+title+"%' and Project_Id in (select Project_Id from ProjectTeamPhases where ProjectTeam_Id in (select ProjectTeam_Id from ProjectTeamDetails where User_Id=" + User_Id + "));");
            while (rs.next()) {
                ManageProjectPortfolioBean objBean = new ManageProjectPortfolioBean();
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                objBean.setTitle(rs.getString("Title"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setClient(rs.getString("client"));
                projectList.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in AssignedProjectServices/getAllAssignedProjectList()" + e);
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
    public List getWorkListForTeamMembers(int user_Id, int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = "select Phase_Id,ptp.Project_Id,ptp.ProjectTeam_Id, if(remarks is null ,' - - ',remarks)as remarks, concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,if(Actual_End_Date is null ,'N/A',substring(Actual_End_Date,1,10)) as Actual_End_Date,ptp.Percentage_Of_Work,pm.Phase,ptm.Title as Team from ProjectTeamMaster as ptm, ProjectPhases as pp,ProjectTeamPhases as ptp,PhasesMaster as pm where ptm.ProjectTeam_Id=ptp.ProjectTeam_Id and pm.ProjectPhases_Id=ptp.Phase_Id and  pp.ProjectPhases_Id = ptp.Phase_Id and ptp.Project_id=pp.Project_Id and ptp.Project_Id=" + project_Id + " and ptm.ProjectTeam_Id in (select ProjectTeam_Id from ProjectTeamDetails where User_Id=" + user_Id + ")  order by ProjectTeam_Id";
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                TeamMemberWorkBean objBean = new TeamMemberWorkBean();
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setActual_End_Date(rs.getString("Actual_End_Date"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setPercentage_Of_Work(rs.getInt("Percentage_Of_Work"));
                objBean.setPhase(rs.getString("Phase"));
                objBean.setRemarks(rs.getString("Remarks"));
                objBean.setTeam(rs.getString("Team"));
                objBean.setPhase_Id(rs.getInt("Phase_Id"));
                objBean.setProjectTeam_Id(rs.getInt("ProjectTeam_Id"));
                projectList.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in AssignedProjectServices/getWorkListForTeamMembers()" + e);
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
    public List getWorkListForTeamReportingHead(int user_Id, int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = "select Phase_Id,ptp.Project_Id,ptp.ProjectTeam_Id, if(remarks is null ,' - - ',remarks)as remarks, concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,if(Actual_End_Date is null ,'N/A',substring(Actual_End_Date,1,10)) as Actual_End_Date,ptp.Percentage_Of_Work,pm.Phase,ptm.Title as Team from ProjectTeamMaster as ptm, ProjectPhases as pp,ProjectTeamPhases as ptp,PhasesMaster as pm where ptm.ProjectTeam_Id=ptp.ProjectTeam_Id and pm.ProjectPhases_Id=ptp.Phase_Id and  pp.ProjectPhases_Id = ptp.Phase_Id and ptp.Project_id=pp.Project_Id and ptp.Project_Id=" + project_Id + " and ptm.ProjectTeam_Id in (select ProjectTeam_Id from ProjectTeamDetails where User_Id=" + user_Id + " and Is_Reporting_Head=1)  order by ProjectTeam_Id ";
            System.out.println(str);
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                TeamMemberWorkBean objBean = new TeamMemberWorkBean();
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setActual_End_Date(rs.getString("Actual_End_Date"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setPercentage_Of_Work(rs.getInt("Percentage_Of_Work"));
                objBean.setPhase(rs.getString("Phase"));
                objBean.setRemarks(rs.getString("Remarks"));
                objBean.setTeam(rs.getString("Team"));
                objBean.setPhase_Id(rs.getInt("Phase_Id"));
                objBean.setProjectTeam_Id(rs.getInt("ProjectTeam_Id"));
                projectList.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in AssignedProjectServices/getWorkListForTeamMembers()" + e);
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
    public boolean isReportingHead(int user_Id,int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        boolean b=false;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = "select * from ProjectTeamDetails where  User_Id="+user_Id+" and is_Reporting_Head=1 and ProjectTeam_Id in (select ProjectTeam_Id from ProjectTeamPhases where Project_id="+project_Id+")";
            rs = stmt.executeQuery(str);
            if (rs.next()) {
              b=true;
            }

        } catch (Exception e) {
            System.out.println("Exception in AssignedProjectServices/isReportingHead()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
            }

        }
        return b;
    }

    
}
