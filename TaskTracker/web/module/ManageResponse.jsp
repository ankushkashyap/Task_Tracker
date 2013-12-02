 
<%@page import="beans.module.ManageResponseBean"%>
<%@page import="java.util.List"%>
<%@page import="datalayer.module.ManageResponseServices"%>

<%
    String name = request.getParameter("txtName");
    String loginName = request.getParameter("txtLoginName");
    List<ManageResponseBean> al = null;
    //
    ManageResponseServices objMRS = new ManageResponseServices();
    if (name == null & loginName == null) {
        name = "";
        loginName = "";
        al = objMRS.getAllRequestList();
    } else {
        //al = ManageOperatorService.getAllOperators(name, loginName);
    }
%>
<table border="0" cellpadding="5" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>
                Manage Request Administrator</strong><br />
        </td>
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
        <td>
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="right">
                                    <table border="0" cellpadding="5" cellspacing="0" >
                                        <tr>
                                            <td>
                                                <label> Sort By: </label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <input id="rbSortby1" name="rbSortby" type="radio" />
                                            </td>
                                            <td>
                                                <label> A-Z</label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <input id="rbSortby2" name="rbSortby" type="radio" checked="checked" />
                                            </td>
                                            <td>
                                                <label>   Z-A </label>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                <input id="rbSortby3" name="rbSortby" type="radio" />
                                            </td>
                                            <td>
                                                <label> Posted Date</label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>

                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table border="1" cellpadding="5" cellspacing="0" class="styled">
                            <tr class="header">
                                <th>Sr No.</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>RequestDate</th>
                                <th>Name</th>
                            </tr>
                            <%
                                if (al.size() > 0) {
                                    for (int i = 0; i < al.size(); i++) {
                                        ManageResponseBean objBean = al.get(i);

                                        String cssClass = "";
                                        if (i % 2 != 0) {
                                            cssClass = "alt";
                                        }
                            %>
                            <tr class="<%=cssClass%>">
                                <td><%=i + 1%></td>
                                <td>
                                    <%
                                        if (objBean.getStatus().equals("0")) {
                                    %>
                                    <a href="PostResponse_mp.jsp?requestId=<%=objBean.getRequest_Id()%>"><%=objBean.getRequest_Title()%></a>
                                    <%
                                } else {%>
                                    <%=objBean.getRequest_Title()%>
                                    <%
                                    }%>
                                </td>

                                <td><%=objBean.getRequest_Text()%></td>
                                <td><%=objBean.getRequest_Date()%></td>
                                <td><%=objBean.getRequest_By()%></td>
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
        </td>
    </tr>
</table>