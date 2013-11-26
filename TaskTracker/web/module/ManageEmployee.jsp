<%@page import="datalayer.module.ManageEmployeeServices"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.module.ManageEmployeeBean"%>
<%
    String name = request.getParameter("txtName");
    String loginName = request.getParameter("txtLoginName");
    ArrayList<ManageEmployeeBean> al = null;
    ManageEmployeeServices objMES = new ManageEmployeeServices();
    String msg = "";

    if (request.getParameter("is_Active") != null) {
        int is_Active = Integer.parseInt(request.getParameter("is_Active"));
        int user_Id = Integer.parseInt(request.getParameter("user_Id"));
        msg = objMES.updateEmployeeStatus(user_Id, is_Active);
    }
    if (name == null & loginName == null) {
        name = "";
        loginName = "";
        al = objMES.getAllEmployeeList();
    } else {
        al = objMES.getAllEmployeeListByLoginNameAndName(name, loginName);
    }
    int l = al.size();
%>
<table border="0" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <strong>Manage Employee</strong></td>
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
            <form action="ManageEmployee_mp.jsp" method="post" onsubmit="return ValidateManageEmployeeForm()">
                <table border="0" cellpadding="5" cellspacing="0" width="100%">
                    <tr>
                        <td  align="left">
                            <input  id="btnAddNewEmployee" value="Add New Employee" name="btnAddNewEmployee"  type="button" class="button" onclick="window.location='AddEmployee_mp.jsp'"/>&nbsp;
                        </td>
                        <td  align="right">
                            Name&nbsp;<input id="txtName" size="10" name="txtName" type="text" class="txtStyle"/>
                            &nbsp;Login Name&nbsp;<input id="txtLoginName" size="10" name="txtLoginName" type="text"  class="txtStyle"/>
                            &nbsp;<input id="sbtnSearch" value="Search" name="sbtnSearch" type="submit" class="button" onclick="checkButton(this)" />
                            &nbsp;<input id="sbtnListAll" value="List All" name="sbtnListAll" type="submit" class="button" onclick="checkButton(this)" />
                        </td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
    <tr>
        <td>
            <table border="1" cellpadding="0" cellspacing="1" class="styled">
                <tr class="header">
                    <th>S.No</th>
                    <th>Name</th>
                    <th>Login Name</th>
                    <th>Email ID</th>
                    <th>Phone</th>
                    <th>Professional</th>
                    <th>Status</th>
                    <th>&nbsp;</th>
                </tr>
                <%
                    if (al.size() > 0) {
                        for (int i = 0; i < al.size(); i++) {
                            ManageEmployeeBean objBean = al.get(i);
                            String status = "Inactive";
                            int st = 1;
                            if (objBean.getStatus() == 1) {
                                status = "Active";
                                st = 0;
                            }
                            String cssClass = "";
                            if (i % 2 != 0) {
                                cssClass = "alt";
                            }
                %>
                <tr class="<%=cssClass%>">
                    <td><%=i + 1%></td>
                    <td><%=objBean.getName()%></td>
                    <td><%=objBean.getUser_Name()%></td>
                    <td><%=objBean.getEmail_Id()%></td>
                    <td><%=objBean.getPhone()%></td>
                    <td><%=objBean.getProfessional()%></td>
                    <td><%=status%>&nbsp;&nbsp;<a href="ManageEmployee_mp.jsp?user_Id=<%=objBean.getUser_Id()%>&is_Active=<%=st%>">Change</a></td>
                    <td><a href="ViewEditEmployee_mp.jsp?Emp_Id=<%=objBean.getUser_Id()%>">Edit</a></td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="8">NO Record Found</td>
                </tr>
                <%                                }
                %>
            </table>
        </td>
    </tr>
</table>