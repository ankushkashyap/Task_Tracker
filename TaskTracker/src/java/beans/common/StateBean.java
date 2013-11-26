/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.common;

/**
 *
 * @author student
 */
public class StateBean {
    private int state_Id;
    private String state_Name;
    private int is_Active;

    public int getIs_Active() {
        return is_Active;
    }

    public void setIs_Active(int is_Active) {
        this.is_Active = is_Active;
    }

    public int getState_Id() {
        return state_Id;
    }

    public void setState_Id(int state_Id) {
        this.state_Id = state_Id;
    }

    public String getState_Name() {
        return state_Name;
    }

    public void setState_Name(String state_Name) {
        this.state_Name = state_Name;
    }
    
}
