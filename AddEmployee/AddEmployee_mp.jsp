<%@page import="beans.common.CityBean"%>
<%@page import="beans.common.StateBean"%>
<%@page import="beans.common.CountryBean"%>
<%@page import="java.util.List"%>
<%@page import="datalayer.common.CountryStateCityServices"%>
<%
    CountryStateCityServices objCSCS = new CountryStateCityServices();
    List<CountryBean> countryList = objCSCS.getAllCountryList();
    String msg = "";
    if (request.getParameter("msg") != null) {
        msg = request.getParameter("msg");
    }
%>
<form action="ManageEmployeeController.jsp" method="post" onsubmit="return ValidateAddEmployeeForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Add Employee Detail</strong></td>
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
                                <legend><strong><em>Account Information</em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td><strong>User Name</strong></td>
                                        <td><input id="txtUserName"  name="txtUserName" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Password</strong></td>
                                        <td><input id="txtPassword"  name="txtPassword" type="password" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Confirm Password</strong></td>
                                        <td><input id="txtConfirmPassword"  name="txtConfirmPassword" type="password" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Status</strong></td>
                                        <td>
                                            <input type="radio" name="rbStatus" id="rbActive" value="1" >Active
                                            <input type="radio" name="rbStatus" id="rbInactive"  value="0">Inactive
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Personal Information</em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td><strong>Name</strong></td>
                                        <td><input id="txtName"  name="txtName" type="text" class="txtStyle"/></td>
                                    </tr> <tr>
                                        <td><strong>Date Of Birth</strong></td>
                                        <td><input readonly="readonly" id="txtDOB"  name="txtDOB" type="text" class="txtStyle"/></td>
                                    </tr> <tr>
                                        <td><strong>Gender</strong></td>
                                        <td>
                                            <input type="radio" name="rbGender" id="rbMale" value="M">Male
                                            <input type="radio" name="rbGender" id="rbFemale" value="F">Female
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Phone</strong></td>
                                        <td><input id="txtPhone"  name="txtPhone" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Mobile</strong></td>
                                        <td><input id="txtMobile"  name="txtMobile" type="text" class="txtStyle"/></td>
                                    </tr> <tr>
                                        <td><strong>Email ID</strong></td>
                                        <td><input id="txtEmailID"  name="txtEmailID" type="text" class="txtStyle"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Address Information</em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td valign="top"><strong>Address</strong></td>
                                        <td><textarea cols="23" rows="3" name="taAddress" id="taAddress"></textarea>
                                    </tr>
                                    <tr>
                                        <td><strong>Country</strong></td>
                                        <td>
                                            <select id="ddlCountry" name="ddlCountry" onchange="getStateList(this.value)">
                                                <option selected="selected" value="0">Select</option>
                                                <%
                                                    if (countryList.size() > 0) {
                                                        for (int i = 0; i < countryList.size(); i++) {
                                                            CountryBean objCB = countryList.get(i);
                                                %>
                                                <option value="<%=objCB.getCountry_Id()%>"><%=objCB.getCountry_Name()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>State</strong></td>
                                        <td>
                                            <div id="divState">
                                                <select id="ddlState" name="ddlState">
                                                    <option value="0" selected="selected">Select</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td><strong>City</strong></td>
                                        <td>
                                            <div id="divCity">
                                                <select id="ddlCity" name="ddlCity">
                                                    <option value="0" selected="selected">Select</option>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Pin Code</strong></td>
                                        <td><input id="txtPin"  name="txtPin" type="text" class="txtStyle"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend><strong><em>Professional Information</em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">                           
                                    <tr>
                                        <td><strong>Department</strong></td>
                                        <td><input id="txtDepartment"  name="txtDepartment" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Designation</strong></td>
                                        <td><input id="txtDesignation"  name="txtDesignation" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Date Of Joining</strong></td>
                                        <td><input id="txtDOJ"  name="txtDOJ" type="text" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Other Details</strong></td>
                                        <td><textarea cols="23" rows="3" name="taOtherDetails" id="taOtherDetails"></textarea>
                                    </tr>

                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="submit" name="sbtnSave" value="Save" id="sbtnSave" class="button"/>&nbsp;
                            <input type="submit" name="sbtnSaveAddNew" value="Save &amp; Add New" class="button" id="sbtnSaveAddNew">&nbsp;
                            <input type="reset" name="rbtnReset" value="Reset" id="rbtnReset" class="button"/>&nbsp;
                            <input type="button" name="btnBack" value="Back" id="btnBack" class="button" onclick="window.location='ManageEmployee_mp.jsp'"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>