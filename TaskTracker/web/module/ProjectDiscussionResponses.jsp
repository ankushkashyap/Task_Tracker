<%@page import="org.apache.coyote.RequestGroupInfo"%>
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
    int projectDiscussion_Id = Integer.parseInt(request.getParameter("projectDiscussion_Id"));
    ProjectDiscussionBean objBean = objPDS.getAllProjectDiscussionListByProjectDiscussionId(projectDiscussion_Id);
    List<ProjectDiscussionBean> list = objPDS.getAllProjectDiscussionReplyList(projectDiscussion_Id);
     
%>
<form action="ProjectDiscussionController.jsp" method="post" onsubmit="return ValidateViewProjectDiscussionResponsesForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Project Discussion Responses</strong></td>
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
                <table border="0" cellpadding="3" cellspacing="0">
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
                        <td colspan="3" align="left">
                            <table class="styled">
                                <tr>
                                    <td>
                                        <strong> Topic</strong>
                                    </td>
                                    <td>
                                        <input type="text" name="txtTopic" id="txtTopic" value="<%=objBean.getTopic()%>" readonly="readonly"  class="txtStyle"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top"><strong>Description</strong></td>
                                    <td><textarea id="taDescription" cols="23" rows="2" name="taDescription" readonly="readonly"><%=objBean.getDescription()%></textarea></td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Created By</strong>
                                    </td>
                                    <td>
                                        <%=objBean.getPostedByName()%>
                                    </td>
                                    <td>
                                        <strong>Create Date</strong>
                                    </td>
                                    <td>
                                        <%=objBean.getPosted_Date()%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <%
                        if (list.size() > 0) {
                            for (int i = 0; i < list.size(); i++) {
                                ProjectDiscussionBean objPDBean = list.get(i);

                                String cssClass = "";
                                if (i % 2 != 0) {
                                    cssClass = "alt";
                                }
                    %>
                    <tr>
                        <td>
                            <table class="styled">
                                <tr class="alt">
                                    <td>
                                        <strong> Reply Date</strong>
                                    </td>
                                    <td>
                                        <%=objPDBean.getPosted_Date()%>
                                    </td>
                                    <td>
                                        <strong> Reply By</strong>
                                    </td>
                                    <td>
                                        <%=objPDBean.getPostedByName()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="vertical-align: top;" ><strong>Reply</strong></td>
                                    <td colspan="4"><textarea style="border-style:solid 1px; " cols="50" rows="4"><%=objPDBean.getReplay()%></textarea></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <%
                            }
                        }%>
                    <tr>
                        <td>
                            <table class="styled">
                                <tr>
                                    <td style="vertical-align: top;"><strong>Reply</strong></td>
                                    <td>
                                        <input type="hidden" name="hdnProjectDiscussionId" value="<%=projectDiscussion_Id%>">
                                        <input type="hidden" name="hdnProjectId" value="<%=project_Id%>">
                                        <textarea id="taReply" cols="40" rows="3" name="taReply" ></textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" colspan="3">
                            <input type="submit" id="sbtnPost" name="sbtnPostResponse" value="Post Response" class="button"/>&nbsp;&nbsp;
                            <input type="button" id="btnCancel" onclick="window.location='ProjectDiscussion_mp.jsp?project_Id=<%=project_Id%>'" name="btnCancel" value="Cancel" class="button"/>&nbsp;&nbsp;
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
</form>