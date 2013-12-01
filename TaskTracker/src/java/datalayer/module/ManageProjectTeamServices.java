/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditTeamBean;
import beans.module.AssignNewEmployeeBean;
import beans.module.AssignNewEmployeeBean;
import beans.module.ManageProjectTeamBean;
import datalayer.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author parwinder
 */
public class ManageProjectTeamServices {

    public List getAllProjectTeamList(int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        Statement stmt1 = null;
        Statement stmt2 = null;

        ResultSet rs = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;

        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            stmt2 = conn.createStatement();
            rs = stmt.executeQuery("select * from ProjectTeamPhases where Project_Id=" + project_Id + " group by ProjectTeam_Id");
            while (rs.next()) {
                ManageProjectTeamBean objBean = new ManageProjectTeamBean();
                int projectTeam_Id = rs.getInt("ProjectTeam_ID");
                objBean.setProjectTeam_Id(projectTeam_Id);

                String phases = "";
                int teamMember = 0;
                rs1 = stmt1.executeQuery(" select Phase from ProjectTeamPhases p, PhasesMaster pm where pm.ProjectPhases_Id=p.Phase_Id and ProjectTeam_Id=" + projectTeam_Id);
                while (rs1.next()) {
                    phases = phases + rs1.getString("Phase") + " , ";
                }
                rs2 = stmt2.executeQuery("select title,Description ,count(*) as member from ProjectTeamDetails as p ,ProjectTeamMaster as pm where p.ProjectTeam_Id=pm.ProjectTeam_Id and  p.ProjectTeam_Id=" + projectTeam_Id);

                //rs2 = stmt2.executeQuery(select title,Description ,(select count(*) as member from ProjectTeamDetails as p where ProjectTeam_Id="+projectTeam_Id+") as member from  ProjectTeamMaster where ProjectTeam_Id="+projectTeam_Id);
                while (rs2.next()) {
                    objBean.setTeam_Member(rs2.getInt("member"));
                    objBean.setDescription(rs2.getString("Description"));
                    objBean.setTeam(rs2.getString("title"));
                }
                objBean.setPhase(phases.substring(0, phases.lastIndexOf(",")));
                list.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in ManageProjectTeamServices/getAllProjectTeamList()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                stmt1.close();
                stmt2.close();
                rs.close();
                rs1.close();
                rs2.close();
            } catch (Exception e) {
            }

        }
        return list;
    }

    public ManageProjectTeamBean getProjectTeamByProjectTeamId(int projectTeam_Id) {
        Connection conn = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        ManageProjectTeamBean objBean = new ManageProjectTeamBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select title,Description ,Update_Date,count(*) as member from ProjectTeamDetails as p ,ProjectTeamMaster as pm where p.ProjectTeam_Id=pm.ProjectTeam_Id and  p.ProjectTeam_Id=" + projectTeam_Id);
            if (rs.next()) {
                objBean.setTeam_Member(rs.getInt("member"));
                objBean.setDescription(rs.getString("Description"));
                objBean.setLast_Update(rs.getString("Update_Date"));
                objBean.setTeam(rs.getString("title"));
                rs1 = stmt1.executeQuery("select Name from UserDetail as a inner join ProjectTeamDetails as b on a.User_Id=b.User_Id where ProjectTeam_Id=" + projectTeam_Id + " and Is_Reporting_Head=1");
                if (rs1.next()) {
                    objBean.setReportingHead(rs1.getString("Name"));
                } else {
                    objBean.setReportingHead("");
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in ManageProjectTeamServices/getProjectTeamByProjectTeamId()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                stmt1.close();
                rs.close();
                rs1.close();
            } catch (Exception e) {
            }

        }
        return objBean;
    }

    public boolean addProjectTeamAndProjectTeamPhases(AddEditTeamBean objBean, String arrPhaseIds[]) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectTeamMaster(Title,Description,Update_Date) values(?,?,sysDate())");
            pstmt.setString(1, objBean.getTxtTeam());
            pstmt.setString(2, objBean.getTaDescription());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                pstmt = conn.prepareStatement("select max(ProjectTeam_Id) as ptId from ProjectTeamMaster");
                int ptId = 0;
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    ptId = rs.getInt("ptId");
                }
                for (int j = 0; j < arrPhaseIds.length; j++) {
                    pstmt = conn.prepareStatement("insert into ProjectTeamPhases(ProjectTeam_Id,Project_Id,Phase_Id,Update_Date) values(?,?,?,sysdate())");
                    pstmt.setInt(1, ptId);
                    pstmt.setInt(2, objBean.getHdnProjectId());
                    pstmt.setInt(3, Integer.parseInt(arrPhaseIds[j]));
                    int k = pstmt.executeUpdate();
                    if (k > 0) {
                        result = true;
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("exception in addProjectTeamAndProjectTeamPhases()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return result;
    }

    public List<TeamWorkUpdatesBean> getAllTeamWorkUpdates(int projectTeam_Id) {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        List<TeamWorkUpdatesBean> list = new ArrayList<TeamWorkUpdatesBean>();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(" select concat(substring(Start_Date,1,10),' - ',substring(End_Date,1,10)) as Duration ,if(pp.Actual_End_Date is null ,'N/A',substring(pp.Actual_End_Date,1,10)) as Actual_End_Date, pm.Phase,ptp.Percentage_Of_Work,if(ptp.remarks is null,'',ptp.remarks) as remarks ,substring(ptp.Update_Date,1,10) as Update_Date,ptm.Title from ProjectTeamPhases as ptp inner join ProjectTeamMaster as ptm on ptp.ProjectTeam_Id=ptm.ProjectTeam_Id inner join PhasesMaster as pm on pm.ProjectPhases_Id=ptp.Phase_Id inner join  ProjectPhases as pp on pp.Project_Id=ptp.Project_Id and pp.ProjectPhases_Id=ptp.Phase_Id where ptp.ProjectTeam_Id=" + projectTeam_Id);
            while (rs.next()) {
                TeamWorkUpdatesBean objBean = new TeamWorkUpdatesBean();

                objBean.setPercentage_Of_Work(rs.getInt("Percentage_Of_Work"));
                objBean.setPhase_Name(rs.getString("Phase"));
                objBean.setProjectTeam_Title(rs.getString("Title"));
                objBean.setDuration(rs.getString("Duration"));
                objBean.setActual_End_Date(rs.getString("Actual_End_Date"));
                objBean.setRemarks(rs.getString("Remarks"));
                objBean.setUpdate_Date(rs.getString("Update_Date"));
                list.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in  /getAllTeamWorkUpdates()" + e);
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

    public List<AssignNewEmployeeBean> getAllEmployeeList(int projectTeam_Id) {
        Connection con = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        AssignNewEmployeeBean objBean;
        ArrayList<AssignNewEmployeeBean> al = new ArrayList<AssignNewEmployeeBean>();
        try {
            con = ConnectDB.connect();
            stmt = con.createStatement();
            stmt1 = con.createStatement();
            String str = "select Employee_Id,a.Name,if(Department is null ,' - - ',Department) as Department,if(Designation is null ,' - - ',Designation)as Designation,if(doj is null,' - - ',substring(doj,1,10))as doj from UserDetail as a inner join EmployeeDetail as b on a.User_Id=b.Employee_Id inner join UserMaster as um on a.User_id=um.User_Id and status=1";
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                objBean = new AssignNewEmployeeBean();
                objBean.setEmployee_Id(rs.getInt("Employee_Id"));
                objBean.setEmployee_Name(rs.getString("Name"));
                objBean.setDepartment(rs.getString("Department"));
                objBean.setDesignation(rs.getString("Designation"));
                objBean.setDoj(rs.getString("Doj"));
                rs1 = stmt1.executeQuery("select max(Is_Reporting_Head) as is_Head from ProjectTeamDetails  where User_id=" + rs.getInt("Employee_Id") + " and ProjectTeam_Id=" + projectTeam_Id + " group by User_Id");
                if (rs1.next()) {
                    objBean.setIsReportIng_Head(rs1.getInt("is_Head"));
                } else {
                    objBean.setMember(false);
                }
                al.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageProjectTeamServices/getAllEmployeeList() : " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
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

    public boolean addProjectTeamMembers(int projectTeam_Id, String employee_Id[], int reporting_Head) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("delete from ProjectTeamDetails where ProjectTeam_Id=" + projectTeam_Id);
            pstmt.executeUpdate();
            int j = 0;
            for (int i = 0; i < employee_Id.length; i++) {
                pstmt = conn.prepareStatement("insert into ProjectTeamDetails (ProjectTeam_Id,User_Id,Assign_Date,Is_Reporting_Head) values (?, ?,sysdate(),0 )");
                pstmt.setInt(1, projectTeam_Id);
                pstmt.setInt(2, Integer.parseInt(employee_Id[i]));
                j = pstmt.executeUpdate();
            }
            if (j > 0) {
                pstmt = conn.prepareStatement("update    ProjectTeamDetails set Is_Reporting_Head=1 where User_Id=?");
                pstmt.setInt(1, reporting_Head);
                int k = pstmt.executeUpdate();
                if (k > 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in addProjectTeamMembers() : " + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return result;
    }
}