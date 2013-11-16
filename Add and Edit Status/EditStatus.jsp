<%@page import="datalayer.module.ManageStatusServices"%>
<%
    int status_Id = Integer.parseInt(request.getParameter("status_Id"));
    String title = request.getParameter("title");
    String desc = request.getParameter("desc");
    String msg = "";
    if (request.getParameter("msg") != null) {
        msg = request.getParameter("msg");
    }
%>
<form action="ManageStatusController.jsp" method="post" onsubmit="return ValidateEditStatusForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Edit Status</strong></td>
        </tr>
        <tr>
            <td align="left">

                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="5" cellspacing="0">
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Status Information </em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td><strong>Status</strong></td>
                                        <td>
                                            <input type="hidden" name="hdnStatusId" value="<%=status_Id %>">
                                            <input  id="txtStatus" name="txtStatus" type="text" value="<%=title %>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="23" rows="2" name="taDescription"><%=desc %></textarea></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            <input id="sbtnUpdate" value="Update" name="sbtnUpdate" type="submit" class="button"/>&nbsp;
                            <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>&nbsp;
                            <input  id="btnBackToStatus" value="Back To Status" name="btnBackToStatus" type="button" class="button" onclick="window.location='ManageStatus_mp.jsp'"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>