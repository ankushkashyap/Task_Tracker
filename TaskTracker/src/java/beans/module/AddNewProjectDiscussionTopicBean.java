/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class AddNewProjectDiscussionTopicBean {
    private int postedBy,hdnProjectId,hdnProjectDiscussionId;
    private String txtDiscussionTopic,taDiscussionDescription,taReply;

    public int getPostedBy() {
        return postedBy;
    }

    public void setPostedBy(int postedBy) {
        this.postedBy = postedBy;
    }

    public int getHdnProjectDiscussionId() {
        return hdnProjectDiscussionId;
    }

    public void setHdnProjectDiscussionId(int hdnProjectDiscussionId) {
        this.hdnProjectDiscussionId = hdnProjectDiscussionId;
    }

    public String getTaReply() {
        return taReply;
    }

    public void setTaReply(String taReply) {
        this.taReply = taReply;
    }


   
    public int getHdnProjectId() {
        return hdnProjectId;
    }

    public void setHdnProjectId(int hdnProjectId) {
        this.hdnProjectId = hdnProjectId;
    }

    

    public String getTaDiscussionDescription() {
        return taDiscussionDescription;
    }

    public void setTaDiscussionDescription(String taDiscussionDescription) {
        this.taDiscussionDescription = taDiscussionDescription;
    }

    public String getTxtDiscussionTopic() {
        return txtDiscussionTopic;
    }

    public void setTxtDiscussionTopic(String txtDiscussionTopic) {
        this.txtDiscussionTopic = txtDiscussionTopic;
    }
    
}
