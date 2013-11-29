<%@page import="datalayer.module.ManageFAQServices"%>
<%@page import="beans.module.ManageFAQBean"%>
<%@page import="java.util.List"%>
<%
    List<ManageFAQBean> faqList = null;

    ManageFAQServices objMFS = new ManageFAQServices();
    String msg = "";

    if (request.getParameter("is_Active") != null) {
        int is_Active = Integer.parseInt(request.getParameter("is_Active"));
        int faq_Id = Integer.parseInt(request.getParameter("faq_Id"));
        msg = objMFS.updateFAQStatus(faq_Id, is_Active);
    }
    faqList = objMFS.getAllFAQList();
%>  
<table border="0" cellpadding="5" cellspacing="0" align="center">

    <tr>
        <td align="left">
            <input type="button" id="btnAddFAQ" name="btnAddFAq" value="Add FAQ" class="button" onclick="window.location='AddFaq_mp.jsp'"/>
        </td>
    </tr><tr>
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
            <table  border="1" cellpadding="5" cellspacing="0" class="styled">
                <tr class="header">
                    <th>
                        FAQ Id
                    </th>
                    <th>
                        FAQ</th>
                    <th>
                        Answer</th>
                    <th>
                        Status
                    </th>
                    <th>&nbsp;
                    </th>
                </tr>

                <%
                    if (faqList.size() > 0) {
                        for (int i = 0; i < faqList.size(); i++) {
                            ManageFAQBean objBean = faqList.get(i);
                            String status = "Inactive";
                            int st = 1;
                            if (objBean.getIs_Active() == 1) {
                                status = "Active";
                                st = 0;
                            }
                            String cssClass = "";
                            if (i % 2 != 0) {
                                cssClass = "alt";
                            }
                %>
                <tr class="<%=cssClass%>">
                    <td><%=objBean.getFaq_Id()%></td>
                    <td><%=objBean.getFaq()%></td>
                    <td><%=objBean.getAnswer()%></td>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" class="tblInnerStyle">
                            <tr>
                                <td align="left">
                                    <%=status%>
                                </td>
                                <td align="right">
                                    <a href="ManageFAQ_mp.jsp?faq_Id=<%=objBean.getFaq_Id()%>&is_Active=<%=st%>">Change</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <a href="EditFaq_mp.jsp?faq_Id=<%=objBean.getFaq_Id()%>">Edit</a>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">NO Record Found</td>
                </tr>
                <%                                }
                %>

            </table>
        </td>
    </tr>
</table>