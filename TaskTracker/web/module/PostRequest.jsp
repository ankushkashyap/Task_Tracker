
<form action="ManageRequestController.jsp" method="post" onsubmit="return ValidatePostRequestForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center" >
        <tr>
            <td align="center">
                <label >
                    Post Request</label><br />
            </td>
        </tr>
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
            <td align="left">
                <fieldset>
                    <table align="center"  cellpadding="5" cellspacing="0" class="styledOuter">
                        <tr>
                            <td align="center">
                                <table border="0" cellpadding="5" cellspacing="0">
                                    <tr>
                                        <td >
                                            <strong>Request Title</strong>
                                        </td>
                                        <td>
                                            <input id="txtRequestTitle" name="txtRequestTitle" type="text" class="txtStyle"/>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td >
                                            <strong>Description</strong>
                                        </td>
                                        <td>
                                            <textarea id="taDescription" name="taDescription" cols="20" rows="2"></textarea>
                                        </td>
                                    </tr> <tr>
                                        <td colspan="3" align="center">
                                            <input id="sbtnPost" name="sbtnPost" type="submit" value="Post" class="button"/>&nbsp;
                                            <input id="btnCancel" name="btnCancel" type="button" value="Cancel"  class="button" onclick="window.location='ManageRequest_mp.jsp'"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form>