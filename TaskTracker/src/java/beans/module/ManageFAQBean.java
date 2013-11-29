package beans.module;

public class ManageFAQBean {

    private int faq_Id, is_Active;
    private String faq, answer;

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getFaq() {
        return faq;
    }

    public void setFaq(String faq) {
        this.faq = faq;
    }

    public int getFaq_Id() {
        return faq_Id;
    }

    public void setFaq_Id(int faq_Id) {
        this.faq_Id = faq_Id;
    }

    public int getIs_Active() {
        return is_Active;
    }

    public void setIs_Active(int is_Active) {
        this.is_Active = is_Active;
    }
}
