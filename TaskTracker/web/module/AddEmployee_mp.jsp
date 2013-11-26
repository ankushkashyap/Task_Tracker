<%@include file="LogoutCheck.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Task Tracker</title>
        <jsp:include page="stylesheet.jsp"/>
        <script type="text/javascript">
           $(function() {
                $( "#txtDOB" ).datepicker({
                    dateFormat : 'yy-mm-dd' ,
                    maxDate:-6572,
                    minDate:-29200,
                    changeMonth: true,
                    changeYear: true
                });
            });
            function ValidateAddEmployeeForm()
            {
                var strUsername = document.getElementById("txtUserName").value;
                if(isEmpty(strUsername))
                {
                    alert("Username Field can not be Empty ");
                    document.getElementById("txtUserName").focus();
                    return false;
                }
                else{
                    if(hasSpace(strUsername))
                    {
                        alert("Username must not have Spaces");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }
                    if(isAlphaNumeric(strUsername)==false)
                    {
                        alert("Username must have Alphanumeric characters only");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }
                    if(isNumeric(strUsername.charAt(0))){
                        alert("Username must start with Alphabet");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }

                    if(isInRange(6,20,strUsername)==false){
                        alert("Length of Username must be between 6-20");
                        document.getElementById("txtUserName").value="";
                        document.getElementById("txtUserName").focus();
                        return false;
                    }
                }

                var   strPassword=document.getElementById("txtPassword").value;
                if(isEmpty(strPassword)==true){ 
                    alert("Password is required");
                    document.getElementById("txtPassword").focus();
                    return false;
                }
               
                var   strConfirmPassword=document.getElementById("txtConfirmPassword").value;
                if(strPassword!=strConfirmPassword){
                    alert("Confirm Password must match Password");
                    document.getElementById("txtConfirmPassword").value="";
                    document.getElementById("txtConfirmPassword").focus();
                    return false;
                }
                  strStatus1=document.getElementById("rbActive").value;
                  strStatus2=document.getElementById("rbInactive").value;
                 
                  if((document.getElementById("rbActive").checked==false)&&(document.getElementById("rbInactive").checked==false))
                {
                    alert("Must select Status");
                    document.getElementById("rbActive").focus();
                    return false;
                }
                var strName = document.getElementById("txtName").value;
                if(isEmpty(strName))
                {
                    alert("Name Field cannot be Empty");
                    document.getElementById("txtName").focus();
                    return false;
                }
                if(isName(strName)==false)
                {
                    alert("Must enter valid name");
                    document.getElementById("txtName").value="";
                    document.getElementById("txtName").focus();
                    return false;
                }
                 var strDOB = document.getElementById("txtDOB").value;
                if(isEmpty(strDOB))
                {
                    alert("Enter Date of Birth");
                    document.getElementById("txtDOB").focus();
                    return false;
                }
                if(isFutureDate(strDOB))
                {
                    alert("Date of Birth can not be in Future");
                    document.getElementById("txtDOB").value="";
                    document.getElementById("txtDOB").focus();
                    return false;
                }
                strGender1=document.getElementById("rbMale").value;
                  strGender2=document.getElementById("rbFemale").value;
                 
                  if((document.getElementById("rbMale").checked==false)&&(document.getElementById("rbFemale").checked==false))
                {
                    alert("Must select Gender");
                    document.getElementById("rbMale").focus();
                    return false;
                }
               var strPhone= document.getElementById("txtPhone").value;
                
                var strMobile= document.getElementById("txtMobile").value;
           
                if(isEmpty(strPhone)&&isEmpty(strMobile))
                {
                    alert("Enter Phone number or Mobile number");
                    document.getElementById("txtPhone").focus();
                    return false;
                }
               else
                {    
                    if(isEmpty(strPhone)==false)
                    {
                        if(isNumeric(strPhone)==false)  
                        {
                            alert("Invalid Phone Number");
                            document.getElementById("txtPhone").value="";
                            document.getElementById("txtPhone").focus();
                            return false;
                        }
                        if(isInRange(10, 15, strPhone)==false)
                        {
                            alert("Length of Phone Number must be between 10 to 14");
                            document.getElementById("txtPhone").focus();
                            return false;
                        }
                    }
                    if(isEmpty(strMobile)==false)
                    {
                        if(isNumeric(strMobile)==false)  
                        {
                            alert("Invalid Mobile Number");
                            document.getElementById("txtMobile").value="";
                            document.getElementById("txtMobile").focus();
                    
                            return false;
                        }
                        if(isInRange(10, 15, strMobile)==false)
                        {
                            alert("Length of Mobile Number must be between 10 to 14");
                            document.getElementById("txtMobile").focus();
                            return false;
                        }
                    }
                }
                var   strEmailID=document.getElementById("txtEmailID").value;
                if(isEmpty(strEmailID)==true){ 
                    alert("Email id is required");
                    document.getElementById("txtEmailID").focus();
                    return false;
                }
                if(isEmail(strEmailID)==false)
                    {
                    alert("Invalid Email Id");
                    document.getElementById("txtEmailID").focus();
                    return false;
                    }
                    
                 var strAddress= document.getElementById("taAddress").value;
                if(isEmpty(strAddress))
                {
                    alert("Enter Address");
                    document.getElementById("taAddress").focus();
                    return false;
                }
                var strCountry= document.getElementById("ddlCountry").value;
                if(strCountry==0)
                {
                    alert("Select Country");
                    document.getElementById("ddlCountry").focus();
                    return false;
                }
                var strState= document.getElementById("ddlState").value;
                if(strState==0)
                {
                    alert("Select State");
                    document.getElementById("ddlState").focus();
                    return false;
                }
                var strCity= document.getElementById("ddlCity").value;
                if(strCity==0)
                {
                    alert("Select City");
                    document.getElementById("ddlCity").focus();
                    return false;
                }
                var strPin= document.getElementById("txtPin").value;
                if(isEmpty(strPin))
                {
                    alert("Enter PIN Code");
                    document.getElementById("txtPin").focus();
                    return false;
                }
                  var strDepartment= document.getElementById("txtDepartment").value;
                if(isEmpty(strDepartment))
                {
                    alert("Enter Department");
                    document.getElementById("txtDepartment").focus();
                    return false;
                }
                  var strDesignation= document.getElementById("txtDesignation").value;
                if(isEmpty(strDesignation))
                {
                    alert("Enter Designation");
                    document.getElementById("txtDesignation").focus();
                    return false;
                }
                var strDOJ=document.getElementById("txtDOJ").value;
                if(isEmpty(strDOJ)==true)
                { 
                    alert("Enter Date Of Joining");
                    document.getElementById("txtDOJ").focus();
                    return false;
                }   
                if(isFutureDate(strDOJ)==true)
                { 
                    alert("Date Of Joining can not be Future Date");
                    document.getElementById("txtDOJ").value="";
                    document.getElementById("txtDOJ").focus();
                    return false;
                }   
                return true;
            }
        </script>
        <script type="text/javascript">
            function getStateList(country_Id){
                var xmlHttp=getXmlHttpObject();
                if (xmlHttp==null){
                    alert ("Your browser does not support AJAX!");
                    return;
                }
                var url="state.jsp";
                url=url+"?country_Id="+country_Id;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
                xmlHttp.onreadystatechange=function (){
                    if (xmlHttp.readyState==4){
                        document.getElementById("divCity").innerHTML = "<select name=\"ddlCity\" id=\"ddlCity\"><option value=\"0\">Select</option></select>";
                        document.getElementById("divState").innerHTML = xmlHttp.responseText;
                    }
                }
            };
            function getCityList(state_Id){
                var xmlHttp=getXmlHttpObject();
                if (xmlHttp==null){
                    alert ("Your browser does not support AJAX!");
                    return;
                }
                var url="city.jsp";
                url=url+"?state_Id="+state_Id;
                xmlHttp.open("GET",url,true);
                xmlHttp.send(null);
                xmlHttp.onreadystatechange=function (){
                    if (xmlHttp.readyState==4){
                        document.getElementById("divCity").innerHTML = xmlHttp.responseText;
                    }
                }
            };
            function getXmlHttpObject(){
                var xmlHttp=null;
                try{
                    // Firefox, Opera 8.0+, Safari
                    xmlHttp=new XMLHttpRequest();
                }catch (e){
                    // Internet Explorer
                    try{
                        xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                    }catch (e){
                        xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                }
                return xmlHttp;
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
                <jsp:include page="AddEmployee.jsp" />
            </div>
        </div>
        <div class="clr">
        </div>
        <div id="footer_container">

            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
