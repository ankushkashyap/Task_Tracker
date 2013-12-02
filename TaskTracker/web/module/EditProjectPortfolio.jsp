 
<%@page import="datalayer.module.ProjectTaskSheetServices"%>
<%@page import="beans.module.ProjectPhaseBean"%>
<%@page import="beans.module.PhaseMasterBean"%>
<%@page import="beans.module.ManageProjectTypeBean"%>

<%@page import="datalayer.module.ManageProjectTypeServices"%>
<%@page import="java.util.List"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%
    int project_Id = Integer.parseInt(request.getParameter("project_id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    List al = objMPPS.getAllPhaseList();
    List<ManageProjectTypeBean> projectType = null;
    ManageProjectTypeServices objMPTS = new ManageProjectTypeServices();
    projectType = objMPTS.getAllProjectTypeList();
%>
<form action="ManageProjectPortfolioController.jsp" method="post" onsubmit="return ValidateEditProjectPortfolioForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Edit Project Portfolio</strong></td>
        </tr>
        <tr>
            <td align="left">
                <label id ="lblMsg">
                    lblMsg</label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                        <tr>
                            <td align="center">
                                <table border="1" cellpadding="5" cellspacing="0" rules="none" class="styledOuter">
                                    <tr>

                                        <td><strong>Title</strong></td>
                                        <td>
                                            <input type="hidden" name="hdnProjectId" id="bdnProjectId" value="<%=project_Id%>"/>
                                            <input  id="txtTitle" name="txtTitle" type="text" value="<%=objAEPPBean.getTxtTitle()%>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="23" rows="2" name="taDescription"><%=objAEPPBean.getTaDescription()%></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Project Type</strong></td>
                                        <td>
                                            <select id="ddlProjectType" name="ddlProjectType">
                                                <option value="0">Select</option>
                                                <%                        if (projectType.size() > 0) {
                                                        for (int i = 0; i < projectType.size(); i++) {
                                                            ManageProjectTypeBean objBean = projectType.get(i);
                                                            String str = "";
                                                            if (objBean.getIs_Active() == 1) {
                                                                if (objBean.getProjectType_Id() == objAEPPBean.getDdlProjectType()) {
                                                                    str = "selected";
                                                                }
                                                %>
                                                <option value="<%=objBean.getProjectType_Id()%>" <%=str%>><%=objBean.getTitle()%></option>
                                                <%
                                                            }
                                                        }
                                                    }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td><strong>Start Date</strong></td>
                                        <td><input readonly="readonly"  id="txtStartDate" name="txtStartDate" type="text" value="<%=objAEPPBean.getTxtStartDate()%>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>End Date</strong></td>
                                        <td><input readonly="readonly" id="txtEndDate" name="txtEndDate" type="text" value="<%=objAEPPBean.getTxtEndDate()%>" class="txtStyle"/></td>
                                    </tr>

                                    <tr>
                                        <td><strong>Client</strong></td>
                                        <td><input  id="txtClient" name="txtClient" type="text" value="<%=objAEPPBean.getTxtClient()%>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong><br>(Client)</td>
                                        <td><textarea id="taClientDescription" cols="23" rows="2" name="taClientDescription"><%=objAEPPBean.getTaClientDescription()%></textarea></td>
                                    </tr>
                                    <tr>

                                        <td><strong>Status</strong></td>
                                        <td>
                                            <input type="radio" name="rbStatus" id="rbActive" value="1" checked="checked">Active
                                            <input type="radio" name="rbStatus" id="rbInactive" value="0">Inactive
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table border="1" cellpadding="5" cellspacing="0" class="styled">
                                    <tr class="header">
                                        <th>&nbsp;</th>
                                        <th>Phase</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th> Actual End Date</th>
                                    </tr>
                                    <%
                                        if (al.size() > 0) {
                                            for (int i = 0; i < al.size(); i++) {
                                                PhaseMasterBean objBean = (PhaseMasterBean) al.get(i);
                                                ProjectPhaseBean objPPB = objMPPS.viewPhaseDetail(objBean.getProjectPhase_Id(), project_Id);
                                                if (objPPB == null) {
                                    %>
                                    <tr>

                                        <td><input type="checkbox" name="chk" value="<%=objBean.getProjectPhase_Id()%>" id="chk<%=objBean.getProjectPhase_Id()%>"/> </td>
                                        <td> <%=objBean.getPhase()%></td>
                                        <td><input class="txtStyle" type="text" name="txtPhaseStartDate<%=objBean.getProjectPhase_Id()%>" value="" id="txtPhaseStartDate<%=objBean.getProjectPhase_Id()%>"/> </td>
                                        <td><input type="text" class="txtStyle" name="txtPhaseEndDate<%=objBean.getProjectPhase_Id()%>" id="txtPhaseEndDate<%=objBean.getProjectPhase_Id()%>"/> </td>

                                        <td><input class="txtStyle" disabled="disabled" type="text"/> </td>

                                    </tr>
                                    <%
                                    } else {
                                    %>
                                    <tr> <td><input checked="checked" type="checkbox" name="chk" value="<%=objBean.getProjectPhase_Id()%>" id="chk<%=objBean.getProjectPhase_Id()%>"/> </td>
                                        <td> <%=objBean.getPhase()%></td>
                                        <td><input class="txtStyle" value="<%=objPPB.getStart_Date()%>" type="text" name="txtPhaseStartDate<%=objBean.getProjectPhase_Id()%>" id="txtPhaseStartDate<%=objBean.getProjectPhase_Id()%>"/> </td>
                                        <td><input class="txtStyle" value="<%=objPPB.getEnd_Date()%>" type="text" name="txtPhaseEndDate<%=objBean.getProjectPhase_Id()%>" id="txtPhaseEndDate<%=objBean.getProjectPhase_Id()%>"/> </td>
                                        <td><input class="txtStyle" disabled="disabled" value="<%=objPPB.getActual_End_Date()%>" type="text" name="txtPhaseActualEndDate<%=objBean.getProjectPhase_Id()%>" id="txtPhaseActualEndDate<%=objBean.getProjectPhase_Id()%>"/> </td>
                                    </tr>
                                    <%                                                }
                                            }
                                        }
                                    %>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td align="center" >
                                <input id="sbtnUpdateAndBacktoProject" value="Update &amp; Back to Project" name="sbtnUpdateAndBacktoProject" type="submit" class="button">&nbsp;
                                <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>&nbsp;
                                <input  id="btnCancel" value="Cancel" name="btnCancel" type="button" class="button" onclick="window.location='ManageProjectPortfolio_mp.jsp'"/></td>
                        </tr>
                        <tr>
                            <td align="center" >
                                <input id="sbtnUpdateAndProceedForTeam"  value="Update &amp; Proceed For Team" name="sbtnUpdateAndProceedForTeam" type="submit" class="button"/>&nbsp;
                                <input id="sbtnUpdateAndProceedForDocuments" value="Update &amp; Proceed For Documents" name="sbtnUpdateAndProceedForDocuments" type="submit" class="button"/>&nbsp;
                            </td>
                        </tr>
                    </table></fieldset>
            </td>
        </tr>
    </table>
</form>