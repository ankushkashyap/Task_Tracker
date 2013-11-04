<%@page import="beans.module.ManagePrioritiesBean"%>
<%@page import="datalayer.module.ManagePrioritiesServices"%>
<%@page import="java.util.List"%>
<%
    List<ManagePrioritiesBean> prioritiesList = null;
    ManagePrioritiesServices objMPS = new ManagePrioritiesServices();
    String msg = "";

    if (request.getParameter("is_Active") != null) {
        int is_Active = Integer.parseInt(request.getParameter("is_Active"));
        int priority_Id = Integer.parseInt(request.getParameter("priority_Id"));
        msg = objMPS.updatePriorityStatus(priority_Id, is_Active);
    }
    if (request.getParameter("sbtnSearch") == null) {

        prioritiesList = objMPS.getAllPrioritiesList();
    } else {
        String title = request.getParameter("txtTitle");
        prioritiesList = objMPS.getAllPrioritiesListBYTitle(title);
    }

%>  
<form action="" method="post" onsubmit="return ValidateManagePriorityForm()">
    <table    cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>
                    Manage Priorities
                </strong>
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
                <table style="min-width: 600px;" border="0" cellpadding="5" cellspacing="0" width="100%" >
                    <tr>
                        <td align="left">
                            <input id="btnAddPriority" name="btnAddPriority" type="button" value="Add Priority" class="button" onclick="window.location='AddPriority_mp.jsp'"/>
                        </td>
                        <td align="right">
                            <input  id="txtTitle" name="txtTitle" type="text" class="txtStyle"/>&nbsp;&nbsp;&nbsp;
                            <input id="sbtnSearch" name="sbtnSearch" type="submit" value="Search" class="button"/>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="1" cellpadding="5" cellspacing="0" class="styled">
                    <tr class="header">
                        <th>Priority Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>&nbsp;</th>
                    </tr>
                    <%
                        if (prioritiesList.size() > 0) {
                            for (int i = 0; i < prioritiesList.size(); i++) {
                                ManagePrioritiesBean objBean = prioritiesList.get(i);
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
                    %>
                    <tr class="<%=cssClass%>">
                        <td><%=objBean.getPriority_Id()%></td>
                        <td><%=objBean.getTitle()%></td>
                        <td><%=objBean.getDescription()%></td>
                        <td>
                       
                            <%=status%>&nbsp;&nbsp;<a href="ManagePriorities_mp.jsp?priority_Id=<%=objBean.getPriority_Id()%>&is_Active=<%=st%>">Change</a>
                        <td><a href="EditPriority_mp.jsp?priority_Id=<%=objBean.getPriority_Id()%>">Edit</a></td>
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
</form>