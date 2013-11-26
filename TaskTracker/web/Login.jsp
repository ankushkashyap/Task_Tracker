 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="AuthServlet" method="post" onsubmit="return ValidateLoginForm()">
            <table align="right"> 
                <tr>
                    <td>
                        <fieldset><legend><strong><em>&nbsp;Login&nbsp;</em></strong></legend>
                            <table class="styledOuter">
                                <tr> <td colspan="2" align="left">
                <%
                String msg="";
                        
if(request.getParameter("msg")!=null)              {
    msg=request.getParameter("msg");
}  
%>
                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
                                <tr>
                                    <td>User Name</td>
                                    <td><input class="txtStyle" id="txtUserName" name="txtUserName"  type="text" /></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><input class="txtStyle" id="txtPassword" name="txtPassword" type="password" /></td>
                                </tr>
                                <tr>
                                      <td colspan="2" align="right" >
                                        <input id="sbtnLogin" class="button" name="sbtnLogin" type="submit" value="Login"/>
                                        <input id="rbtnReset" name="rbtnReset" class="button" type="reset" value="Reset"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center" ><a href="ForgotPassword_mp.jsp"  title="Forgot Password">forgot password?</a></td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
