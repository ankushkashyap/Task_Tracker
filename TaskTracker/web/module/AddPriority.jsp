
<form action="ManagePrioritiesController.jsp" method="post" onsubmit="return ValidateAddPriorityForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Add New Priority</strong></td>
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
            <td>
                <fieldset>
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table border="1" cellpadding="5" cellspacing="0" rules="none" class="styledOuter">
                                <tr>
                                    <td><strong>Priority</strong></td>
                                    <td><input  id="txtPriority" name="txtPriority" type="text" class="txtStyle"/></td>
                                </tr>
                                <tr>
                                    <td valign="top"><strong>Description</strong></td>
                                    <td><textarea id="taDescription" cols="35" rows="3" name="taDescription"></textarea></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >
                            <input id="sbtnSave" value="Save" name="sbtnSave" type="submit" class="button" />
                            <input id="sbtnSaveAndAddNew" value="Save &amp; Add New" name="sbtnSaveAndAddNew" type="submit" class="button"/>
                            <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>
                            <input  id="btnBack" value="Back" name="btnBack" type="button" class="button" onclick="window.location='ManagePriorities_mp.jsp'"/>
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form>