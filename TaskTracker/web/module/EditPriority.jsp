<%@page import="beans.module.ManagePrioritiesBean"%>
<%@page import="datalayer.module.ManagePrioritiesServices"%>
<%
    int priority_Id = Integer.parseInt(request.getParameter("priority_Id"));
    ManagePrioritiesServices obj = new ManagePrioritiesServices();
    ManagePrioritiesBean objBean = obj.getPrioritybyId(priority_Id);
%>
<form action="ManagePrioritiesController.jsp" method="post" onsubmit="return ValidateEditPriorityForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Edit Priority Detail</strong></td>
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
                <fieldset>
                    <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                        <tr>
                            <td>

                                <table border="1" cellpadding="5" cellspacing="0" rules="none">

                                    <tr>
                                        <td><strong>Priority</strong></td>
                                        <td>
                                            <input type="hidden" value="<%=priority_Id%>" name="hdnPriorityId" id="hdnPriorityId">
                                            <input  id="txtPriority" name="txtPriority" type="text" value="<%=objBean.getTitle()%>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Description</strong></td>
                                        <td><textarea id="taDescription" cols="35" rows="3" name="taDescription"><%=objBean.getDescription()%></textarea></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" >
                                <input id="sbtnUpdate" value="Update" name="sbtnUpdate" type="submit" class="button"/>
                                <input id="rbtnReset" value="Reset" name="sbtnReset" type="Reset" class="button"/>
                                <input  id="btn" value="Back" name="btnBack" type="button" class="button" onclick="window.location='ManagePriorities_mp.jsp'"/>
                            </td>
                        </tr>
                    </table></fieldset>
            </td>
        </tr>
    </table>
</form>