/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class AddEditTaskSheetBean {

    private String txtTask, txtActualEndDate, taDescription, txtStartDate, txtEndDate,txtAssignDate;
    int ddlAssignTo, ddlStatus, ddlPriority, hdnProjectTeam_Id, hdnPhase_Id, hdnProject_Id;
private int hdnProjectTaskSheet_Id;

    public String getTxtAssignDate() {
        return txtAssignDate;
    }

    public void setTxtAssignDate(String txtAssignDate) {
        this.txtAssignDate = txtAssignDate;
    }


    public int getDdlAssignTo() {
        return ddlAssignTo;
    }

    public int getHdnProjectTaskSheet_Id() {
        return hdnProjectTaskSheet_Id;
    }

    public void setHdnProjectTaskSheet_Id(int hdnProjectTaskSheet_Id) {
        this.hdnProjectTaskSheet_Id = hdnProjectTaskSheet_Id;
    }

    public void setDdlAssignTo(int ddlAssignTo) {
        this.ddlAssignTo = ddlAssignTo;
    }

    public int getDdlPriority() {
        return ddlPriority;
    }

    public void setDdlPriority(int ddlPriority) {
        this.ddlPriority = ddlPriority;
    }

    public int getDdlStatus() {
        return ddlStatus;
    }

    public void setDdlStatus(int ddlStatus) {
        this.ddlStatus = ddlStatus;
    }

    public int getHdnPhase_Id() {
        return hdnPhase_Id;
    }

    public void setHdnPhase_Id(int hdnPhase_Id) {
        this.hdnPhase_Id = hdnPhase_Id;
    }

    public int getHdnProjectTeam_Id() {
        return hdnProjectTeam_Id;
    }

    public void setHdnProjectTeam_Id(int hdnProjectTeam_Id) {
        this.hdnProjectTeam_Id = hdnProjectTeam_Id;
    }

    public int getHdnProject_Id() {
        return hdnProject_Id;
    }

    public void setHdnProject_Id(int hdnProject_Id) {
        this.hdnProject_Id = hdnProject_Id;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtActualEndDate() {
        return txtActualEndDate;
    }

    public void setTxtActualEndDate(String txtActualEndDate) {
        this.txtActualEndDate = txtActualEndDate;
    }

    public String getTxtEndDate() {
        return txtEndDate;
    }

    public void setTxtEndDate(String txtEndDate) {
        this.txtEndDate = txtEndDate;
    }

    public String getTxtStartDate() {
        return txtStartDate;
    }

    public void setTxtStartDate(String txtStartDate) {
        this.txtStartDate = txtStartDate;
    }

    public String getTxtTask() {
        return txtTask;
    }

    public void setTxtTask(String txtTask) {
        this.txtTask = txtTask;
    }
}
