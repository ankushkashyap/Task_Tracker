
<form action="ForgotPasswordController.jsp" method="post" onsubmit="return ValidateForgotPasswordForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center" >
        <tr>
            <td align="center"><strong>Forgot Password</strong></td>
        </tr>   <%
            String msg = "";

            if (request.getParameter("msg") != null) {
                msg = request.getParameter("msg");
            }

            if (!msg.equalsIgnoreCase("sent")) {
        %>
        <tr>
            <td colspan="2" align="left">

                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
        </tr>
        <%}%>
        <tr>
            <td>
                <fieldset>
                    <%
                        if (!msg.equalsIgnoreCase("sent")) {
                    %>
                    <div><strong>If you have forgotten your password, you can have it recover.
                            <br />
                            Please enter your email address below to do so.</strong><br />
                        <br />
                        <label>  An email with the instructions to recover your password will be sent to you.</label>
                    </div>
                    <table class="styledOuter" border="0" cellpadding="5" cellspacing="0">
                        <tr>
                            <td><strong>Username/Email</strong></td>
                            <td><input id="txtUsername" class="txtStyle" name="txtUsername" type="text" /></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2"><input id="sbtnSubmit" name="sbtnSubmit" class="button" type="submit" value="Submit" />
                            </td>
                        </tr>
                    </table>
                    <% } else {%>
                    <div >Your Password has been sent to your email id.<br />
                        Please check your email for further instruction.<br />
                        Please <a href="Login_mp.jsp">Click here</a> to go back to the login page.</div>

                    <%                        }
                    %>
                </fieldset>
            </td>
        </tr>
    </table>
</form>