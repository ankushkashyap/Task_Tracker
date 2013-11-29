
<form action="ManageFAQController.jsp" method="post" onsubmit="return ValidateAddFAQForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center" >
        <tr>
            <td align="center">
                <strong>
                    Add FAQ</strong><br />
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
                    <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                        <tr>
                            <td valign="top">
                                <strong>FAQ</strong>
                            </td>
                            <td>
                                <textarea id="taFAQ" name="taFAQ" cols="30" rows="2" ></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <strong>Answer</strong>
                            </td>
                            <td>
                                <textarea id="taAnswer" name="taAnswer" cols="30" rows="2"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>Status</strong>
                            </td>
                            <td>
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td>
                                            <input id="rbActive" type="radio" name="rbStatus" value="1" checked="checked" />
                                            Active
                                        </td>
                                        <td>
                                            <input id="rbInactive" type="radio" name="rbStatus" value="0" />                                            
                                            Inactive
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input id="sbtnSave" name="sbtnSave" type="submit" value="Save" class="button"/>
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