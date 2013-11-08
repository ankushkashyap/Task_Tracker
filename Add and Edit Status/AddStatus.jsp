
<form action="ManageStatusController.jsp" method="post" onsubmit="return ValidateAddStatusForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Add Status</strong></td>
        </tr>
        <tr>
            <td align="left">
                <%
                    String msg = "";

                    if (request.getParameter("msg") != null) {
                        msg = request.getParameter("msg");
                    }
                %>
                <label id ="lblMsg">
                    <%=msg%></label>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Status Information </em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td><strong>Status</strong></td>
                                        <td><input  id="txtStatus" name="txtStatus" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="23" rows="2" name="taDescription"></textarea></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            <input id="sbtnSave" value="Save" name="sbtnSave" type="submit" class="button"/>&nbsp;
                            <input id="sbtnSaveAndAddNew" value="Save &amp; Add New" name="sbtnSaveAndAddNew" type="submit" class="button"/>&nbsp;
                            <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>&nbsp;
                            <input  id="btnBackToStatus" value="Back To Status" name="btnBackToStatus" type="button" onclick="window.location='ManageStatus_mp.jsp'" class="button"/></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>