package beans.module;

public class AddEditProjectTypeBean {

    private int hdnProjectTypeId;
    private String txtProjectType, taDescription;

    public int getHdnProjectTypeId() {
        return hdnProjectTypeId;
    }

    public void setHdnProjectTypeId(int hdnProjectTypeId) {
        this.hdnProjectTypeId = hdnProjectTypeId;
    }

    public String getTaDescription() {
        return taDescription;
    }

    public void setTaDescription(String taDescription) {
        this.taDescription = taDescription;
    }

    public String getTxtProjectType() {
        return txtProjectType;
    }

    public void setTxtProjectType(String txtProjectType) {
        this.txtProjectType = txtProjectType;
    }
    
}
