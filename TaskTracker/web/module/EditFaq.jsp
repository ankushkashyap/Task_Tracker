<%@page import="beans.module.ManageFAQBean"%>
<%@page import="datalayer.module.ManageFAQServices"%>
<%
    int faq_Id = Integer.parseInt(request.getParameter("faq_Id"));
    ManageFAQServices obj = new ManageFAQServices();
    ManageFAQBean objBean = obj.getFAQById(faq_Id);
%>
<form action="ManageFAQController.jsp" method="post" onsubmit="return ValidateEditFAQForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>
                    Edit  FAQ</strong><br />
            </td>
        </tr>
        <tr>
           <td align="left">
                <%
                String msg="";
                        
if(request.getParameter("msg")!=null)              {
    msg=request.getParameter("msg");
}  
%>
                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <fieldset>
                    <table border="0" cellpadding="5" cellspacing="0" >
                        <tr>
                            <td valign="top">
                                <strong>FAQ</strong>
                            </td>
                            <td>
                                <input type="hidden" name="hdnFaqId" id="hdnFaqId" value="<%=faq_Id%>"/>
                                <textarea id="taFAQ" name="taFAQ" cols="30" rows="2"><%=objBean.getFaq()%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <strong>Answer</strong>
                            </td>
                            <td>
                                <textarea id="taAnswer" name="taAnswer" cols="30" rows="2"><%=objBean.getAnswer()%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Status</strong>
                            </td>
                            <%
                                String strActive = "";
                                String strInActive = "";
                                if (objBean.getIs_Active() == 1) {
                                    strActive = "checked";

                                } else {
                                    strInActive = "checked";
                                }
                            %>
                            <td>
                                <input id="rbActive" <%= strActive%> type="radio" name="rbStatus" value="1" />
                                Active
                                <input id="rbInactive" <%= strInActive%> type="radio" name="rbStatus" value="0" />Inactive
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input id="sbtnUpdate"  name="sbtnUpdate" type="submit" value="Update" class="button"/>
                                <input id="rbtnReset" name="rbtnReset" type="reset" value="Reset" class="button"/>
                                <input type="button" id="btnCancel" name="btnCancel" value="Cancel" class="button" onclick="window.location='ManageFAQ_mp.jsp'"/>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form>