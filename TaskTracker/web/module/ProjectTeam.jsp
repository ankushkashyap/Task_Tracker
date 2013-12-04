<%@page import="beans.module.ManageProjectTeamBean"%>
<%@page import="java.util.List"%>
<%@page import="datalayer.module.ManageProjectTeamServices"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%
    int project_Id = Integer.parseInt(request.getParameter("project_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    //-------------

    ManageProjectTeamServices objMPTS = new ManageProjectTeamServices();
    List<ManageProjectTeamBean> list = objMPTS.getAllProjectTeamList(project_Id);


%>
<form action="#" method="post">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Project Team</strong></td>
        </tr>
        <tr>
            <td align="left">
                <%
                    String msg = "";

                    if (request.getParameter("msg") != null) {
                        msg = request.getParameter("msg");
                    }
                %>
                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <table border="0" cellpadding="5" cellspacing="0">
                    <tr>
                        <td>
                            <fieldset>
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
                        <td>

                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" id="btnAddTeam" name="btnAddTeam" value="Add Team" onclick="window.location='ProjectTeam_AddEditTeam_mp.jsp?project_Id=<%=project_Id%>'" class="button"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table border="1" cellpadding="5" cellspacing="0" class="styled">
                                <tr class="header">
                                    <th>Team</th>
                                    <th>Description</th>
                                    <th>Phase</th>
                                    <th>No. Of Team Member</th>
                                    <th>&nbsp;</th>
                                    <th>&nbsp;</th>
                                     
                                </tr>
                                <%
                                    if (list.size() > 0) {
                                        for (int i = 0; i < list.size(); i++) {
                                            ManageProjectTeamBean objBean = list.get(i);

                                            String cssClass = "";
                                            if (i % 2 != 0) {
                                                cssClass = "alt";
                                            }
                                %>
                                <tr class="<%=cssClass%>">
                                    <td><%=objBean.getTeam()%></td>
                                    <td><%=objBean.getDescription()%></td>
                                    <td><%=objBean.getPhase()%></td>
                                    <td><%=objBean.getTeam_Member()%></td>
                                  
                                    <td>
                                        <a href="ProjectTeam_AssignEmployee_mp.jsp?project_Id=<%=project_Id%>&projectTeam_Id=<%=objBean.getProjectTeam_Id()%>"">Team</a>
                                    </td>
                                    <td>
                                        <a href="TeamWorkUpdates_mp.jsp?project_Id=<%=project_Id%>&projectTeam_Id=<%=objBean.getProjectTeam_Id()%>">Work</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                } else {
                                %>
                                <tr>
                                    <td colspan="6">NO Record Found</td>
                                </tr>
                                <%                                }
                                %>

                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td align="left" >
                            <input class="button" id="btnBackToProjects" value="Back to Projects" name="btnBackToProjects" onclick="window.location='ManageProjectPortfolio_mp.jsp'" type="button">&nbsp;
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</form>