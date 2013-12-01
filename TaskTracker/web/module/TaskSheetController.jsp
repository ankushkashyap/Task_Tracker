<%@page import="datalayer.module.ProjectTaskSheetServices"%>
<%@page import="datalayer.module.ManageProjectTeamServices"%>
<%@page import="beans.module.ManageProjectTeamBean"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<jsp:useBean id="objBean" class="beans.module.AddEditTaskSheetBean">
    <jsp:setProperty name="objBean" property="*" />
</jsp:useBean>
<%

    String url = "";
    if (request.getParameter("sbtnUpdateTaskSheet_TeamMember") != null) {


        ProjectTaskSheetServices obj = new ProjectTaskSheetServices();
        boolean b = obj.updateTaskSheetForTeamMember(objBean);
        if (b) {
            url = "TaskSheet_TeamMember_mp.jsp?msg=Task assign Succesfully&project_Id=" + objBean.getHdnProject_Id() + "&projectTeam_Id=" + objBean.getHdnProjectTeam_Id() + "&phase_Id=" + objBean.getHdnPhase_Id();
        } else {
            url = "EditTaskSheetTeamMember_mp.jsp?msg=Assigned task Updeted  Succesfully&project_Id=" + objBean.getHdnProject_Id() + "&projectTeam_Id=" + objBean.getHdnProjectTeam_Id() + "&phase_Id=" + objBean.getHdnPhase_Id()+"&projectTaskSheet_Id="+objBean.getHdnProjectTaskSheet_Id();
        }

    }
    if (request.getParameter("sbtnAssign") != null) {

        ProjectTaskSheetServices obj = new ProjectTaskSheetServices();

        boolean b = obj.addNewTaskSheet(objBean);
        if (b) {
            url = "TaskSheet_ReportingHead_mp.jsp?msg=Task assign Succesfully&project_Id=" + objBean.getHdnProject_Id() + "&projectTeam_Id=" + objBean.getHdnProjectTeam_Id() + "&phase_Id=" + objBean.getHdnPhase_Id();
        } else {
            url = "AddTaskSheet_mp.jsp?msg=task not assigned&project_Id=" + objBean.getHdnProject_Id() + "&projectTeam_Id=" + objBean.getHdnProjectTeam_Id() + "&phase_Id=" + objBean.getHdnPhase_Id();
        }
    }
    if (request.getParameter("sbtnUpdate") != null) {

        ProjectTaskSheetServices obj = new ProjectTaskSheetServices();

        boolean b = obj.updateTaskSheetForReportingHead(objBean);
        if (b) {
            url = "TaskSheet_ReportingHead_mp.jsp?msg=Assigned task Updeted  Succesfully&project_Id=" + objBean.getHdnProject_Id() + "&projectTeam_Id=" + objBean.getHdnProjectTeam_Id() + "&phase_Id=" + objBean.getHdnPhase_Id();
        } else {
            url = "AddTaskSheet_mp.jsp?msg=Record not Updated&project_Id=" + objBean.getHdnProject_Id() + "&projectTeam_Id=" + objBean.getHdnProjectTeam_Id() + "&phase_Id=" + objBean.getHdnPhase_Id() + "&projectTaskSheet_Id=" + objBean.getHdnProjectTaskSheet_Id();
        }
    }
    response.sendRedirect(url);
%>