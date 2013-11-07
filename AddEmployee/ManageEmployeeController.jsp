<%@page import="datalayer.module.ManageEmployeeServices"%>
 

<jsp:useBean id="objBean" class="beans.module.AddEditEmployeeBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%
    String url = "";
    ManageEmployeeServices obj = new ManageEmployeeServices ();
    if (request.getParameter("sbtnUpdate") != null) {
        boolean result =obj.updateEmployeeRecord(objBean);
        if (result) {
            url = "ManageEmployee_mp.jsp?msg=Record updated Successfully";
        } else {
            
            url = "ViewEditEmployee_mp.jsp?msg=Failed to update&Emp_Id=" + objBean.getHdnEmployeeId();
        }
    } else if (request.getParameter("sbtnSave") != null) {
        boolean result = obj.addNewEmployeeRecord(objBean);
        if (result) {
            url = "ManageEmployee_mp.jsp?msg=Record added Successfully";
        } else {
            url = "AddEmployee_mp.jsp?msg=Failed to add new operator";
        }
    }
    response.sendRedirect(url);
%>



