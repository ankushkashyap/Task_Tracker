



<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires",0);
response.setHeader("pragma","no-store");

if (session.getAttribute("User_Id")==null)
       {
    %>
    <jsp:forward page="LogoutCheckforward.jsp"/>
    <%
}



%>