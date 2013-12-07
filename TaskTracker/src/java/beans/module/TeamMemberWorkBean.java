/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class TeamMemberWorkBean {
    
    private int project_Id,phase_Id,projectTeam_Id,percentage_Of_Work;
    private String team,phase,duration,actual_End_Date,remarks;

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

    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    public int getPhase_Id() {
        return phase_Id;
    }

    public void setPhase_Id(int phase_Id) {
        this.phase_Id = phase_Id;
    }

    public int getProjectTeam_Id() {
        return projectTeam_Id;
    }

    public void setProjectTeam_Id(int projectTeam_Id) {
        this.projectTeam_Id = projectTeam_Id;
    }

    public int getProject_Id() {
        return project_Id;
    }

    public void setProject_Id(int project_Id) {
        this.project_Id = project_Id;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }
}