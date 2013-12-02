 
<%@page import="datalayer.module.ManageRequestServices"%>
<%@page import="beans.module.ManageRequestBean"%>
<%@page import="datalayer.module.ManageResponseServices"%>
<%@page import="java.util.List"%>
<%
    String name = request.getParameter("txtName");
    String loginName = request.getParameter("txtLoginName");
    List<ManageRequestBean> al = null;
    int user_id = (Integer) session.getAttribute("User_Id");
    ManageRequestServices objMRS = new ManageRequestServices();
    if (name == null & loginName == null) {
        name = "";
        loginName = "";
        al = objMRS.getAllRequestResponseList(user_id);
    } else {
        //al = ManageOperatorService.getAllOperators(name, loginName);
    }
%>
<table border="0" cellpadding="5" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>
                Manage Response</strong><br />
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
        <td align="left">
            <table align="center" border="1" cellpadding="5" cellspacing="0" rules="none">
                <tr>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" >
                            <tr>
                                <td>
                                    <input id="btnPostRequest" name="btnPostRequest" type="button" value="Post Request" class="button" onclick="window.location='PostRequest_mp.jsp'"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table align="center" border="1" cellpadding="5" cellspacing="0" class="styled">
                            <tr class="header">
                                <th>Sr. No.</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Request&nbsp;Date</th>
                                <th>Response</th>
                                <th>ResponseDate</th>
                            </tr>
                            <%
                                if (al.size() > 0) {
                                    for (int i = 0; i < al.size(); i++) {
                                        ManageRequestBean objBean = al.get(i);

                                        String cssClass = "";
                                        if (i % 2 != 0) {
                                            cssClass = "alt";
                                        }
                            %>
                            <tr class="<%=cssClass%>">
                                <td><%=i + 1%></td>
                                <td><a href="ViewResponse_mp.jsp?requestId=<%=objBean.getRequest_Id() %>"><%=objBean.getRequest_Title()%></a></td>
                                <td><%=objBean.getRequest_Text()%></td>
                                <td><%=objBean.getRequest_Date()%></td>
                                <td><%=objBean.getResponse_Text()%></td>
                                <td><%=objBean.getResponse_Date()%></td>
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
        </td>
    </tr>
</table>