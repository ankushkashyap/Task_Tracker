/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class AssignNewEmployeeBean {
    private int employee_Id,isReportIng_Head;
    boolean member=true;
    private String employee_Name,doj,department,designation;

    public boolean isMember() {
        return member;
    }

    public void setMember(boolean member) {
        this.member = member;
    }

    public String getDepartment() {
        return department;
    }

   
    

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getDoj() {
        return doj;
    }

    public void setDoj(String doj) {
        this.doj = doj;
    }

    public int getEmployee_Id() {
        return employee_Id;
    }

    public void setEmployee_Id(int employee_Id) {
        this.employee_Id = employee_Id;
    }

    public String getEmployee_Name() {
        return employee_Name;
    }

    public void setEmployee_Name(String employee_Name) {
        this.employee_Name = employee_Name;
    }

    public int getIsReportIng_Head() {
        return isReportIng_Head;
    }

    public void setIsReportIng_Head(int isReportIng_Head) {
        this.isReportIng_Head = isReportIng_Head;
    }
    
}
