/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class ProjectDiscussionBean {

    private int projectDiscussion_Id;
    private String topic;
    private String description;
    private int posted_By;
    private String postedByName;
    private String posted_Date;
    private int status;
    private int project_Id;
    private int reponses;
    private String replay;

    public String getReplay() {
        return replay;
    }

    public void setReplay(String replay) {
        this.replay = replay;
    }

    public String getPostedByName() {
        return postedByName;
    }

    public void setPostedByName(String postedByName) {
        this.postedByName = postedByName;
    }

    public int getReponses() {
        return reponses;
    }

    public void setReponses(int reponses) {
        this.reponses = reponses;
    }
    

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPosted_By() {
        return posted_By;
    }

    public void setPosted_By(int posted_By) {
        this.posted_By = posted_By;
    }

    public String getPosted_Date() {
        return posted_Date;
    }

    public void setPosted_Date(String posted_Date) {
        this.posted_Date = posted_Date;
    }

    public int getProjectDiscussion_Id() {
        return projectDiscussion_Id;
    }

    public void setProjectDiscussion_Id(int projectDiscussion_Id) {
        this.projectDiscussion_Id = projectDiscussion_Id;
    }

    public int getProject_Id() {
        return project_Id;
    }

    public void setProject_Id(int project_Id) {
        this.project_Id = project_Id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }
    
}
