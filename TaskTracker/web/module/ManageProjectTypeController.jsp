
<%@page import="datalayer.module.ManageProjectTypeServices"%>
<jsp:useBean id="objBean" class="beans.module.AddEditProjectTypeBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%
    String url = "";
            ManageProjectTypeServices obj = new ManageProjectTypeServices();

    if (request.getParameter("sbtnUpdate") != null) {
        boolean result = obj.updateProjectType(objBean);
        if (result) {
            url = "ManageProjectType_mp.jsp?msg=Record updated Successfully";
        } else {
            url = "EditProjectType_mp.jsp?msg=Failed to update Project Type information&projectType_Id=" + objBean.getHdnProjectTypeId();
        }
    } else if (request.getParameter("sbtnSave") != null) {
 
        boolean result = obj.addNewProjectType(objBean);
        if (result) {
            url = "ManageProjectType_mp.jsp?msg=Project Type added successfully";
        } else {
            url = "AddProjectType_mp.jsp?msg=Failed to add new project type";
        }
    
    } else if (request.getParameter("sbtnSaveAndAddNew") != null) {
 
        boolean result = obj.addNewProjectType(objBean);
      if (result) {
            url = "AddProjectType_mp.jsp?msg=Project Type added successfully";
        } else {
            url = "AddProjectType_mp.jsp?msg=Failed to add new project type";
        }
    }
    response.sendRedirect(url);
%>



