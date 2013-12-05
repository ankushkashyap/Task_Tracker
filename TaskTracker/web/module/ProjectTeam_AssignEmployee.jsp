<%@page import="beans.module.AssignNewEmployeeBean"%>
<%@page import="datalayer.module.TeamWorkUpdatesBean"%>
<%@page import="beans.module.ManageProjectTeamBean"%>
<%@page import="java.util.List"%>
<%@page import="datalayer.module.ManageProjectTeamServices"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%
    int project_Id = Integer.parseInt(request.getParameter("project_Id"));
    int projectTeam_Id = Integer.parseInt(request.getParameter("projectTeam_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    //-------------

    ManageProjectTeamServices objMPTS = new ManageProjectTeamServices();
    ManageProjectTeamBean objBean = objMPTS.getProjectTeamByProjectTeamId(projectTeam_Id);
    List<AssignNewEmployeeBean> list = objMPTS.getAllEmployeeList(projectTeam_Id);
///

%>
<form action="ProjectTeamController.jsp" method="post" onsubmit="return ValidateAssignEmployeeForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Project Team _ Assign Employee</strong></td>
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
            <td align="center">
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
                &nbsp;              
            </td>
        </tr>
        <tr>
            <td>
                <fieldset>
                    <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                        <tr>
                            <td><strong>Team</strong></td>
                            <td>
                                <input type="hidden" name="hdnProjectTeam_Id" value="<%=projectTeam_Id%>">
                                <input type="hidden" name="hdnProject_Id" value="<%=project_Id%>">
                                <input  class="txtStyle" id="txtTeam" name="txtTeam" type="text" value="<%=objBean.getTeam()%>" readonly="readonly"/></td>
                            <td><strong>Last Update</strong></td>
                            <td><input  class="txtStyle" id="txtLastUpdate" name="txtLastUpdate" type="text" value="<%=objBean.getLast_Update()%>" readonly="readonly"/></td>
                        </tr>
                        <tr>
                            <td valign="top"><strong>Description</strong></td>
                            <td><textarea id="taDescription" cols="25" rows="3" name="taDescription" readonly="readonly"><%=objBean.getDescription()%></textarea></td>
                        </tr>
                        <tr>
                            <td><strong>Reporting Head</strong></td>
                            <td><input  class="txtStyle" id="txtReportingHead" disabled="disabled" name="txtReportingHead" type="text" value="<%=objBean.getReportingHead()%>" readonly="readonly"/></td>
                            <td><strong>No. Of Team Member</strong></td>
                            <td><input class="txtStyle"  id="txtTeamMember" name="txtTeamMember" type="text" value="<%=objBean.getTeam_Member()%>" readonly="readonly"/></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr>
            <td>
                <table border="1" cellpadding="5" cellspacing="0" class="styled">
                    <tr class="header">
                        <th>&nbsp;</th>
                        <th>Reporting Head</th>
                        <th>Employee</th>
                        <th>Department</th>
                        <th>Designation</th>
                        <th>DOJ</th>
                    </tr>  
                    <%
                        if (list.size() > 0) {
                            for (int i = 0; i < list.size(); i++) {
                                AssignNewEmployeeBean objANEBean = list.get(i);

                                String cssClass = "";
                                if (i % 2 != 0) {
                                    cssClass = "alt";
                                }

                                String isMember = "";
                                if (objANEBean.isMember()) {
                                    isMember = "checked";
                                }
                                String isHead = "";
                                if (objANEBean.getIsReportIng_Head() == 1) {
                                    isHead = "checked";
                                }
                    %>
                    
                    <tr class="<%=cssClass%>">
                        <td>
                            <input <%=isMember %> type="checkbox" value="<%=objANEBean.getEmployee_Id()%>" id="chkEmployeeId<%=objANEBean.getEmployee_Id()%>" name="chkEmployeeId"/>
                        </td>
                        <td>
                          <input <%=isHead %> type="radio" id="rbReportingHead<%=objANEBean.getEmployee_Id()%>" name="rbReportingHead"  value="<%=objANEBean.getEmployee_Id()%>"  />
                        </td>
                        <td><%=objANEBean.getEmployee_Name()%></td>
                        <td><%=objANEBean.getDepartment()%></td>
                        <td><%=objANEBean.getDesignation()%></td>
                        <td><%=objANEBean.getDoj()%></td>

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
                <input id="sbtnAssign" value="Assign" name="sbtnAssign" type="submit" class="button"/>&nbsp;
                <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>&nbsp;
                <input id="btnBackToProjectteam" onclick="window.location='ProjectTeam_mp.jsp?project_Id=<%=project_Id%>'" value="Back to Project Team" name="btnBackToProjectteam" type="button" class="button"/>&nbsp;
                <input id="btnBackToProjects" onclick="window.location='ManageProjectPortfolio_mp.jsp'" value="Back to Projects" name="btnBackToProjects" type="button" class="button"/>&nbsp;
            </td>
        </tr>

    </table>
</td>
</tr>
</table>
</form>