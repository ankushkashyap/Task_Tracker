/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

import beans.module.AddNewProjectDiscussionTopicBean;
import beans.module.ProjectDiscussionBean;
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
public class ProjectDiscussionServices {

    public List<ProjectDiscussionBean> getAllProjectDiscussionList(int project_Id) {
        Connection conn = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        List<ProjectDiscussionBean> list = new ArrayList<ProjectDiscussionBean>();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select a.*,b.Name from ProjectPostDiscussion as a inner join UserDetail as b on a.Posted_By=b.User_id and a.Project_Id=" + project_Id);
            while (rs.next()) {
                ProjectDiscussionBean objBean = new ProjectDiscussionBean();
                
                int projectDiscussion_Id = rs.getInt("ProjectDiscussion_Id");
                objBean.setProject_Id(rs.getInt("Project_Id"));
                objBean.setPosted_By(rs.getInt("Posted_By"));
                objBean.setPostedByName(rs.getString("Name"));
                objBean.setTopic(rs.getString("Topic"));
                objBean.setPosted_Date(rs.getString("Posted_Date"));
                objBean.setProjectDiscussion_Id(rs.getInt("ProjectDiscussion_Id"));
                rs1 = stmt1.executeQuery("select count(*) as reponses from ProjectReplyDiscussion where ProjectDiscussion_Id=" + projectDiscussion_Id + " group by ProjectDiscussion_Id");
                if (rs1.next()) {
                    objBean.setReponses(rs1.getInt("reponses"));
                }
                list.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in ProjectDiscussionServices/getAllProjectDiscussionList()" + e);
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
        return list;
    }

    public List<ProjectDiscussionBean> getAllProjectDiscussionListByTopic(int project_Id, String topic) {
        Connection conn = null;
        Statement stmt = null;
        Statement stmt1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        List<ProjectDiscussionBean> list = new ArrayList<ProjectDiscussionBean>();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            stmt1 = conn.createStatement();
            rs = stmt.executeQuery("select a.*,b.Name from ProjectPostDiscussion as a inner join UserDetail as b on a.Posted_By=b.User_id and a.Project_Id=" + project_Id + " and Topic like '%" + topic + "%'");
            while (rs.next()) {
                ProjectDiscussionBean objBean = new ProjectDiscussionBean();
                int project_id1 = rs.getInt("Project_Id");
                objBean.setProject_Id(project_Id);
                objBean.setPosted_By(rs.getInt("Posted_By"));
                objBean.setPostedByName(rs.getString("Name"));
                objBean.setTopic(rs.getString("Topic"));
                objBean.setPosted_Date(rs.getString("Posted_Date"));
                objBean.setProjectDiscussion_Id(rs.getInt("ProjectDiscussion_Id"));
                rs1 = stmt1.executeQuery("select count(*) as reponses from ProjectReplyDiscussion where ProjectDiscussion_Id=" + project_id1 + " group by ProjectDiscussion_Id");
                if (rs1.next()) {
                    objBean.setReponses(rs1.getInt("reponses"));
                }
                list.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in ProjectDiscussionServices/getAllProjectTeamList()" + e);
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

    public boolean addProjectDiscussioTopic(AddNewProjectDiscussionTopicBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectPostDiscussion(Project_Id,Posted_BY,Topic,Description,Posted_Date,Status) values(?,?,?,?,sysdate(),1);");
            pstmt.setInt(1, objBean.getHdnProjectId());
            pstmt.setInt(2, objBean.getPostedBy());
            pstmt.setString(3, objBean.getTxtDiscussionTopic());
            pstmt.setString(4, objBean.getTaDiscussionDescription());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addProjectDiscussioTopic()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public boolean deleteProjectDiscussioTopic(int projectDiscussion_Id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("delete from ProjectPostDiscussion where ProjectDiscussion_Id=?;");
            pstmt.setInt(1, projectDiscussion_Id);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in deleteProjectDiscussioTopic()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    //--------------------------
    public ProjectDiscussionBean getAllProjectDiscussionListByProjectDiscussionId(int projectDiscussion_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ProjectDiscussionBean objBean = new ProjectDiscussionBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select a.*,b.Name from ProjectPostDiscussion as a inner join UserDetail as b on a.Posted_By=b.User_id and ProjectDiscussion_Id=" + projectDiscussion_Id);
            while (rs.next()) {
                objBean.setDescription(rs.getString("Description"));
                objBean.setPosted_By(rs.getInt("Posted_By"));
                objBean.setPostedByName(rs.getString("Name"));
                objBean.setTopic(rs.getString("Topic"));
                objBean.setPosted_Date(rs.getString("Posted_Date"));
            }
        } catch (Exception e) {
            System.out.println("Exception in ProjectDiscussionServices/getAllProjectDiscussionListByProjectDiscussionId()" + e);
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

    public boolean addProjectDiscussionReply(AddNewProjectDiscussionTopicBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into ProjectReplyDiscussion(ProjectDiscussion_Id,Reply_By,Reply,Reply_Date,Status) values(?,?,?,sysdate(),1);");
            pstmt.setInt(1, objBean.getHdnProjectDiscussionId());
            pstmt.setInt(2, objBean.getPostedBy());
            pstmt.setString(3, objBean.getTaReply());

            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addProjectDiscussionReply()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    public List<ProjectDiscussionBean> getAllProjectDiscussionReplyList(int projectDiscussion_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<ProjectDiscussionBean> list = new ArrayList<ProjectDiscussionBean>();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select a.*,b.Name from ProjectReplyDiscussion as a inner join UserDetail as b on a.Reply_By=b.User_id and a.ProjectDiscussion_Id=" + projectDiscussion_Id);
            while (rs.next()) {
                ProjectDiscussionBean objBean = new ProjectDiscussionBean();
                objBean.setPostedByName(rs.getString("Name"));
                objBean.setPosted_Date(rs.getString("Reply_Date"));
                objBean.setReplay(rs.getString("Reply"));
                list.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in ProjectDiscussionServices/getAllProjectDiscussionReplyList()" + e);
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
