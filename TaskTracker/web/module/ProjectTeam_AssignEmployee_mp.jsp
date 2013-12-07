<%@include file="LogoutCheck.jsp" %><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Task Tracker</title>
        <jsp:include page="stylesheet.jsp"/>
        <script type="text/javascript">
            function ValidateAssignEmployeeForm()
            {
         
                var chkSelect = document.getElementsByName("chkEmployeeId");
                var flag = 0;
                for(i=0;i<chkSelect.length;i++)
                {
                    if(chkSelect[i].checked==true)
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag==0)
                {
                    alert("Must select atleast one Employee");
                    return false;
                }
                var rbReportingHead = document.getElementsByName("rbReportingHead");
                var flag = 0;
                for(i=0;i<rbReportingHead.length;i++)
                {
                    if(rbReportingHead[i].checked==true)
                    {
                        flag = 1;
                        break;
                    }
                }
                if(flag==0)
                {
                    alert("Must select one Employee as reporting head");
                    return false;
                }
                else if(flag==1)
                {
                            
                    if(chkSelect[i].checked==false)
                    {
                         var val = rbReportingHead[i].value;      
                        alert("Must select Reporting Head as Employee also.");
                        document.getElementById("chkEmployeeId"+val).focus();
                       
                        return false;
                    }
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
                <jsp:include page="ProjectTeam_AssignEmployee.jsp" />
            </div>
        </div>
        <div class="clr">
        </div>
        <div id="footer_container">

            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
