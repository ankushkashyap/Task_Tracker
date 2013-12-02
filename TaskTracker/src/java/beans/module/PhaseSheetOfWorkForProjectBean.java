/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author parwinder
 */
public class PhaseSheetOfWorkForProjectBean {
      private String phase,projectTeam_Title;
    private int percentage_Of_Work;

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

    public String getProjectTeam_Title() {
        return projectTeam_Title;
    }

    public void setProjectTeam_Title(String projectTeam_Title) {
        this.projectTeam_Title = projectTeam_Title;
    }

    
    
    
}
