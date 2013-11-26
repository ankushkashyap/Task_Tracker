<%@page import="datalayer.module.ManageProjectTypeServices"%>
<%@page import="beans.module.ManageProjectTypeBean"%>
<%@page import="java.util.List"%>
<%
    List<ManageProjectTypeBean> prioritiesList = null;
    ManageProjectTypeServices objMPTS = new ManageProjectTypeServices();
    String msg = "";

    if (request.getParameter("is_Active") != null) {
        int is_Active = Integer.parseInt(request.getParameter("is_Active"));
        int projectType_Id = Integer.parseInt(request.getParameter("projectType_Id"));
        msg = objMPTS.updateProjectTypeStatus(projectType_Id, is_Active);
    }
    if (request.getParameter("sbtnSearch") == null) {

        prioritiesList = objMPTS.getAllProjectTypeList();
    } else {
        String title = request.getParameter("txtTitle");
        prioritiesList = objMPTS.getAllProjectTypeListByTitle(title);
    }
%>  
<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>
                Manage Project Type</strong>
        </td>
    </tr>
    <tr>
        <td align="left">
            <%


                if (request.getParameter("msg") != null) {
                    msg = request.getParameter("msg");
                }
            %>
            <label id ="lblMsg">
                <%=msg%></label>
        </td>
    </tr>
    <tr>
        <td>
            <form action="ManageProjectType_mp.jsp" method="post" onsubmit="return ValidateManageProjectTypeForm()">
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                        <td align="left">
                            <input id="btnAddProjectType" name="btnAddProjectType" type="button" value="Add Project Type" class="button" onclick="window.location='AddProjectType_mp.jsp'"/>
                        </td>
                        <td align="right">
                            <input id="txtTitle" name="txtTitle" type="text" class="txtStyle"/>&nbsp;&nbsp;&nbsp;
                            <input id="sbtnSearch" name="sbtnSearch" type="submit" value="Search" class="button"/>&nbsp;
                            <input id="sbtnListAll" name="sbtnListAll" type="button" value="List All" onclick="window.location='ManageProjectType_mp.jsp'" class="button"/>&nbsp;
                            
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table border="1" cellpadding="3" cellspacing="1" class="styled">
                <tr class="header">
                    <th>Project Type Id</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>&nbsp;</th>
                </tr>
                <%
                    if (prioritiesList.size() > 0) {
                        for (int i = 0; i < prioritiesList.size(); i++) {
                            ManageProjectTypeBean objBean = prioritiesList.get(i);
                            String status = "Inactive";
                            int st = 1;
                            if (objBean.getIs_Active() == 1) {
                                status = "Active";
                                st = 0;
                            }
                            String cssClass = "";
                            if (i % 2 != 0) {
                                cssClass = "alt";
                            }
                            String url = "EditProjectType_mp.jsp?projectType_Id=" + objBean.getProjectType_Id();
                %>
                <tr class="<%=cssClass%>">
                    <td><%=objBean.getProjectType_Id()%></td>
                    <td><%=objBean.getTitle()%></td>
                    <td><%=objBean.getDescription()%></td>
                    <td><%=status%>&nbsp;&nbsp;<a href="ManageProjectType_mp.jsp?projectType_Id=<%=objBean.getProjectType_Id()%>&is_Active=<%=st%>">Change</a>
                    <td><a href="<%=url%>">View & Edit</a></td>
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
</table>