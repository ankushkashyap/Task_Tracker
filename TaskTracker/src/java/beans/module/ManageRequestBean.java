/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.module;

/**
 *
 * @author parwinder
 */
public class ManageRequestBean {
   
    
      private int request_Id;
    private String request_Title;
    private String request_Text;
    private String response_Text;
    private String response_Date;
    private String request_Date;
    private String request_By;

    public String getRequest_By() {
        return request_By;
    }

    public void setRequest_By(String request_By) {
        this.request_By = request_By;
    }

    public String getRequest_Date() {
        return request_Date;
    }

    public void setRequest_Date(String request_Date) {
        this.request_Date = request_Date;
    }

    public int getRequest_Id() {
        return request_Id;
    }

    public void setRequest_Id(int request_Id) {
        this.request_Id = request_Id;
    }

    public String getRequest_Text() {
        return request_Text;
    }

    public void setRequest_Text(String request_Text) {
        this.request_Text = request_Text;
    }

    public String getRequest_Title() {
        return request_Title;
    }

    public void setRequest_Title(String request_Title) {
        this.request_Title = request_Title;
    }

    public String getResponse_Date() {
        return response_Date;
    }

    public void setResponse_Date(String response_Date) {
        this.response_Date = response_Date;
    }

    public String getResponse_Text() {
        return response_Text;
    }

    public void setResponse_Text(String response_Text) {
        this.response_Text = response_Text;
    }
    }
