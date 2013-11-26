<%@include file="LogoutCheck.jsp" %><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Task Tracker</title>
        <jsp:include page="stylesheet.jsp"/>
         <script type="text/javascript">
            function ValidateAddTaskSheetForm()
            {
            
                var strTask= document.getElementById("txtTask").value;
                if(isEmpty(strTask))
                    {
                        alert("Enter Task");
                        document.getElementById("txtTask").focus();
                        return false;
                    }
            
                var strAssignTo= document.getElementById("ddlAssignTo").value;
                if(strAssignTo==0)
                    {
                        alert("Select Employee");
                        document.getElementById("ddlAssignTo").focus();
                        return false;
                    }
                var strPriority= document.getElementById("ddlPriority").value;
                if(strPriority==0)
                    {
                        alert("Select Priority");
                        document.getElementById("ddlPriority").focus();
                        return false;
                    }
                var strStatus= document.getElementById("ddlStatus").value;
                if(strStatus==0)
                    {
                        
                        alert("Select Status");
                        document.getElementById("ddlStatus").focus();
                      
                        return false;
                        
                    }
                    
                   var strStartDate= document.getElementById("txtStartDate").value;
                if(isEmpty(strStartDate))
                    {
                      
                        alert("Enter Start Date");
                        document.getElementById("txtStartDate").focus();
                        return false;
                    }
                var strEndDate= document.getElementById("txtEndDate").value;
                if(isEmpty(strEndDate))
                    {
                        alert("Enter End Date");
                        document.getElementById("txtEndDate").focus();
                        return false;
                    }
                return true;
            }
        </script>
        <script type="text/javascript">
            var xmlHttp;
            
            // -------------Function which gets DropDown with List of all States according to countryId
            function getEmployee(str)
            {
                xmlHttp=getXmlHttpObject();
                if (xmlHttp==null)
                {
                    alert ("Your browser does not support AJAX!");
                    return;
                }
                var url="EmployeeInfo.jsp";
                url=url+"?Emp_Id="+str;
                 
                xmlHttp.onreadystatechange=stateChanged;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
            }
            
            function getXmlHttpObject()
            {
                var xmlHttp=null;
                try
                {
                    // Firefox, Opera 8.0+, Safari
                    xmlHttp=new XMLHttpRequest();
                }
                catch (e)
                {
                    // Internet Explorer
                    try
                    {
                        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                    }
                    catch (e)
                    {
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
            }
            
            
            function stateChanged()
            {
                if (xmlHttp.readyState==4)
                {
                    document.getElementById("divEmp").innerHTML = xmlHttp.responseText;
                   
                }
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
                <jsp:include page="AddTaskSheet.jsp" />
            </div>
        </div>
        <div class="clr">
        </div>
        <div id="footer_container">

            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
