/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;


/**
 *
 * @author student
 */
public class ManageEmployeeBean {
    private int user_Id,status;
    private String user_Name,Name,Phone,Email_Id,Professional;

    public String getEmail_Id() {
        return Email_Id;
    }

    public void setEmail_Id(String Email_Id) {
        this.Email_Id = Email_Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getProfessional() {
        return Professional;
    }

    public void setProfessional(String Professional) {
        this.Professional = Professional;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int user_Id) {
        this.user_Id = user_Id;
    }

    public String getUser_Name() {
        return user_Name;
    }

    public void setUser_Name(String user_Name) {
        this.user_Name = user_Name;
    }
    
    
}
