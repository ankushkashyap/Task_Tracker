/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddEditProjectPortfolioBean;
import beans.module.ManageProjectPortfolioBean;
import beans.module.PhaseMasterBean;
import beans.module.ProjectPhaseBean;
import datalayer.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import sun.reflect.generics.tree.Tree;

/**
 *
 * @author parwinder
 */
public class ManageProjectPortfolioServices {

    public List getAllProjectPortfolioList() {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Project_Id,Is_Active,Title,concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,Client  from ProjectMaster;");
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
            System.out.println("Exception in ManageProjectPortfolioServices/getAllProjectPortfolioList()" + e);
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

    public List<ManageProjectPortfolioBean> getAllProjectPortfolioListByTitle(String title) {
        Connection conn = null;
        Statement stmt = null;

        ResultSet rs = null;

        List projectList = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select Project_Id,Is_Active,Title,concat(substring(Start_Date,1,10),' to ',substring(End_Date,1,10)) as Duration,Client  from ProjectMaster where Title like '%" + title + "%'");
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
            System.out.println("Exception in ManageProjectPortfolioServices/getAllProjectPortfolioList()" + e);
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

    public AddEditProjectPortfolioBean viewProjectPortfolioByProjectId(int project_id) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        AddEditProjectPortfolioBean objBean = new AddEditProjectPortfolioBean();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = " select pm.*,ptm.Title as Project_Type from ProjectMaster as pm inner join ProjectTypeMaster as ptm on pm.ProjectType_Id=ptm.ProjectType_Id and pm.Project_Id=" + project_id;
            rs = st.executeQuery(str);
            while (rs.next()) {
                objBean.setHdnProjectId(rs.getInt("Project_Id"));
                objBean.setDdlProjectType(rs.getInt("ProjectType_ID"));
                objBean.setDdlProjectTypeName(rs.getString("Project_Type"));
                objBean.setRbStatus(rs.getInt("Is_Active"));
                objBean.setTxtClient(rs.getString("Client"));
                objBean.setTaClientDescription(rs.getString("Client_Description"));
                objBean.setTaDescription(rs.getString("Description"));
                objBean.setTxtEndDate(rs.getString("End_Date"));
                objBean.setTxtStartDate(rs.getString("Start_Date"));
                objBean.setTxtTitle(rs.getString("Title"));
                objBean.setTxtClient(rs.getString("Client"));
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageProjectPortfolioServices/viewProjectPortfolioByProjectId() : " + e);
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

    public List getAllPhaseList() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List al = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from PhasesMaster");
            while (rs.next()) {
                PhaseMasterBean objBeam = new PhaseMasterBean();
                objBeam.setPhase(rs.getString("Phase"));
                objBeam.setProjectPhase_Id(rs.getInt("ProjectPhases_Id"));
                al.add(objBeam);
            }
        } catch (Exception e) {
            System.out.println("Exception in getAllPhaseList()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return al;
    }

    public int addProjectPortfolio(AddEditProjectPortfolioBean objBean, int update_By) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int result = -1;
        Statement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectMaster(Title,Description,ProjectType_Id,Start_Date,End_Date,Client,Client_Description,Is_Active,Update_By,Update_Date) values(?,?,?,?,?,?,?,?,?,sysdate())");
            pstmt.setString(1, objBean.getTxtTitle());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getDdlProjectType());
            pstmt.setString(4, objBean.getTxtStartDate());
            pstmt.setString(5, objBean.getTxtEndDate());
            pstmt.setString(6, objBean.getTxtClient());
            pstmt.setString(7, objBean.getTaClientDescription());
            pstmt.setInt(8, objBean.getRbStatus());
            pstmt.setInt(9, update_By);



            int i = pstmt.executeUpdate();
            if (i > 0) {
                stmt = conn.createStatement();
                rs = stmt.executeQuery("select max(Project_Id) as Project_Id from ProjectMaster");
                if (rs.next()) {
                    result = rs.getInt("Project_Id");
                }
            }
        } catch (Exception e) {
            System.out.println("Exception in addProjectPortfolio()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public boolean updateProjectPortfolio(AddEditProjectPortfolioBean objBean, int update_By) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        Statement stmt = null;
        ResultSet rs = null;

        try {

            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update ProjectMaster set"
                    + " Title=?,Description=?,ProjectType_Id=?,Start_Date=?,"
                    + "End_Date=?,Client=?,Client_Description=?,Is_Active=?,Update_By=?,Update_Date=sysdate() where Project_Id=?");
            pstmt.setString(1, objBean.getTxtTitle());
            pstmt.setString(2, objBean.getTaDescription());
            pstmt.setInt(3, objBean.getDdlProjectType());
            pstmt.setString(4, objBean.getTxtStartDate());
            pstmt.setString(5, objBean.getTxtEndDate());
            pstmt.setString(6, objBean.getTxtClient());
            pstmt.setString(7, objBean.getTaClientDescription());
            pstmt.setInt(8, objBean.getRbStatus());
            pstmt.setInt(9, update_By);
            pstmt.setInt(10, objBean.getHdnProjectId());



            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addProjectPortfolio()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public boolean addProjectPhasess(AddEditProjectPortfolioBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectPhases(ProjectPhases_Id,Project_Id,Start_Date,End_Date) values(?,?,?,?)");
            pstmt.setInt(1, objBean.getProjectPhase_Id());
            pstmt.setInt(2, objBean.getHdnProjectId());
            pstmt.setString(3, objBean.getTxtPhaseStartDate());
            pstmt.setString(4, objBean.getTxtPhaseEndDate());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("exception in addProjectPhasess()" + e);
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

    public boolean updateProjectPhasess(AddEditProjectPortfolioBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();


            pstmt = conn.prepareStatement("select *  from ProjectPhases where Project_Id=?  and ProjectPhases_Id=?");
            pstmt.setInt(1, objBean.getHdnProjectId());
            pstmt.setInt(2, objBean.getProjectPhase_Id());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                pstmt = conn.prepareStatement("insert into ProjectPhases(ProjectPhases_Id,Project_Id,Start_Date,End_Date) values(?,?,?,?)");
                pstmt.setInt(1, objBean.getProjectPhase_Id());
                pstmt.setInt(2, objBean.getHdnProjectId());
                pstmt.setString(3, objBean.getTxtPhaseStartDate());
                pstmt.setString(4, objBean.getTxtPhaseEndDate());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = true;
                }
            } else {
                pstmt = conn.prepareStatement("update ProjectPhases set Start_Date=?,End_Date=? where ProjectPhases_Id=? and Project_Id=?");
                pstmt.setInt(3, objBean.getProjectPhase_Id());
                pstmt.setInt(4, objBean.getHdnProjectId());
                pstmt.setString(1, objBean.getTxtPhaseStartDate());
                pstmt.setString(2, objBean.getTxtPhaseEndDate());
                int i = pstmt.executeUpdate();
                if (i > 0) {
                    result = true;
                }

            }
        } catch (Exception e) {
            System.out.println("exception in updateProjectPhasess()" + e);
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

    public List getAllProjectPhasesByProjectId(int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List list = new ArrayList();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();

            rs = stmt.executeQuery(" select a.ProjectPhases_Id,substring(Start_Date,1,10) as Start_Date,substring(End_Date,1,10) as End_Date,substring(Actual_End_Date,1,10) as Actual_End_Date,b.Phase from ProjectPhases a inner join PhasesMaster as b on a.ProjectPhases_ID=b.ProjectPhases_Id where Project_Id=" + project_Id);
            while (rs.next()) {
                AddEditProjectPortfolioBean objBean = new AddEditProjectPortfolioBean();
                objBean.setProjectPhase_Id(rs.getInt("ProjectPhases_Id"));
                objBean.setTxtPhase(rs.getString("Phase"));
                objBean.setTxtPhaseStartDate(rs.getString("Start_Date"));
                objBean.setTxtPhaseEndDate(rs.getString("End_Date"));
                if (rs.getString("Actual_End_Date") != null) {
                    objBean.setTxtPhaseActualEndDate(rs.getString("Actual_End_Date"));
                } else {
                    objBean.setTxtPhaseActualEndDate("N/A");
                }
                list.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in  ManageProjectPortfolioServices/getAllProjectPhasesByProjectId()" + e);
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

    public ProjectPhaseBean viewPhaseDetail(int phase_Id, int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ProjectPhaseBean objBean = null;
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            String q = "select substring(Start_Date,1,10) as Start_Date,substring(End_Date,1,10) as End_Date ,if(Actual_End_Date is null ,'N/A',substring(Actual_End_Date,1,10)) as Actual_End_Date from ProjectPhases where Project_Id=" + project_Id + " and ProjectPhases_Id=" + phase_Id;
            rs = stmt.executeQuery(q);
            while (rs.next()) {
                objBean = new ProjectPhaseBean();
                objBean.setActual_End_Date(rs.getString("Actual_End_Date"));
                objBean.setEnd_Date(rs.getString("End_Date"));
                objBean.setStart_Date(rs.getString("Start_Date"));
            }

        } catch (Exception e) {
            System.out.println("Exception in ManageProjectPortfolioServices/getAllProjectTaskSheetLIst()" + e);
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
}