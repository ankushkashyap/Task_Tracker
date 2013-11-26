/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.common;

/**
 *
 * @author student
 */
public class CountryBean {
    private int country_Id;
    private String country_Name;
    private int is_Active;

    public int getCountry_Id() {
        return country_Id;
    }

    public void setCountry_Id(int country_Id) {
        this.country_Id = country_Id;
    }

    public String getCountry_Name() {
        return country_Name;
    }

    public void setCountry_Name(String country_Name) {
        this.country_Name = country_Name;
    }

    public int getIs_Active() {
        return is_Active;
    }

    public void setIs_Active(int is_Active) {
        this.is_Active = is_Active;
    }
    
}
