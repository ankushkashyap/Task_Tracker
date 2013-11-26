<%@page import="beans.module.ManageStatusBean"%>
<%@page import="datalayer.module.ManageStatusServices"%>
<%@page import="datalayer.module.ManagePrioritiesServices"%>
<%@page import="beans.module.ManagePrioritiesBean"%>
<%@page import="beans.module.ManageEmployeeBean"%>
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
    int user_Id = (Integer) session.getAttribute("User_Id");
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
    List<ManageEmployeeBean> empList = obj.getAllProjectTeamMemberList(projectTeam_Id, user_Id);

    ProjectPhaseBean objPPB = obj.viewPhaseDetails(phase_Id, project_Id, projectTeam_Id);
    List<ManagePrioritiesBean> prioritiesList = null;
    ManagePrioritiesServices objMPS = new ManagePrioritiesServices();
    prioritiesList = objMPS.getAllPrioritiesList();
    ///      



    ManageStatusServices objMSS = new ManageStatusServices();
    List<ManageStatusBean> statusList = null;
    statusList = objMSS.getAllStatusList();
%>
<form action="TaskSheetController.jsp" method="post" onsubmit="return ValidateAddTaskSheetForm()">
    <table border="1" cellpadding="5" cellspacing="0" align="center" rules="none" class="styledOuter">
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
                        <td >
                            <fieldset>
                                <legend><strong><em>Phase Information</em></strong></legend>
                                <table class="styledOuter" border="0" cellpadding="5" cellspacing="0" width="80%">

                                    <tr>
                                        <td >
                                            <strong>Phase</strong>
                                        </td>
                                        <td >
                                            <input type="hidden" name="hdnProjectTeam_Id" value="<%=projectTeam_Id%>">
                                            <input type="hidden" name="hdnPhase_Id" value="<%=phase_Id%>">
                                            <input type="hidden" name="hdnProject_Id" value="<%=project_Id%>">
                                            <input type="text" class="txtStyle" id="txtPhase" name="txtPhase" value="<%=objPPB.getPhase_Name()%>" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <strong>Start Date</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtPhaseStartDate" name="txtPhaseStartDate" value="<%=objPPB.getStart_Date()%>" readonly="readonly"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td >
                                            <strong>End Date</strong>
                                        </td>
                                        <td >
                                            <input type="text" class="txtStyle" id="txtPhaseEndDate" name="txtPhaseEndDate" value="<%=objPPB.getEnd_Date()%>" readonly="readonly"/>
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
                        <td >
                            <fieldset>
                                <legend><strong><em>Add Task Information </em></strong></legend>
                                <table border="0" cellpadding="5" cellspacing="0" width="100%" class="styledOuter">                                
                                    <tr>
                                        <td><strong>Task</strong></td>
                                        <td><input  id="txtTask" name="txtTask" type="text" value="" class="txtStyle"/></td>
                                    </tr><tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea  id="taDescription" name="taDescription" rows="2" cols="25"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Assign To</strong></td>
                                        <td>
                                            <select id="ddlAssignTo" name="ddlAssignTo" onchange="getEmployee(this.value)">

                                                <option value="0" selected="selected">Select</option>
                                                <%
                                                    for (int i = 0; i < empList.size(); i++) {
                                                        ManageEmployeeBean objEmployeeBean = empList.get(i);
                                                %>
                                                <option value="<%=objEmployeeBean.getUser_Id()%>" selected="selected"><%=objEmployeeBean.getName()%></option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>

                                    </tr>

                                    <tr>
                                        <td colspan="6">
                                            <div id="divEmp">
                                                <table>
                                                    <tr>
                                                        <td width="87"><strong>DOJ</strong></td>
                                                        <td>
                                                            <input id="txtDOJ" name="txtDOJ" value="" type="text" readonly="readonly" class="txtStyle"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td><strong>Email Id</strong></td>
                                                        <td>
                                                            <input id="txtEmailId" name="txtEmailId" value="" type="text" readonly="readonly" class="txtStyle"/>
                                                        </td>
                                                        <td><strong>Phone</strong></td>
                                                        <td>
                                                            <input id="txtPhone" name="txtPhone" value="" type="text" readonly="readonly" class="txtStyle"/>
                                                        </td>
                                                    </tr>
                                                </table>        
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>

                                    </tr>
                                    <tr>
                                        <td><strong>Priority</strong></td>
                                        <td>
                                            <select name="ddlPriority" id="ddlPriority">
                                                 <option value="0" selected="selected">Select</option>
                                                <%
                                                    for (int i = 0; i < prioritiesList.size(); i++) {
                                                        ManagePrioritiesBean objPBean = prioritiesList.get(i);



                                                %>
                                                <option value="<%=objPBean.getPriority_Id()%>" ><%=objPBean.getTitle()%></option>

                                                <%
                                                    }
                                                %>
                                            </select>
                                        </td>
                                        <td><strong>Status</strong></td>
                                        <td>
                                            <select id="ddlStatus" name="ddlStatus" >
                                                 <option value="0" selected="selected">Select</option>
                                                <% if (statusList.size() > 0) {
                                                        for (int i = 0; i < statusList.size(); i++) {
                                                            ManageStatusBean objBean = statusList.get(i);

                                                %>
                                                <option value="<%=objBean.getStatus_Id()%>" ><%=objBean.getTitle()%></option>
                                                <%
                                                        }
                                                    }
                                                %>                                       </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Start Date</strong></td>
                                        <td>
                                            <input id="txtStartDate" name="txtStartDate" value="" type="text" class="txtStyle"/>
                                        </td>
                                        <td><strong>End Date</strong></td>
                                        <td>
                                            <input id="txtEndDate" name="txtEndDate" value="" type="text" class="txtStyle"/>
                                        </td>
                                    </tr>

                                </table>
                            </fieldset>
                        </td>
                    </tr>

                    <tr>
                        <td align="center">
                            <input type="submit" id="sbtnAssign" name="sbtnAssign" value="Assign" class="button"/>&nbsp;
                            <input type="reset" id="rbtnReset" name="rbtnReset" value="Reset" class="button"/>&nbsp;
                            <input onclick="window.location='TaskSheet_ReportingHead_mp.jsp?project_Id=<%= project_Id%>&projectTeam_Id=<%= projectTeam_Id%>&phase_Id=<%=phase_Id%>'" type="button" id="btnCancel" name="btnCancel" value="Cancel" class="button"/>&nbsp;
                            <input onclick="window.location='TaskAllocation_ReportingHead_mp.jsp?project_Id=<%=project_Id%>'" class="button" id="btnBackToTaskAllocation" value="Back to Task Allocation" name="btnBackToTaskAllocation" type="button">&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>