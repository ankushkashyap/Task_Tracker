<%@page import="beans.module.ProjectPhaseBean"%>
<%@page import="beans.module.ManageProjectTeamBean"%>
<%@page import="datalayer.module.ManageProjectTeamServices"%>
<%@page import="beans.module.ProjectTaskSheetBean"%>
<%@page import="datalayer.module.ProjectTaskSheetServices"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%@page import="java.util.List"%>
<%

    List<ProjectTaskSheetBean> list = null;
    int phase_Id = Integer.parseInt(request.getParameter("phase_Id"));
    int projectTeam_Id = Integer.parseInt(request.getParameter("projectTeam_Id"));
    int project_Id = Integer.parseInt(request.getParameter("project_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    //------------


    ManageProjectTeamServices objMPTS = new ManageProjectTeamServices();
    ManageProjectTeamBean objMPTB = objMPTS.getProjectTeamByProjectTeamId(projectTeam_Id);



    ProjectTaskSheetServices obj = new ProjectTaskSheetServices();
    list = obj.getAllProjectTaskSheetLIst(phase_Id, project_Id, projectTeam_Id);


    ProjectPhaseBean objPPB = obj.viewPhaseDetails(phase_Id, project_Id, projectTeam_Id);
%>
<form action="#" method="post">
    <table border="1" cellpadding="5" cellspacing="0" align="center" rules="none">
        <tr>
            <td align="center" height="30" valign="top"><strong>Task Sheet - Team Member</strong></td>
        </tr>
        <tr>
             <td align="left">
                <%
                String msg="";
                        
if(request.getParameter("msg")!=null)              {
    msg=request.getParameter("msg");
}  
%>
                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
        </tr>
        <tr>
            <td >

                <table border="0" cellpadding="1" cellspacing="0">
                    <tr>
                        <td  >
                            <fieldset>
                                <legend><strong><em>Project Information</em></strong></legend>
                                <table  border="0" cellpadding="5" cellspacing="0" rules="none" class="styledOuter" >
                                    <tr>
                                        <td><strong>Project</strong></td>
                                        <td><input  id="txtProject" name="txtProject" type="text" value="<%=objAEPPBean.getTxtTitle()%>" readonly="readonly"  class="txtStyle"/></td>
                                        <td><strong>Type</strong></td>
                                        <td><input  id="txtType" name="txtType" type="text" value="<%=objAEPPBean.getDdlProjectTypeName()%>" readonly="readonly" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="23" rows="2" name="taDescription" readonly="readonly"><%=objAEPPBean.getTaDescription()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Start Date</strong></td>
                                        <td><input  id="txtStartDt" name="txtStartDt" type="text" value="<%=objAEPPBean.getTxtStartDate()%>" readonly="readonly" class="txtStyle"/></td>

                                        <td><strong>End Date</strong></td>
                                        <td><input  id="txtEndDt" name="txtEndDt" type="text" value="<%=objAEPPBean.getTxtEndDate()%>" readonly="readonly" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Client</strong></td>
                                        <td><input  id="txtClient" name="txtClient" type="text" value="<%=objAEPPBean.getTxtClient()%>" readonly="readonly" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Client<br>Description</strong></td>
                                        <td><textarea id="taClientDescription" cols="23" rows="2" name="taClientDescription" readonly="readonly"><%=objAEPPBean.getTaClientDescription()%></textarea></td>
                                    </tr>
                                </table>
                            </fieldset> 
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <fieldset>
                                <legend><strong><em>Phase Information</em></strong></legend>
                                <table class="styledOuter" border="0" cellpadding="5" cellspacing="0" width="80%">

                                    <tr>
                                        <td >
                                            <strong>Phase</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtPhase" name="txtPhase" value="<%=objPPB.getPhase_Name()%>" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <strong>Start Date</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtStartDate" name="txtStartDate" value="<%=objPPB.getStart_Date()%>" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <strong>End Date</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtEndDate" name="txtEndDate" value="<%=objPPB.getEnd_Date()%>" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <strong>Actual End Date</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtActualEndDate" name="txtActualEndDate" value="<%=objPPB.getActual_End_Date()%>" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <strong>Percentage Of Works</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtPercentageOfWork" name="txtPercentageOfWork" value="<%=objPPB.getPercentage_Of_Work()%>%" readonly="readonly"/>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td><hr/></td>
                    </tr>
                    <tr>
                        <td><fieldset>
                                <legend><strong><em>Team Information</em></strong></legend>
                                <table border="0" cellpadding="5" cellspacing="0" width="100%">

                                    <tr>
                                        <td><strong>Team</strong></td>
                                        <td><input  id="txtTeam" class="txtStyle" name="txtTeam" type="text" value="<%=objMPTB.getTeam()%>" readonly="readonly"/></td>
                                    </tr><tr>
                                        <td><strong>Last Update</strong></td>
                                        <td><input  id="txtLastUpdate" class="txtStyle" name="txtLastUpdate" type="text" value="<%=objMPTB.getLast_Update()%>" readonly="readonly"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Reporting Head</strong></td>
                                        <td><input  id="txtReportingHead" class="txtStyle" name="txtReportingHead" type="text" value="<%=objMPTB.getReportingHead()%>" readonly="readonly"/></td>
                                    </tr><tr>
                                        <td><strong>No. Of Team Member</strong></td>
                                        <td><input  id="txtTeamMember" class="txtStyle" name="txtTeamMember" type="text" value="<%=objMPTB.getTeam_Member()%>" readonly="readonly"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="1" cellpadding="5" cellspacing="0" class="styled">
                                <tr>
                                    <td colspan="9">
                                        <input class="button" type="button" id="btnAddNewTask" name="btnAddNewTask" value="Add New Task" onclick="window.location='AddTaskSheet_mp.jsp?project_Id=<%=project_Id%>&projectTeam_Id=<%=projectTeam_Id%>&phase_Id=<%=phase_Id%>'"/>
                                    </td>
                                </tr>
                                <tr class="header">
                                    <th>Task</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Priority</th>
                                    <th>Duration</th>
                                    <th>Assign Date</th>
                                    <th>Actual End Date</th>
                                    <th>&nbsp;</th>
                                </tr>



                                <%
                                    if (list.size() > 0) {
                                        for (int i = 0; i < list.size(); i++) {
                                            ProjectTaskSheetBean objBean = list.get(i);

                                            String cssClass = "";
                                            if (i % 2 != 0) {
                                                cssClass = "alt";
                                            }
                                %>
                                <tr class="<%=cssClass%>">
                                    <td><%=objBean.getTask_Title()%></td>
                                    <td><%=objBean.getDescription()%></td>
                                    <td><%=objBean.getStatus()%></td>
                                    <td><%=objBean.getPriority()%></td>
                                    <td><%=objBean.getDuration()%></td>
                                    <td><%=objBean.getAssign_Date()%></td>
                                    <td><%=objBean.getActual_End_Date()%></td>
                                    <td>
                                        <a href="EditTaskSheet_mp.jsp?project_Id=<%=project_Id%>&projectTeam_Id=<%=projectTeam_Id%>&phase_Id=<%=phase_Id%>&projectTaskSheet_Id=<%=objBean.getProjectTaskSheet_Id()%>&projectTaskSheet_Id=<%=objBean.getProjectTaskSheet_Id() %>" >Edit</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6">NO Task Allocation</td>
                                </tr>
                                <%                                        }
                                %>

                                                                      
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input onclick="window.location='TaskAllocation_ReportingHead_mp.jsp?project_Id=<%=project_Id  %>'" class="button" id="btnBackToTaskAllocation" value="Back to Task Allocation" name="btnBackToTaskAllocation" type="button">&nbsp;
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</form>