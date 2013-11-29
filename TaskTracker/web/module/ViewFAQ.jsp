<%@page import="datalayer.module.ManageFAQServices"%>
<%@page import="beans.module.ManageFAQBean"%>
<%@page import="java.util.List"%>
<%
    List<ManageFAQBean> faqList = null;
    ManageFAQServices objMFS = new ManageFAQServices();
    faqList = objMFS.getAllFAQListForViewFAQ();
%> 
<table border="0" cellpadding="0" cellspacing="5" align="center" style="min-width: 720px; margin:0 atuo  ">
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
        <td align="center">
            <fieldset>
                <table border="0" style="margin:0  auto;" align="center"   cellpadding="5" cellspacing="5" class="styled">
                    <%
                        if (faqList.size() > 0) {
                            for (int i = 0; i < faqList.size(); i++) {
                                ManageFAQBean objBean = faqList.get(i);
                                String status = "Inactive";
                                if (objBean.getIs_Active() == 1) {
                                    status = "Active";
                                }
                                String cssClass = "";
                                if (i % 2 != 0) {
                                    cssClass = "alt";
                                }
                    %>
                    <tr>
                        <td valign="top">
                            <strong>Question</strong></td>
                        <td>
                            <%=objBean.getFaq()%></td>
                    </tr>
                    <tr class="alt">
                        <td valign="top">
                            <strong>Answer</strong>
                        </td>
                        <td>
                            <%=objBean.getAnswer()%></td>
                    </tr>

                    <%
                            }
                        }
                    %>
                </table>
            </fieldset>
        </td>
    </tr>
</table>