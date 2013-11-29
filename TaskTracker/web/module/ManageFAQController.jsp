
<%@page import="datalayer.module.ManageFAQServices"%>
<jsp:useBean id="objBean" class="beans.module.AddEditFAQBean">
    <jsp:setProperty name="objBean" property="*"/>
</jsp:useBean>
<%
    String url = "";
    if (request.getParameter("sbtnUpdate") != null) {
        ManageFAQServices obj = new ManageFAQServices();
        boolean result = obj.updateFAQ(objBean);
        if (result) {
            url = "ManageFAQ_mp.jsp?msg=Record updated Successfully";
        } else {
            url = "EditFaq_mp.jsp?msg=Failed to update&faq_Id=" + objBean.getHdnFaqId();
        }
    } else if (request.getParameter("sbtnSave") != null) {
        ManageFAQServices obj = new ManageFAQServices();
        boolean result = obj.addNewFAQ(objBean);
        if (result) {
            url = "ManageFAQ_mp.jsp?msg=Record added Successfully";
        } else {
            url = "AddFaq_mp.jsp?msg=Failed to add";
        }
    }
    response.sendRedirect(url);
%>



