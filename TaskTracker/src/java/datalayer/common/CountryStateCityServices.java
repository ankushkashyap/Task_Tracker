/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.common;

import beans.common.CityBean;
import beans.common.CountryBean;
import beans.common.StateBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author student
 */
public class CountryStateCityServices {

    public List<CountryBean> getAllCountryList() {
         List<CountryBean> alst = new ArrayList<CountryBean>();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectDB.connect();
            String query = "select * from CountryMaster where  Is_Active=1";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                CountryBean objBean = new CountryBean();
                objBean.setCountry_Id(rs.getInt("Country_Id"));
                objBean.setCountry_Name(rs.getString("Country_Name"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                alst.add(objBean);
            }

        } catch (Exception e) {
            System.out.println("Exception in getCountryList() : " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return alst;
    }

    public ArrayList getAllStateList(int country_Id) {
        ArrayList alst = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectDB.connect();
            String query = "select * from StateMaster where Country_Id='" + country_Id + "' and Is_Active=1";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
             System.out.println(query+"+++++++++++++++++++++++++++++++==");
            while (rs.next()) {
               
                StateBean objBean = new StateBean();
                objBean.setState_Id(rs.getInt("State_Id"));
                objBean.setState_Name(rs.getString("State_Name"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                alst.add(objBean);

            }

        } catch (Exception e) {
            System.out.println("Exception in getAllStateList(int country_Id) : " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return alst;
    }

    public ArrayList getAllCityList(int stateId) {
        ArrayList alst = new ArrayList();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = ConnectDB.connect();
            String query = "select * from CityMaster where State_Id='" + stateId + "' and Is_Active=1";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            while (rs.next()) {
                CityBean objBean = new CityBean();
                objBean.setCity_Id(rs.getInt("City_Id"));
                objBean.setCity_Name(rs.getString("City_Name"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                alst.add(objBean);

            }

        } catch (Exception e) {
            System.out.println("Exception in getAllCityList(int stateId) : " + e);
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
            }
        }
        return alst;
    }
}
