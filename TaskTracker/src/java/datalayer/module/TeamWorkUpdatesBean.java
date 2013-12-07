/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package datalayer.module;

/**
 *
 * @author student
 */
public class TeamWorkUpdatesBean {
    private int project_id,phase_Id,projectTeam_Id,percentage_Of_Work;
    private String  phase_Name,actual_End_Date,remarks,duration,update_Date,projectTeam_Title;

    public String getProjectTeam_Title() {
        return projectTeam_Title;
    }

    public void setProjectTeam_Title(String projectTeam_Title) {
        this.projectTeam_Title = projectTeam_Title;
    }

    public String getActual_End_Date() {
        return actual_End_Date;
    }

    public void setActual_End_Date(String actual_End_Date) {
        this.actual_End_Date = actual_End_Date;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getPercentage_Of_Work() {
        return percentage_Of_Work;
    }

    public void setPercentage_Of_Work(int percentage_Of_Work) {
        this.percentage_Of_Work = percentage_Of_Work;
    }

    public int getPhase_Id() {
        return phase_Id;
    }

    public void setPhase_Id(int phase_Id) {
        this.phase_Id = phase_Id;
    }

    public String getPhase_Name() {
        return phase_Name;
    }

    public void setPhase_Name(String phase_Name) {
        this.phase_Name = phase_Name;
    }

    public int getProjectTeam_Id() {
        return projectTeam_Id;
    }

    public void setProjectTeam_Id(int projectTeam_Id) {
        this.projectTeam_Id = projectTeam_Id;
    }

    public int getProject_id() {
        return project_id;
    }

    public void setProject_id(int project_id) {
        this.project_id = project_id;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getUpdate_Date() {
        return update_Date;
    }

    public void setUpdate_Date(String update_Date) {
        this.update_Date = update_Date;
    }
    
}
