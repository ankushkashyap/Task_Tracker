<%@page import="datalayer.module.ManageRequestServices"%>
<%@page import="beans.module.ManageResponseBean"%>
<%@page import="beans.module.ManageRequestBean"%>
<%@page import="datalayer.module.ManageResponseServices"%>
<%
    int requestId = Integer.parseInt(request.getParameter("requestId"));
    ManageRequestServices objMRS = new ManageRequestServices ();
    ManageRequestBean objBean = objMRS.viewResponse(requestId);

%>
<table border="0" cellpadding="5" cellspacing="0" align="center">
    <tr>
        <td align="center">
            <label>
                View Response</label><br/>
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
        <td align="left">
            <table align="center" border="0" cellpadding="5" cellspacing="0">
                <tr>
                    <td align="center">
                        <fieldset>
                        <table class="styled" border="1" cellpadding="5" cellspacing="0" rules="none">
                            <tr>
                                <td >
                                    <strong>Request Date</strong>
                                </td>
                                <td align="left" valign="top">
                                    <label id="lblRequestDate" name="lblRequestDate"><%=objBean.getRequest_Date() %></label>
                                </td>
                            </tr>
                            <tr>
                                <td >
                                    <strong>Request Title</strong>
                                </td>
                                <td align="left">
                                    <label  id="lblRequestTitle" name="lblRequestTitle" ><%=objBean.getRequest_Title() %></label>
                                </td>
                            </tr>
                            <tr>
                                <td  valign="top">
                                    <strong>Description</strong>
                                </td>
                                <td align="left">
                                    <label  id="lblDescription" name="lblDescription"><%=objBean.getRequest_Text() %></label>
                                </td>
                            </tr> 
                            <tr>
                                <td >
                                    <strong>Responce Date</strong>
                                </td>
                                <td align="left" valign="top">
                                    <label  id="lblResponseDate" name="lblResponseDate"><%=objBean.getResponse_Date() %></label>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <strong>Response</strong>
                                </td>
                                <td align="left">
                                    <label  id="lblResponse" name="lblResponse"><%=objBean.getResponse_Text() %></label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <input onclick="window.location='ManageRequest_mp.jsp'" id="btnClose" name="btnClose" type="button" class="button"
                                           value="Close" />
                                </td>
                            </tr>
                        </table>
                            </fieldset>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>