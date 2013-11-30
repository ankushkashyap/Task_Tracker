<%@page import="beans.module.ProjectDiscussionBean"%>
<%@page import="datalayer.module.ProjectDiscussionServices"%>
<%@page import="java.util.List"%>
<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%
    int project_Id = Integer.parseInt(request.getParameter("project_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    //-------------
    ProjectDiscussionServices objPDS = new ProjectDiscussionServices();
    
    
    List<ProjectDiscussionBean> list = null;
    if (request.getParameter("sbtnSearch") != null) {
        list = objPDS.getAllProjectDiscussionListByTopic(project_Id, request.getParameter("txtSearch"));
    } else {
        list = objPDS.getAllProjectDiscussionList(project_Id);
    }
%>

<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center" height="30" valign="top"><strong>Project Discussion</strong></td>
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
        <td><table>
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
                        <form action="ProjectDiscussion_mp.jsp" method="post" onsubmit="return ValidateManageProjectDiscussionForm()">
                            <table border="0" cellpadding="5" cellspacing="0" width="100%">
                                <tr>
                                    <td >

                                        <input type="hidden" name="project_Id" value="<%=project_Id%>">
                                        <input type="button" name="btnAddNewTopic" id="btnAddNewTopic" value="Add New Topic" class="button" onclick="window.location='AddProjectDiscussionTopic_mp.jsp?project_Id=<%=project_Id%>'"/></td>
                                    <td align="right"> <input type="text" name="txtSearch" id="txtSearch"  class="txtStyle"/>
                                        <input type="submit" name="sbtnSearch" id="sbtnSearch" value="Search" class="button"/>
                                        <input id="sbtnListAll" name="sbtnListAll" type="button" value="List All" onclick="window.location='ProjectDiscussion_mp.jsp?project_Id=<%=project_Id%>'" class="button"/>&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="1" cellpadding="5" cellspacing="0" width="100%" class="styled">
                            <tr class="header">
                                <th>Topic</th>
                                <th>Date</th>
                                <th>Created By</th>
                                <th>Responses</th>
                                <th>&nbsp;</th>
                            </tr>
                            <%
                                if (list.size() > 0) {
                                    for (int i = 0; i < list.size(); i++) {
                                        ProjectDiscussionBean objBean = list.get(i);

                                        String cssClass = "";
                                        if (i % 2 != 0) {
                                            cssClass = "alt";
                                        }
                            %>
                            <tr class="<%=cssClass%>">
                                <td><a href="ProjectDiscussionResponses_mp.jsp?project_Id=<%=project_Id%>&projectDiscussion_Id=<%=objBean.getProjectDiscussion_Id()%>"><%=objBean.getTopic()%></a></td>
                                <td><%=objBean.getPosted_Date()%></td>
                                <td><%=objBean.getPostedByName()%></td>
                                <td><%=objBean.getReponses()%></td>
                                <td><a href="ProjectDiscussionController.jsp?projectDiscussion_Id=<%=objBean.getProjectDiscussion_Id()%>&project_Id=<%=project_Id%>">Delete</a>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="5">NO Record Found</td>
                            </tr>
                            <%                                }
                            %>

                        </table>
                    </td>
                </tr>
                <tr>

                    <td align="left" >
                        <%
                        
                            if (session.getAttribute("User_Type").toString().equalsIgnoreCase("Team Member")) {
                        %>
                        <input id="btnBackToAssignedProjects" value="Back to Assigned Projects" onclick="window.location='AssignedProject_mp.jsp'"  name="btnBackToAssignedProjects" type="button" class="button"/>&nbsp;

                        <%                } else {
                        %>

                        <input id="btnBackToProjects" value="Back to Projects" name="btnBackToProjects"  onclick="window.location='ManageProjectPortfolio_mp.jsp'" type="button" class="button"/>&nbsp;
                        <%                    }
                        %>
                    </td>
                </tr>

            </table>
        </td>
    </tr>
</table>
