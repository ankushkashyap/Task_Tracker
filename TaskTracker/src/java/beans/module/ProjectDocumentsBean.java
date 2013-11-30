/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author student
 */
public class ProjectDocumentsBean {

    private int projectDocuments_Id, is_Active, project_Id;
    private String document_Title, description, document_Path,update_Date ;

    public String getUpdate_Date() {
        return update_Date;
    }

    public void setUpdate_Date(String update_Date) {
        this.update_Date = update_Date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDocument_Path() {
        return document_Path;
    }

    public void setDocument_Path(String document_Path) {
        this.document_Path = document_Path;
    }

    public String getDocument_Title() {
        return document_Title;
    }

    public void setDocument_Title(String document_Title) {
        this.document_Title = document_Title;
    }

    public int getIs_Active() {
        return is_Active;
    }

    public void setIs_Active(int is_Active) {
        this.is_Active = is_Active;
    }

    public int getProjectDocuments_Id() {
        return projectDocuments_Id;
    }

    public void setProjectDocuments_Id(int projectDocuments_Id) {
        this.projectDocuments_Id = projectDocuments_Id;
    }

    public int getProject_Id() {
        return project_Id;
    }

    public void setProject_Id(int project_Id) {
        this.project_Id = project_Id;
    }
}
