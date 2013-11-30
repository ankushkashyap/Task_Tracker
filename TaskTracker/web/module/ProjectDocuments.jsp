
<%@page import="beans.module.ProjectDocumentsBean"%>
<%@page import="datalayer.module.ProjectDocumentsServices"%>
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
    ProjectDocumentsServices objPDS = new ProjectDocumentsServices();
    List<ProjectDocumentsBean> list = objPDS.getAllProjectDocumentsSList(project_Id);
    session.setAttribute("project_Id", project_Id);
    String msg = "";
    if ((request.getParameter("msg")) != null) {
        msg = request.getParameter("msg");
    }
%>

<table border="0" cellpadding="5" cellspacing="0" align="center">
    <tr>
        <td align="center" height="30" valign="top"><strong>Project Documents</strong></td>
    </tr>
    <tr>
        <td align="left">
            <label style="color: red;" id ="lblMsg">
                <%=msg%>
            </label>
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
                        <table class="styled" border="1">
                            <tr class="header">
                                <th>Document</th>
                                <th>Description</th>
                                <th>Upload On</th>
                                <th>Change</th>
                            </tr>
                            <%
                                if (list.size() > 0) {
                                    for (int i = 0; i < list.size(); i++) {
                                        ProjectDocumentsBean objBean = list.get(i);

                                        String cssClass = "";
                                        if (i % 2 != 0) {
                                            cssClass = "alt";
                                        }
                                        String status = "Inactive";
                                        if (objBean.getIs_Active() == 1) {
                                            status = "Active";
                                        }
                            %>
                            <tr class="<%=cssClass%>">
                                <td>  <a href="../ProjectDocumentDownloadServlet?path=<%=objBean.getDocument_Path()%>" title="click here to download"><%=objBean.getDocument_Title()%></a></td>
                                <td><%=objBean.getDescription()%></td>
                                <td><%=objBean.getUpdate_Date()%></td>
                                <td><%=status%>&nbsp;&nbsp; 

                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="4">NO Record Found</td>
                            </tr>
                            <%                                }
                            %>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td>
                        <form action="../UploadProjectDocumentServlet#" method="post" enctype="multipart/form-data" onsubmit="return ValidateAddProjectDocumentForm()" >
                            <table class="styled">
                                <tr>
                                    <td><strong>Title</strong></td>
                                    <td>
                                        <input type="hidden" name="hdnProjectId" id="hdnProjectId" value="<%=project_Id%>">
                                        <input  id="txtTitle" name="txtTitle" type="text" class="txtStyle"/></td>
                                </tr>
                                <tr>
                                    <td><strong>Select</strong></td>

                                    <td><input  id="flBrowse" name="flBrowse" type="file" accept="image/*"></td>
                                </tr>
                                <tr>
                                    <td valign="top"><strong>Description</strong></td>
                                    <td><textarea id="taDescription" cols="23" rows="2" name="taDescription"></textarea></td>
                                    <td><input type="submit" id="sbtnUpload" name="sbtnUpload" value="Upload" class="button"/>
                                    </td><td><input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/></td>
                                </tr>
                            </table>
                        </form>

                    </td>
                </tr>

                <tr>
                    <td align="left" >
                        <input id="btnBackToProjects" value="Back to Projects" name="btnBackToProjects" type="button" onclick="window.location='ManageProjectPortfolio_mp.jsp'" class="button">&nbsp;
                    </td>
                </tr>

            </table>
        </td>
    </tr>
</table>
