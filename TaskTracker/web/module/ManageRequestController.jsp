
<%@page import="beans.module.ManageRequestBean"%>
<%@page import="datalayer.module.ManageRequestServices"%>
<%@page import="beans.module.AddEditEmployeeBean"%>

<%
    String url = "";
    ManageRequestServices obj = new ManageRequestServices();
    if (request.getParameter("sbtnUpdate") != null) {
        /*boolean result = obj.updateFAQ(objBean);
        if (result) {
        url = "ManageFAQ_mp.jsp?msg=Record updated Successfully";
        } else {
        url = "EditFaq_mp.jsp?msg=Failed to update&faq_Id=" + objBean.getHdnFaqId();
        }*/
    } else if (request.getParameter("sbtnPost") != null) {
        ManageRequestBean objBean=new ManageRequestBean();
          int user_Id = (Integer)session.getAttribute("User_Id");
        objBean.setRequest_Title(request.getParameter("txtRequestTitle"));
        objBean.setRequest_Text(request.getParameter("taDescription"));
        boolean result = obj.postNewRequest(objBean, user_Id);
        if (result) {
            url = "ManageRequest_mp.jsp?msg=Request posted Successfully";
        } else {
            url = "PostRequest_mp.jsp?msg=Failed post request";
        }
    }
    response.sendRedirect(url);
%>



