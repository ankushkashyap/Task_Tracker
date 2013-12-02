
<%@page import="datalayer.module.ManageResponseServices"%>
<%@page import="beans.module.ManageRequestBean"%>
<%@page import="datalayer.module.ManageRequestServices"%>
<%@page import="beans.module.AddEditEmployeeBean"%>

<%
    String url = "";
    ManageResponseServices obj = new ManageResponseServices();
    if (request.getParameter("sbtnPost") != null) {
        ManageRequestBean objBean = new ManageRequestBean();
        int user_Id = (Integer) session.getAttribute("User_Id");
        objBean.setResponse_Text(request.getParameter("taResponse"));
        int hdnRequestId=Integer.parseInt(request.getParameter("hdnRequestId"));
        objBean.setRequest_Id(hdnRequestId);
        boolean result = obj.postResponse(objBean, user_Id);
        if (result) {
            url = "ManageResponse_mp.jsp?msg=Response posted Successfully";
        } else {
            url = "PostResponse_mp.jsp?msg=Failed post response&requestId="+hdnRequestId;
        }
    }
    response.sendRedirect(url);
%>



