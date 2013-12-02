<%@include file="LogoutCheck.jsp" %><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Task Tracker</title>
        <jsp:include page="stylesheet.jsp"/>
        <script type="text/javascript">
            
          
                            
                  
            $(function() {
                
                $('#txtStartDate').datepicker({
                    dateFormat : 'yy-mm-dd' ,
                    // maxDate:0,
                    minDate:0,
                    changeMonth:true,
                    changeYear:true
                });
              
                $('#txtEndDate').datepicker({
                    dateFormat : 'yy-mm-dd' ,
                    // maxDate:0,
                    minDate:0,
                    changeMonth:true,
                    changeYear:true
                });
            });
                  
           

                
            function ValidateAddProjectPortfolioForm()
            {
                
                var strTitle = document.getElementById("txtTitle").value;
                if(isEmpty(strTitle))
                {
                    alert("Enter Project Title");
                    document.getElementById("txtTitle").focus();
                    return false;
                }
                var strProjectType = document.getElementById("ddlProjectType").value;
                if(strProjectType==0)
                {
                    alert("Select Project Type");
                    document.getElementById("ddlProjectType").focus();
                    return false;
                }
                var strStartDate = document.getElementById("txtStartDate").value;
                if(isEmpty(strStartDate))
                {
                    alert("Enter Start Date");
                    document.getElementById("txtStartDate").focus();
                    return false;
                }
                var strEndDate = document.getElementById("txtEndDate").value;
                if(isEmpty(strEndDate))
                {
                    alert("Enter End Date");
                    document.getElementById("txtEndDate").focus();
                    return false;
                }
                if(strEndDate<strStartDate){
                    alert("Start Date must be Less than End Date");
                    document.getElementById("txtStartDate").focus();
                    document.getElementById("txtStartDate").value="";
                    return false;
                }
                var strClient = document.getElementById("txtClient").value;
                if(isEmpty(strClient))
                {
                    alert("Enter Client");
                    document.getElementById("txtClient").focus();
                    return false;
                }
               
                var flag=0
                var chkSelect = document.getElementsByName("chk")
                for(i=0;i<chkSelect.length;i++)
                {
                    if(chkSelect[i].checked==true)
                    {
                        flag=1
                        break;
                    }
                }
                if(flag==0)
                {
                    alert("Must select atleast one phase");
                    return false;
                }
                if(flag==1)
                {
                    for(i=0;i<chkSelect.length;i++)
                    {
                        if(chkSelect[i].checked==true)
                        {
                            var val= chkSelect[i].value;
                            var strPhaseStartDate = document.getElementById("txtPhaseStartDate"+val).value;
                            var strPhaseEndDate = document.getElementById("txtPhaseEndDate"+val).value;
                            if(isEmpty(strPhaseStartDate))
                            {
                                alert("Must Enter Phase Start Date");
                                document.getElementById("txtPhaseStartDate"+val).focus();
                                return false;
                            }
                            if(IsValidDate(strPhaseStartDate)==false)
                            {
                                alert("Must Enter valid Phase Start Date");
                                document.getElementById("txtPhaseStartDate"+val).value="";
                                document.getElementById("txtPhaseStartDate"+val).focus();
                                return false;
                            }
                            if(isEmpty(strPhaseEndDate))
                            {
                                alert("Must Enter Phase End Date");
                                document.getElementById("txtPhaseEndDate"+val).focus();
                                return false;
                            }
                            if(IsValidDate(strPhaseEndDate)==false)
                            {
                                alert("Must Enter valid Phase End Date");
                                document.getElementById("txtPhaseEndDate"+val).value="";
                                document.getElementById("txtPhaseEndDate"+val).focus();
                                return false;
                            }
                            if(strPhaseEndDate<strPhaseStartDate){
                                alert("Phase Start Date must be Less than Phase End Date");
                                document.getElementById("txtPhaseStartDate"+val).focus();
                                document.getElementById("txtPhaseStartDate"+val).value="";
                                return false;
                            }
                        }
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
                <jsp:include page="AddProjectPortfolio.jsp" />
            </div>
        </div>
        <div class="clr">
        </div>
        <div id="footer_container">

            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
