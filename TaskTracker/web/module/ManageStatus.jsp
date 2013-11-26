<%@page import="beans.module.ManageStatusBean"%>
<%@page import="datalayer.module.ManageStatusServices"%>
<%@page import="java.util.List"%>
<%
    ManageStatusServices objMSS = new ManageStatusServices();
    List<ManageStatusBean> statusList = null;
    String msg = "";

    if (request.getParameter("is_Active") != null) {
        int is_Active = Integer.parseInt(request.getParameter("is_Active"));
        int status_Id = Integer.parseInt(request.getParameter("status_Id"));
        msg = objMSS.updateStatusIsActive(status_Id, is_Active);
    }
    if (request.getParameter("sbtnSearch") == null) {
        statusList = objMSS.getAllStatusList();
    } else {
        String title = request.getParameter("txtTitle");
        statusList = objMSS.getAllStatusListByTitle(title);
    }
%>  
<form action="ManageStatus_mp.jsp" method="post" onsubmit="return ValidateManageStatusForm()">
    <table style="min-width: 600px;" border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>
                    Manage Status</strong>
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
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                        <td align="left">
                            <input id="btnAddStatus" name="btnAddStatus" type="button" value="Add Status" class="button" onclick="window.location='AddStatus_mp.jsp'"/>
                        </td>
                        <td align="right">
                            <input id="txtSearch" name="txtTitle" type="text" class="txtStyle"/>&nbsp;&nbsp;&nbsp;
                            <input id="sbtnSearch" name="sbtnSearch" type="submit" value="Search" class="button"/>&nbsp;
                            <input id="sbtnListAll" name="sbtnListAll" type="button" value="List All" onclick="window.location='ManageStatus_mp.jsp'" class="button"/>&nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="1" cellpadding="3" cellspacing="1" class="styled">
                    <tr class="header">
                        <th>Status Id</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>&nbsp;</th>
                    </tr>
                    <%
                        if (statusList.size() > 0) {
                            for (int i = 0; i < statusList.size(); i++) {
                                ManageStatusBean objBean = statusList.get(i);
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

                                String url = "EditStatus_mp.jsp?status_Id=" + objBean.getStatus_Id() + "&title=" + objBean.getTitle() + "&desc=" + objBean.getDescription();
                    %>
                    <tr class="<%=cssClass%>">
                        <td><%=objBean.getStatus_Id()%></td>
                        <td><%=objBean.getTitle()%></td>
                        <td><%=objBean.getDescription()%></td>
                        <td><%=status%>&nbsp;&nbsp;<a href="ManageStatus_mp.jsp?status_Id=<%=objBean.getStatus_Id()%>&is_Active=<%=st%>">Change</a><td><a href="<%= url%>">View & Edit</a></td>
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