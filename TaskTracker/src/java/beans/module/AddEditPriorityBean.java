/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class AddEditPriorityBean {
     private int hdnPriorityId;
    private String txtPriority,taDescription;

    public int getHdnPriorityId() {
        return hdnPriorityId;
    }

    public void setHdnPriorityId(int hdnPriorityId) {
        this.hdnPriorityId = hdnPriorityId;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtPriority() {
        return txtPriority;
    }

    public void setTxtPriority(String txtPriority) {
        this.txtPriority = txtPriority;
    }
    

     
}
