<%@page import="beans.module.PhaseSheetOfWorkForProjectBean"%>
<%@page import="datalayer.module.WorkDoneForProjectServices"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%@page import="beans.module.ManageProjectPortfolioBean"%>
<%@page import="java.util.List"%>
<%
    int project_Id = Integer.parseInt(request.getParameter("project_id"));
    WorkDoneForProjectServices objWDFPS = new WorkDoneForProjectServices();

    List<PhaseSheetOfWorkForProjectBean> list = objWDFPS.getAllPhaseSheetOfWorkForProject(project_Id);
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);

%>
<form action="#" method="post">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Phase Sheet Of work For Project</strong></td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <table border="1" cellpadding="5" cellspacing="0" rules="none" class="styled" >
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
                <table border="1" cellpadding="5" cellspacing="0" width="100%" class="styled">
                    <tr class="header">         
                        <th>Phase</th>
                        <th>Amount of Work</th>
                        <th>Team</th>                              
                    </tr>
                    <%
                        if (list.size() > 0) {
                            for (int i = 0; i < list.size(); i++) {
                                PhaseSheetOfWorkForProjectBean objBean = list.get(i);
                                String cssClass = "";
                                if (i % 2 != 0) {
                                    cssClass = "alt";
                                }
                                int percent = objBean.getPercentage_Of_Work();
                                String color = "";
                                if (percent <= 30) {
                                    color = "red";
                                }else if(percent>30 && percent<=70)
                                {
                                    color="yellow";
                                }else
                                                                       {
                                    color="green";
                                }
                                                       %>
                    <tr class="<%=cssClass%>">
                        <td><%=objBean.getPhase()%></td>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <div style="min-width: 0.5px;width:<%=2 * percent%>px;background-color: <%=color%>;height:10px;min-height:10px;max-height:10px;">&nbsp;</div>
                                    </td>
                                    <td>
                                        <%=percent%>%
                                    </td>
                                </tr>    
                            </table>
                        </td>
                        <td><%=objBean.getProjectTeam_Title()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="3" align="center">NO Record Found</td>
                    </tr>
                    <%                                }
                    %>

                </table>
            </td></tr>
    </table>
</form>