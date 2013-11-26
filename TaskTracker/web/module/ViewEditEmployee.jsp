<%@page import="beans.common.CityBean"%>
<%@page import="beans.common.StateBean"%>
<%@page import="beans.common.CountryBean"%>
<%@page import="java.util.List"%>
<%@page import="datalayer.common.CountryStateCityServices"%>
<%@page import="beans.module.AddEditEmployeeBean"%>
<%@page import="datalayer.module.ManageEmployeeServices"%>
<%
    int employee_Id = Integer.parseInt(request.getParameter("Emp_Id"));
    ManageEmployeeServices obj = new ManageEmployeeServices();
    AddEditEmployeeBean objBean = obj.viewEmployeeById(employee_Id);
    CountryStateCityServices objCSCS = new CountryStateCityServices();
    List<CountryBean> countryList = objCSCS.getAllCountryList();
    List<StateBean> stateList = objCSCS.getAllStateList(objBean.getDdlCountry());
    List<CityBean> cityList = objCSCS.getAllCityList(objBean.getDdlState());
%>

<form action="ManageEmployeeController.jsp" method="post" onsubmit="return ValidateEditEmployeeForm()">
    <table border="0" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="center" height="30" valign="top"><strong>Manage Profile</strong></td>
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
                                <legend><strong><em>Account Information</em></strong> </legend>
                                <table border="0" cellpadding="5" cellspacing="0" class="styledOuter">
                                    <tr>
                                        <td><strong>Username</strong></td>
                                        <td>
                                            <input type="hidden" name="hdnEmployeeId" value="<%=employee_Id%>"/>
                                            <%=objBean.getTxtUserName()%></td>
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
                                        <td><input id="txtName"  class="txtStyle" name="txtName" type="text" value="<%=objBean.getTxtName()%>"/></td>
                                    </tr> <tr>
                                        <td><strong>Date Of Birth</strong></td>
                                        <td><input readonly="readonly" id="txtDOB"  class="txtStyle"  name="txtDOB" type="text" value="<%=objBean.getTxtDOB()%>"/></td>
                                    </tr> <tr>
                                        <td><strong>Gender</strong></td>
                                        <td>
                                            <input type="radio" name="rbtnGender" id="rbMale" value="Male" checked="checked">Male
                                            <input type="radio" name="rbtnGender" id="rbFemale" value="Female">Female
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Phone</strong></td>
                                        <td><input id="txtPhone"  class="txtStyle" name="txtPhone" type="text" value="<%=objBean.getTxtPhone()%>"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Mobile</strong></td>
                                        <td><input  class="txtStyle" id="txtMobile"  name="txtMobile" type="text" value="<%=objBean.getTxtMobile()%>"/></td>
                                    </tr> <tr>
                                        <td><strong>Email ID</strong></td>
                                        <td><input  class="txtStyle" id="txtEmailID"  name="txtEmailID" type="text" value="<%=objBean.getTxtEmailID()%>"/></td>
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
                                        <td><textarea cols="23" rows="3" name="taAddress" id="taAddress"><%=objBean.getTaAddress()%></textarea>
                                    </tr>
                                    <tr>
                                        <td><strong>Country</strong></td>
                                        <td>
                                            <select id="ddlCountry" name="ddlCountry" onchange="getStateList(this.value)">
                                                <option value="0">Select</option>
                                                <%
                                                    if (countryList.size() > 0) {
                                                        for (int i = 0; i < countryList.size(); i++) {
                                                            CountryBean objCB = countryList.get(i);
                                                            String country = "";
                                                            if (objCB.getCountry_Id() == objBean.getDdlCountry()) {
                                                                country = "selected";
                                                            }
                                                %>
                                                <option <%=country%> value="<%=objCB.getCountry_Id()%>"><%=objCB.getCountry_Name()%></option>
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
                                                <select id="ddlState" name="ddlState"  onchange="getCityList(this.value)">
                                                    <option value="0">Select</option>
                                                    <%
                                                        if (stateList.size() > 0) {
                                                            for (int i = 0; i < stateList.size(); i++) {
                                                                StateBean objSB = stateList.get(i);
                                                                String state = "";
                                                                if (objSB.getState_Id() == objBean.getDdlState()) {
                                                                    state = "selected";
                                                                }
                                                    %>
                                                    <option <%=state%> value="<%=objSB.getState_Id()%>"><%=objSB.getState_Name()%></option>
                                                    <%
                                                            }
                                                        }

                                                    %>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td><strong>City</strong></td>
                                        <td>
                                            <div id="divCity">
                                                <select id="ddlCity" name="ddlCity" >
                                                    <option value="0"  >Select</option>
                                                    <%
                                                        if (cityList.size() > 0) {
                                                            for (int i = 0; i < cityList.size(); i++) {
                                                                CityBean objCityBean = cityList.get(i);
                                                                String city = "";
                                                                if (objCityBean.getCity_Id() == objBean.getDdlCity()) {
                                                                    city = "selected";
                                                                }
                                                    %>
                                                    <option <%=city%> value="<%=objCityBean.getCity_Id()%>"><%=objCityBean.getCity_Name()%></option>
                                                    <%
                                                            }
                                                        }

                                                    %>
                                                </select>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Pin Code</strong></td>
                                        <td><input class="txtStyle" id="txtPin"  name="txtPin" type="text" value="<%=objBean.getTxtPinCode()%>"/></td>
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
                                        <td><input id="txtDepartment"  name="txtDepartment" type="text" value="<%=objBean.getTxtDepartment()%>" class="txtStyle"/></td>
                                    </tr>

                                    <tr>
                                        <td><strong>Designation</strong></td>
                                        <td><input id="txtDesignation"  name="txtDesignation" type="text" value="<%=objBean.getTxtDesignation()%>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Date Of Joining</strong></td>
                                        <td><input readonly="readonly" id="txtDOJ"  name="txtDOJ" type="text" value="<%=objBean.getTxtDOJ()%>" class="txtStyle"/></td>
                                    </tr>
                                    <tr>
                                        <td valign="top"><strong>Other Details</strong></td>
                                        <td><textarea cols="23" rows="3" name="taOtherDetails" id="taOtherDetails"><%=objBean.getTaOtherDetails()%></textarea>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <input type="submit" name="sbtnUpdate" value="Update" id="sbtnUpdate" class="button"/>&nbsp;
                            <input type="reset" name="rbtnReset" value="Reset" id="rbtnReset" class="button"/>&nbsp;
                            <input type="button" name="btnBack" value="Back" id="btnBack" class="button"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>


