
package beans.module;

public class ProjectTaskSheetBean {
    private int projectTaskSheet_Id;
private String task_Title,description,status,priority,duration,assign_Date,actual_End_Date;

    public String getActual_End_Date() {
        return actual_End_Date;
    }

    public void setActual_End_Date(String actual_End_Date) {
        this.actual_End_Date = actual_End_Date;
    }

    public String getAssign_Date() {
        return assign_Date;
    }

    public void setAssign_Date(String assign_Date) {
        this.assign_Date = assign_Date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public int getProjectTaskSheet_Id() {
        return projectTaskSheet_Id;
    }

    public void setProjectTaskSheet_Id(int projectTaskSheet_Id) {
        this.projectTaskSheet_Id = projectTaskSheet_Id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTask_Title() {
        return task_Title;
    }

    public void setTask_Title(String task_Title) {
        this.task_Title = task_Title;
    }
    
    
    
    
}
