/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class AddEditStatusBean {
    private int hdnStatusId;
    private String txtStatus,taDescription;

    public int getHdnStatusId() {
        return hdnStatusId;
    }

    public void setHdnStatusId(int hdnStatusId) {
        this.hdnStatusId = hdnStatusId;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtStatus() {
        return txtStatus;
    }

    public void setTxtStatus(String txtStatus) {
        this.txtStatus = txtStatus;
    }
    
}
