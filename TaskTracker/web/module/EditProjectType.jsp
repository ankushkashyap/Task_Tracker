 

<%@page import="beans.module.ManageProjectTypeBean"%>
<%@page import="datalayer.module.ManageProjectTypeServices"%>
<%
    int projectType_Id = Integer.parseInt(request.getParameter("projectType_Id"));
    ManageProjectTypeServices obj = new ManageProjectTypeServices();
    ManageProjectTypeBean objBean = obj.viewProjectTypeById(projectType_Id);
    String title = objBean.getTitle();
    String desc = objBean.getDescription();
    String msg = "";
    if (request.getParameter("msg") != null) {
        msg = request.getParameter("msg");
    }
%>
<form name="a" method="post" action="ManageProjectTypeController.jsp" onsubmit="return ValidateEditProjectTypeForm()">
    <table border="0" cellpadding="5" cellspacing="0" align="center">
        <tr>
            <td align="center">
                <strong>Edit Project Type</strong><br />
            </td>
        </tr>
        <tr>
            <td align="left">

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
                                <strong>Project Type</strong>
                            </td>
                            <td>
                                <input type="hidden" name="hdnProjectTypeId" value="<%=projectType_Id%>" />
                                <input value="<%=title%>" id="txtProjectType" name="txtProjectType" type="text" class="txtStyle"/>
                            </td> 
                        </tr>

                        <tr>
                            <td valign="top">
                                <strong>Description</strong>
                            </td>
                            <td>
                                <textarea id="taDescription" name="taDescription" rows="3" cols="20"><%=desc%></textarea>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="3" align="right">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>
                                            <input id="sbtnUpdate" name="sbtnUpdate" type="submit" value="Update" class="button"/>

                                            <input id="rbtnReset"  name="rbtnReset" type="reset" value="Reset" class="button"/>
                                            <input type="button" name="btnBack to Project Type" id="btnBack to Project Type" class="button" onclick="window.location='ManageProjectType_mp.jsp'" value="Back to Project Type" >
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
</form>