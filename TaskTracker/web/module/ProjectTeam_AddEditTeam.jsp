 
<%@page import="java.util.List"%>
<%@page import="datalayer.module.ManageProjectTeamServices"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%
    int project_Id = Integer.parseInt(request.getParameter("project_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    //-------------

    List<AddEditProjectPortfolioBean> list = objMPPS.getAllProjectPhasesByProjectId(project_Id);


%>
<form action="ProjectTeamController.jsp" method="post" onsubmit="return ValidateAddTeamForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Project Team _ Add/Edit Team</strong></td>
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
                <table border="0" cellpadding="5" cellspacing="0">
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

                            <hr>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <table class="styledOuter">
                                    <tr>
                                        <td><strong>Team</strong></td>
                                        <td>
                                            <input type="hidden" name="hdnProjectId" value="<%=project_Id%>">
                                            <input  id="txtTeam" name="txtTeam" type="text" value=""  class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="25" rows="3" name="taDescription" ></textarea></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phase
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table width="100%" border="1" cellpadding="5" cellspacing="0" class="styled">

                                <tr class="header">
                                    <th>&nbsp;</th>
                                    <th>Phase</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Actual End Date</th>
                                </tr>
                                <%
                                    if (list.size() > 0) {
                                        for (int i = 0; i < list.size(); i++) {
                                            AddEditProjectPortfolioBean objBean = list.get(i);
                                %>
                                <tr>

                                    <td><input type="checkbox" name="chkPhaseId" value="<%=objBean.getProjectPhase_Id()%>" id="chk<%=objBean.getProjectPhase_Id()%>"/> </td>
                                    <td> <%=objBean.getTxtPhase()%></td>
                                    <td><%=objBean.getTxtPhaseStartDate()%> </td>
                                    <td><%=objBean.getTxtPhaseStartDate()%> 
                                    </td>
                                    <td><%=objBean.getTxtPhaseActualEndDate()%> 
                                    </td>


                                </tr>
                                <%
                                        }
                                    }
                                %>
                               
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" >
                            <input id="sbtnSave" value="Save" name="sbtnSave" type="submit" class="button"/>&nbsp;
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