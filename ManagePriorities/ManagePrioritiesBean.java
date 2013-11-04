/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

 

/**
 *
 * @author student
 */
public class ManagePrioritiesBean {

    private int priority_Id, is_Active;
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

    public int getPriority_Id() {
        return priority_Id;
    }

    public void setPriority_Id(int priority_Id) {
        this.priority_Id = priority_Id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
