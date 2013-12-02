<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<%@page import="beans.module.ManageProjectPortfolioBean"%>
<%@page import="java.util.List"%>
<%
    String title = request.getParameter("txtSearch");
    List<ManageProjectPortfolioBean> al = null;
    ManageProjectPortfolioServices objMPPS = new ManageProjectPortfolioServices();
    if (title == null) {
        
        al = objMPPS.getAllProjectPortfolioList();
    } else {
         al = objMPPS.getAllProjectPortfolioListByTitle(title);
        //al = ManageOperatorService.getAllOperators(name, loginName);
    }
%>
<table style="min-width: 700px;" border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>
                Manage Project Portfolio
            </strong>
        </td>
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
        <td>
            <form action="ManageProjectPortfolio_mp.jsp" method="post" onsubmit="return ValidateManageProjectPortfolioForm()">
                <table border="0" cellpadding="5" cellspacing="0" width="100%" >
                    <tr>
                        <td align="left">
                            <input id="btnAddProject" name="btnAddProject" type="button" value="Add Project" class="button" onclick="window.location='AddProjectPortfolio_mp.jsp'"/>
                        </td>
                        <td align="right">
                            <input id="txtSearch" name="txtSearch" type="text" class="txtStyle"/>&nbsp;&nbsp;&nbsp;

                            <input id="sbtnSearch" name="sbtnSearch" type="submit" value="Search" class="button"/>&nbsp;        
                            <input id="sbtnListAll" name="sbtnListAll" type="button" value="List All" onclick="window.location='ManageProjectPortfolio_mp.jsp'" class="button"/>&nbsp;
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table border="1" cellpadding="5" cellspacing="0" class="styled">
                <tr class="header">
                    <th>Project Title</th>
                    <th>Duration</th>
                    <th>Client</th>
                    <th>Status</th>
                    <th>&nbsp;</th>
                    <th>&nbsp;</th>
                </tr>
                <%
                    if (al.size() > 0) {
                        for (int i = 0; i < al.size(); i++) {
                            ManageProjectPortfolioBean objBean = al.get(i);
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
                    <td><%=objBean.getTitle()%></td>
                    <td><%=objBean.getDuration()%></td>
                    <td><%=objBean.getClient()%></td>
                    <td><%=status%></td>

                    <td><a href="EditProjectPortfolio_mp.jsp?project_id=<%=objBean.getProject_Id()%>">View & Edit</a></td>
                    <td><a href="ProjectDiscussion_mp.jsp?project_Id=<%=objBean.getProject_Id()%>">Discussion</a></td>
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
</table>