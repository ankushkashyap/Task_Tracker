<jsp:useBean id="objBean" class="beans.module.AddNewProjectDiscussionTopicBean">
    <jsp:setProperty name="objBean" property="*" />
</jsp:useBean>
<%@page import="datalayer.module.ProjectDiscussionServices"%>
<%

    String url = "";

    ProjectDiscussionServices objPDS = new ProjectDiscussionServices();
    if (request.getParameter("sbtnPostNewDiscussionTopic") != null) {
%>


<%
        objBean.setPostedBy((Integer) session.getAttribute("User_Id"));
        boolean b = objPDS.addProjectDiscussioTopic(objBean);
        if (b) {
            url = "ProjectDiscussion_mp.jsp?project_Id=" + objBean.getHdnProjectId() + "&msg=Discussion Topic added successfully";
        } else {

            url = "AddProjectDiscussionTopicAdminOperator_mp.jsp?project_Id=" + objBean.getHdnProjectId() + "&msg=Failed to add new discussion topic!";
        }
    } else if (request.getParameter("projectDiscussion_Id") != null) {
        int pdid = Integer.parseInt(request.getParameter("projectDiscussion_Id"));
        int pid = Integer.parseInt(request.getParameter("project_Id"));
        boolean b = objPDS.deleteProjectDiscussioTopic(pdid);
        if (b) {
            url = "ProjectDiscussion_mp.jsp?project_Id=" + pid + "&msg=Discussion Topic deleted successfully";
        } else {
            url = "ProjectDiscussion_mp.jsp?project_Id=" + pid + "&msg=Failed to delete discussion topic!";
        }
    }else     if (request.getParameter("sbtnPostResponse") != null) {
        objBean.setPostedBy((Integer) session.getAttribute("User_Id"));
         boolean b = objPDS.addProjectDiscussionReply(objBean);
        if (b) {
            url = "ProjectDiscussionResponses_mp.jsp?project_Id=" + objBean.getHdnProjectId() + "&projectDiscussion_Id="+objBean.getHdnProjectDiscussionId()+"&msg=Discussion Topic added successfully";
        } else {

            url = "ProjectDiscussionResponses_mp.jsp?project_Id=" + objBean.getHdnProjectId() + "&projectDiscussion_Id="+objBean.getHdnProjectDiscussionId()+"&msg=Failed to add new discussion topic!";
        }
    }
    response.sendRedirect(url);
%>