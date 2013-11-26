
<%@page import="datalayer.module.ManageStatusServices"%>
<jsp:useBean id="objBean" class="beans.module.AddEditStatusBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%
    String url = "";
            ManageStatusServices obj = new ManageStatusServices();

    if (request.getParameter("sbtnUpdate") != null) {
        boolean result = obj.updateStatus(objBean);
        if (result) {
            url = "ManageStatus_mp.jsp?msg=Record updated Successfully";
        } else {
            url = "EditStatus_mp.jsp?msg=Failed to update status information&status_Id=" + objBean.getHdnStatusId();
        }
    } else if (request.getParameter("sbtnSave") != null) {
 
        boolean result = obj.addNewStatus(objBean);
        if (result) {
            url = "ManageStatus_mp.jsp?msg=Status added successfully";
        } else {
            url = "AddStatus_mp.jsp?msg=Failed to add new status";
        }
    
    } else if (request.getParameter("sbtnSaveAndAddNew") != null) {
 
        boolean result = obj.addNewStatus(objBean);
        if (result) {
            url = "AddStatus_mp.jsp?msg=Status  added successfully";
        } else {
            url = "AddStatus_mp.jsp?msg=Failed to add new status";
        }
    }
    response.sendRedirect(url);
%>



