/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author parwinder
 */
public class ManageProjectTeamBean {

     
    private String team;
    private String description;
    private String phase;
    private String last_Update;
    private int team_Member;
    private int projectTeam_Id;
    private String reportingHead;

    public String getReportingHead() {
        return reportingHead;
    }

    public void setReportingHead(String reportingHead) {
        this.reportingHead = reportingHead;
    }

    public String getLast_Update() {
        return last_Update;
    }

    public void setLast_Update(String last_Update) {
        this.last_Update = last_Update;
    }

    public int getProjectTeam_Id() {
        return projectTeam_Id;
    }

    public void setProjectTeam_Id(int projectTeam_Id) {
        this.projectTeam_Id = projectTeam_Id;
    }
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhase() {
        return phase;
    }

    public void setPhase(String phase) {
        this.phase = phase;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public int getTeam_Member() {
        return team_Member;
    }

    public void setTeam_Member(int team_Member) {
        this.team_Member = team_Member;
    }
    
    
    
}
