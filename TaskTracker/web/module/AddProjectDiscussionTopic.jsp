<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>


<%@page import="java.util.List"%> 
<%
    int project_Id = Integer.parseInt(request.getParameter("project_Id"));
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    AddEditProjectPortfolioBean objAEPPBean = objMPPS.viewProjectPortfolioByProjectId(project_Id);
    //-------------
%>
<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center" height="30" valign="top"><strong>Project Discussion - Add Topic</strong></td>
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
                        <td   align="left">
                            <form action="ProjectDiscussionController.jsp" method="post" onsubmit="return ValidateAddProjectDiscussionTopicForm()">
                                <table class="styledOuter" border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <strong>Discussion Topic</strong>
                                        </td>
                                        <td>
                                            <input type="hidden" name="hdnProjectId" value="<%=project_Id%>">
                                            <input type="text" name="txtDiscussionTopic" id="txtDiscussionTopic" value="" class="txtStyle"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDiscussionDescription" cols="20" rows="2" name="taDiscussionDescription"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td align="left" colspan="3">
                                            <input type="submit" id="sbtnPost" name="sbtnPostNewDiscussionTopic" value="Post" class="button"/>&nbsp;&nbsp;

                                            <input type="button" id="btnCancel" name="btnCancel" value="Cancel" class="button" onclick="window.location='ProjectDiscussion_mp.jsp?project_Id=<%=project_Id%>'"/>&nbsp;&nbsp;
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
                            </form>
                        </td>
                    </tr>

                </table>
            </fieldset>
        </td>
    </tr>
</table>
