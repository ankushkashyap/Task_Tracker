<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Task Tracker</title>
        <jsp:include page="stylesheet.jsp"/>
           <script type="text/javascript">
            function ValidateLoginForm()
            {
                var strUserName = document.getElementById("txtUserName").value;
                if(isEmpty(strUserName))
                    {
                        alert("Enter User Name");
                        document.getElementById("txtUserName").focus();
                        return false;
                       
                    }
                    var strPassword = document.getElementById("txtPassword").value;
                if(isEmpty(strPassword))
                    {
                        alert("Enter Password");
                        document.getElementById("txtPassword").focus();
                        return false;
                       
                    }
                    return true;
            }
        </script>
    </head>
    <body class="internal">
        <div id="header_feature">
            <div id="header">
                <jsp:include page="header.jsp"/>
            </div>
            <div id="feature">
                <div id="subhead">
                    <%--    <span class="breadcrumbs pathway"><a href="#" class="pathway">Home</a> » <a href="#"
                                                                                                    class="pathway">This is Test.</a> » This is Test.</span>
                    --%>
                </div>
            </div>
        </div>
        <div id="main">
            <div id="left">
                <jsp:include page="Login.jsp" />
            </div>
        </div>
        <div class="clr">
        </div>
        <div id="footer_container">
           
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
