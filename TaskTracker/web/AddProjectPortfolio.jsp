<%@page import="beans.module.PhaseMasterBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%@page import="java.util.List" %>
<%@page import="datalayer.module.ManageProjectPortfolioServices" %>
<%@page import="beans.module.ManageProjectTypeBean"%>

<%@page import="datalayer.module.ManageProjectTypeServices"%>
<%
    ManageProjectPortfolioServices obj = new ManageProjectPortfolioServices();
    List al = obj.getAllPhaseList();
    List<ManageProjectTypeBean> projectType = null;
    ManageProjectTypeServices objMPTS = new ManageProjectTypeServices();
    projectType = objMPTS.getAllProjectTypeList();
%>
<form action="ManageProjectPortfolioController.jsp" method="post" onsubmit="return ValidateAddProjectPortfolioForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Add Project Portfolio</strong></td>
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

            <td align="center"><fieldset>
                    <table border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td align="center">
                                <table cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td><strong>Title</strong></td>
                                        <td><input  id="txtTitle" name="txtTitle" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="23" rows="2" name="taDescription"></textarea></td>
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

                                                %>
                                                <option value="<%=objBean.getProjectType_Id()%>"  ><%=objBean.getTitle()%></option>
                                                <%
                                                            }
                                                        }
                                                    }%>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td><strong>Start Date</strong></td>
                                        <td><input readonly="readonly" id="txtStartDate" name="txtStartDate" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>End Date</strong></td>
                                        <td><input readonly="readonly"  id="txtEndDate" name="txtEndDate" type="text" value="" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Client</strong></td>
                                        <td><input  id="txtClient" name="txtClient" type="text" value="" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong><br>(Client)</td>
                                        <td><textarea id="taDescription" cols="23" rows="2" name="taDescription"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Status</strong></td>
                                        <td>
                                            <input value="1" type="radio" name="rbStatus" id="rbActive" checked="checked">Active
                                            <input value="0" type="radio" name="rbStatus" id="rbInactive" >Inactive
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

                                    </tr>
                                    <%
                                        if (al.size() > 0) {
                                            for (int i = 0; i < al.size(); i++) {
                                                PhaseMasterBean objBeam = (PhaseMasterBean) al.get(i);
                                    %>
                                    <tr>

                                        <td><input type="checkbox" name="chk" value="<%=objBeam.getProjectPhase_Id()%>" id="chk<%=objBeam.getProjectPhase_Id()%>"/> </td>
                                        <td> <%=objBeam.getPhase()%></td>
                                        <td><input class="txtStyle" type="text" name="txtPhaseStartDate<%=objBeam.getProjectPhase_Id()%>" id="txtPhaseStartDate<%=objBeam.getProjectPhase_Id()%>"/> </td>
                                        <td><input type="text" class="txtStyle" name="txtPhaseEndDate<%=objBeam.getProjectPhase_Id()%>" id="txtPhaseEndDate<%=objBeam.getProjectPhase_Id()%>"/> </td>


                                    </tr>
                                    <%
                                            }
                                        }
                                    %>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" >
                                <input id="sbtnSaveAndBacktoProject" value="Save &amp; Back to Project" name="sbtnSaveAndBacktoProject" type="submit" class="button"/>&nbsp;
                                <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>&nbsp;
                                <input  id="btnCancel" value="Cancel" name="btnCancel" type="button" class="button" onclick="window.location='ManageProjectPortfolio_mp.jsp'"/></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form>