/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditTaskSheetBean;
import beans.module.ManageEmployeeBean;
import beans.module.ProjectPhaseBean;
import beans.module.ProjectTaskSheetBean;
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
public class ProjectTaskSheetServices {

    public List getAllProjectTaskSheetLIst(int phase_Id, int project_Id, int projectTeam_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = "select ProjectTaskSheet_Id,Task_Title,pts.Description,sm.Title as Status,pm.Title as Priority, concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration, Assign_Date,if(Actual_End_Date is null ,'N/A',substring(Actual_End_Date,1,10)) as Actual_End_Date from ProjectTaskSheet as pts ,StatusMaster as sm, PriorityMaster as pm where pts.Status_Id=sm.Status_Id and pm.Priority_Id=pts.Priority_Id and Project_Id=" + project_Id + " and ProjectTeam_Id=" + projectTeam_Id + " and Phase_Id=" + phase_Id;
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                ProjectTaskSheetBean objBean = new ProjectTaskSheetBean();

                objBean.setActual_End_Date(rs.getString("Actual_End_Date"));
                objBean.setAssign_Date(rs.getString("Assign_Date"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setPriority(rs.getString("Priority"));
                objBean.setStatus(rs.getString("Status"));
                objBean.setTask_Title(rs.getString("Task_Title"));
                objBean.setProjectTaskSheet_Id(rs.getInt("ProjectTaskSheet_Id"));

                objBean.setDuration(rs.getString("Duration"));
                list.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in ProjectTaskSheetServices/getAllProjectTaskSheetLIst()" + e);
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

    
    public AddEditTaskSheetBean viewProjectTaskSheet( int projectTaskSheet_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;AddEditTaskSheetBean objBean = new AddEditTaskSheetBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = "select ProjectTaskSheet_Id,Task_Title,Assign_Date,Description,Status_Id,Priority_Id, substring(Start_Date,1,10) as Start_Date,substring(End_Date,1,10) as End_Date, if(Actual_End_Date is null ,'',substring(Actual_End_Date,1,10)) as Actual_End_Date,User_Id from ProjectTaskSheet where ProjectTaskSheet_Id="+projectTaskSheet_Id;
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                

                objBean.setTxtActualEndDate(rs.getString("Actual_End_Date"));
                objBean.setDdlAssignTo(rs.getInt("User_Id"));
                
                objBean.setTaDescription(rs.getString("Description"));
                objBean.setDdlPriority(rs.getInt("Priority_Id"));
                objBean.setDdlStatus(rs.getInt("Status_Id"));
                objBean.setTxtTask(rs.getString("Task_Title"));

                objBean.setTxtStartDate(rs.getString("Start_Date"));
                objBean.setTxtEndDate(rs.getString("End_Date"));
                objBean.setTxtAssignDate(rs.getString("Assign_Date"));
            }

        } catch (Exception e) {
            System.out.println("Exception in ProjectTaskSheetServices/viewProjectTaskSheet()" + e);
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
    public ProjectPhaseBean viewPhaseDetails(int phase_Id, int project_Id, int projectTeam_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ProjectPhaseBean objBean = new ProjectPhaseBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = " select substring(Start_Date,1,10) as Start_Date,substring(End_Date,1,10) as End_Date ,if(pp.Actual_End_Date is null ,'N/A',substring(pp.Actual_End_Date,1,10)) as Actual_End_Date, pm.Phase,ptp.Percentage_Of_Work,if(ptp.remarks is null,'',ptp.remarks) as remarks ,substring(ptp.Update_Date,1,10) as Update_Date from ProjectTeamPhases as ptp inner join  ProjectPhases as pp on pp.Project_Id=ptp.Project_Id and pp.ProjectPhases_Id=ptp.Phase_Id  inner join PhasesMaster as pm on pm.ProjectPhases_Id=ptp.Phase_Id and ptp.Phase_Id=" + phase_Id + " and ptp.Project_Id=" + project_Id + " and ProjectTeam_Id=" + projectTeam_Id;
            rs = stmt.executeQuery(str);
            while (rs.next()) {

                objBean.setActual_End_Date(rs.getString("Actual_End_Date"));
                objBean.setEnd_Date(rs.getString("End_Date"));
                objBean.setPercentage_Of_Work(rs.getInt("Percentage_Of_Work"));
                objBean.setRemarks(rs.getString("Remarks"));
                objBean.setStart_Date(rs.getString("Start_Date"));
                objBean.setUpdate_Date(rs.getString("Update_Date"));
                objBean.setPhase_Name(rs.getString("Phase"));
            }

        } catch (Exception e) {
            System.out.println("Exception in ProjectTaskSheetServices/getAllProjectTaskSheetLIst()" + e);
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

    public boolean updatePhaseWork(ProjectPhaseBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update  ProjectTeamPhases set  Percentage_Of_Work=?,Remarks=? where Project_Id=? and Phase_Id=? and ProjectTeam_Id=?");
            pstmt.setInt(1, objBean.getPercentage_Of_Work());
            pstmt.setString(2, objBean.getRemarks());
            pstmt.setInt(3, objBean.getProject_Id());
            pstmt.setInt(4, objBean.getPhase_Id());
            pstmt.setInt(5, objBean.getProjectTeam_Id());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in updatePhaseWork()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public boolean updatePhaseForReportingHead(ProjectPhaseBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update  ProjectPhases set  Actual_End_Date=? where Project_Id=? and ProjectPhases_Id=?");
            pstmt.setString(1, objBean.getActual_End_Date());
            pstmt.setInt(2, objBean.getProject_Id());
            pstmt.setInt(3, objBean.getPhase_Id());

            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in updatePhaseWork()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public List getAllProjectTeamMemberList(int projectTeam_Id, int user_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String str = " select User_Id,Name from UserDetail where User_Id in(select User_id from ProjectTeamDetails where ProjectTeam_Id=" + projectTeam_Id + " and User_Id!=" + user_Id + ")";
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                ManageEmployeeBean objBean = new ManageEmployeeBean();
                objBean.setUser_Id(rs.getInt("User_Id"));
                objBean.setName(rs.getString("Name"));
                list.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in ProjectTaskSheetServices/getAllProjectTeamMemberList()" + e);
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

    public boolean addNewTaskSheet(AddEditTaskSheetBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {

            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectTaskSheet(Task_Title, "
                    + "Description, Status_Id, Priority_Id, Project_Id,"
                    + " Phase_Id, ProjectTeam_Id, User_Id,  Start_Date, "
                    + "End_Date,Assign_Date) values (?,?,?,?,?,?,?,?,?,?,sysdate())");

            pstmt.setString(1, objBean.getTxtTask());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getDdlStatus());
            pstmt.setInt(4, objBean.getDdlPriority());
            pstmt.setInt(5, objBean.getHdnProject_Id());
            pstmt.setInt(6, objBean.getHdnPhase_Id());
            pstmt.setInt(7, objBean.getHdnProjectTeam_Id());
            pstmt.setInt(8, objBean.getDdlAssignTo());
            pstmt.setString(9, objBean.getTxtStartDate());
            pstmt.setString(10, objBean.getTxtEndDate());

            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("exception in addNewTaskSheet()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;

    }

    public boolean updateTaskSheetForReportingHead(AddEditTaskSheetBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {

            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update ProjectTaskSheet  set Task_Title=?, "
                    + "Description=?, Status_Id=?, Priority_Id=?,"
                    + "User_Id=?,  Start_Date=?, "
                    + "End_Date=? where ProjectTaskSheet_Id=? ");


            pstmt.setString(1, objBean.getTxtTask());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getDdlStatus());
            pstmt.setInt(4, objBean.getDdlPriority());
            pstmt.setInt(5, objBean.getDdlAssignTo());
            pstmt.setString(6, objBean.getTxtStartDate());
            pstmt.setString(7, objBean.getTxtEndDate());
            pstmt.setInt(8, objBean.getHdnProjectTaskSheet_Id());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("exception in updateTaskSheetForReportingHead()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;

    }
    public boolean updateTaskSheetForTeamMember(AddEditTaskSheetBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {

            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update ProjectTaskSheet  set "
                    + "Status_Id=?,Actual_End_Date=? "
                    + " where ProjectTaskSheet_Id=? ");


            pstmt.setInt(1, objBean.getDdlStatus());
            pstmt.setString(2, objBean.getTxtActualEndDate());
            pstmt.setInt(3, objBean.getHdnProjectTaskSheet_Id());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("exception in updateTaskSheetForReportingHead()" + e);
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
