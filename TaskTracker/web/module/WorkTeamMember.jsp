<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%@page import="beans.module.TeamMemberWorkBean"%>
<%@page import="datalayer.module.AssignedProjectServices"%>
<%@page import="beans.module.ManageProjectPortfolioBean"%>
<%@page import="java.util.List"%>
<%

    List<TeamMemberWorkBean> al = null;
    int user_Id = (Integer) session.getAttribute("User_Id");
    int project_Id = Integer.parseInt( request.getParameter("project_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    AssignedProjectServices objAPS = new AssignedProjectServices();
    al = objAPS.getWorkListForTeamMembers(user_Id, project_Id);
%>
<table border="0" cellpadding="5 " cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>Work - Team Member</strong></td>
    </tr>
    <tr>
        <td align="center">
            <table border="0" cellpadding="3" cellspacing="0">
                <tr>
                    <td align="center">
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
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <hr>
        </td>
    </tr>
    <tr>
        <td align="left">
            <strong>Phases</strong>
        </td>
    </tr>
    <tr>
        <td>
            <table border="1" cellpadding="5" cellspacing="0" class="styled">
                <tr class="header">
                    <th>Team</th>
                    <th>Phase</th>
                    <th>Duration</th>
                    <th>Actual End<br> Date</th>
                    <th>Amount of <br>Work</th>
                    <th>Remarks</th>
                    <th>&nbsp;</th>
                </tr>

                <%
                    if (al.size() > 0) {
                        for (int i = 0; i < al.size(); i++) {
                            TeamMemberWorkBean objBean = al.get(i);
                            String cssClass = "";
                            if (i % 2 != 0) {
                                cssClass = "alt";
                            }
                            int percent = objBean.getPercentage_Of_Work();
                            String color = "";
                            if (percent <= 30) {
                                color = "red";
                            } else if (percent > 30 && percent <= 70) {
                                color = "yellow";
                            } else {
                                color = "green";
                            }
                %>
                <tr class="<%=cssClass%>">
                    <td><%=objBean.getTeam()%></td>
                    <td><%=objBean.getPhase()%></td>
                    <td><%=objBean.getDuration()%></td>
                    <td><%=objBean.getActual_End_Date()%></td>
                    <td>

                        <table>
                            <tr>
                                <td>
                                    <div style="min-width: 0.5px;width:<%=2 * percent%>px;background-color: <%=color%>;height:10px;min-height:10px;max-height:10px;">&nbsp;</div>
                                </td>
                                <td>
                                    <b> <%=percent%> %
                                    </b>
                                </td>
                            </tr>    
                        </table>
                    </td>
                    <td><%=objBean.getRemarks()%></td>

                    <td><a href="TaskSheet_TeamMember_mp.jsp?projectTeam_Id=<%=objBean.getProjectTeam_Id()%>&project_Id=<%=objBean.getProject_Id()%>&phase_Id=<%=objBean.getPhase_Id()%>">Task Sheet</a></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="7">NO Record Found</td>
                </tr>
                <%                                }
                %>

            </table> 
        </td>
    </tr>
    <tr>
        <td>
            <input id="btnBackToAssignedProjects" value="Back to Assigned Projects" onclick="window.location='AssignedProject_mp.jsp'"  name="btnBackToAssignedProjects" type="button" class="button"/>&nbsp;
        </td>
    </tr>
</table>