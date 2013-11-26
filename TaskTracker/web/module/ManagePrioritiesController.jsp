
<%@page import="datalayer.module.ManagePrioritiesServices"%>
<jsp:useBean id="objBean" class="beans.module.AddEditPriorityBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%
    String url = "";
            ManagePrioritiesServices obj = new ManagePrioritiesServices();

    if (request.getParameter("sbtnUpdate") != null) {
        boolean result = obj.updatePriority(objBean);
        if (result) {
            url = "ManagePriorities_mp.jsp?msg=Record updated Successfully";
        } else {
            url = "EditPriority_mp.jsp?msg=Failed to update Project priority information&priority_Id=" + objBean.getHdnPriorityId();
        }
    } else if (request.getParameter("sbtnSave") != null) {
 
        boolean result = obj.addNewPriority(objBean);
        if (result) {
            url = "ManagePriorities_mp.jsp?msg=Project Priority added successfully";
        } else {
            url = "AddPriority_mp.jsp?msg=Failed to add new project priority";
        }
    
    } else if (request.getParameter("sbtnSaveAndAddNew") != null) {
 
        boolean result = obj.addNewPriority(objBean);
      if (result) {
            url = "AddPriority_mp.jsp?msg=Project Priority added successfully";
        } else {
            url = "AddPriority_mp.jsp?msg=Failed to add new project priority";
        }
    }
    response.sendRedirect(url);
%>



