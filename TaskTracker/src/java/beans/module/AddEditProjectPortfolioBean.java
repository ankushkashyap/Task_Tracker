/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

import java.sql.Date;

/**
 *
 * @author parwinder
 */
public class AddEditProjectPortfolioBean {

    private int hdnProjectId, rbStatus, ddlProjectType,projectPhase_Id;
    private String txtTitle, taDescription, ddlProjectTypeName, txtClient, taClientDescription;
    private String txtStartDate, txtEndDate;
    private String txtPhaseStartDate, txtPhaseEndDate,txtPhase,txtPhaseActualEndDate;

    public String getTxtPhaseActualEndDate() {
        return txtPhaseActualEndDate;
    }

    public void setTxtPhaseActualEndDate(String txtPhaseActualEndDate) {
        this.txtPhaseActualEndDate = txtPhaseActualEndDate;
    }
    

    public String getTxtPhase() {
        return txtPhase;
    }

    public void setTxtPhase(String txtPhase) {
        this.txtPhase = txtPhase;
    }

    public int getDdlProjectType() {
        return ddlProjectType;
    }

    public void setDdlProjectType(int ddlProjectType) {
        this.ddlProjectType = ddlProjectType;
    }

    public String getDdlProjectTypeName() {
        return ddlProjectTypeName;
    }

    public void setDdlProjectTypeName(String ddlProjectTypeName) {
        this.ddlProjectTypeName = ddlProjectTypeName;
    }

    public int getHdnProjectId() {
        return hdnProjectId;
    }

    public void setHdnProjectId(int hdnProjectId) {
        this.hdnProjectId = hdnProjectId;
    }

    public int getProjectPhase_Id() {
        return projectPhase_Id;
    }

    public void setProjectPhase_Id(int projectPhase_Id) {
        this.projectPhase_Id = projectPhase_Id;
    }

    public int getRbStatus() {
        return rbStatus;
    }

    public void setRbStatus(int rbStatus) {
        this.rbStatus = rbStatus;
    }

    public String getTaClientDescription() {
        return taClientDescription;
    }

    public void setTaClientDescription(String taClientDescription) {
        this.taClientDescription = taClientDescription;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtClient() {
        return txtClient;
    }

    public void setTxtClient(String txtClient) {
        this.txtClient = txtClient;
    }

    public String getTxtEndDate() {
        return txtEndDate;
    }

    public void setTxtEndDate(String txtEndDate) {
        this.txtEndDate = txtEndDate;
    }

    public String getTxtPhaseEndDate() {
        return txtPhaseEndDate;
    }

    public void setTxtPhaseEndDate(String txtPhaseEndDate) {
        this.txtPhaseEndDate = txtPhaseEndDate;
    }

    public String getTxtPhaseStartDate() {
        return txtPhaseStartDate;
    }

    public void setTxtPhaseStartDate(String txtPhaseStartDate) {
        this.txtPhaseStartDate = txtPhaseStartDate;
    }

    public String getTxtStartDate() {
        return txtStartDate;
    }

    public void setTxtStartDate(String txtStartDate) {
        this.txtStartDate = txtStartDate;
    }

    public String getTxtTitle() {
        return txtTitle;
    }

    public void setTxtTitle(String txtTitle) {
        this.txtTitle = txtTitle;
    }

}
