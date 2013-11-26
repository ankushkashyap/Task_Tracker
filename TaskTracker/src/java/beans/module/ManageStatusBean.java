/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

 

/**
 *
 * @author student
 */
public class ManageStatusBean {

    private int status_Id, is_Active;
    private String title, description;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getIs_Active() {
        return is_Active;
    }

    public void setIs_Active(int is_Active) {
        this.is_Active = is_Active;
    }

    public int getStatus_Id() {
        return status_Id;
    }

    public void setStatus_Id(int status_Id) {
        this.status_Id = status_Id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
