
package datalayer.module;

import beans.module.AddEditFAQBean;
import beans.module.ManageFAQBean;
import datalayer.common.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author student
 */
public class ManageFAQServices {

    public List<ManageFAQBean> getAllFAQList() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManageFAQBean> faqList = new ArrayList<ManageFAQBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from FAQMaster ;";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManageFAQBean objBean = new ManageFAQBean();
                objBean.setFaq_Id(rs.getInt("Faq_Id"));
                objBean.setFaq(rs.getString("FAQ"));
                objBean.setAnswer(rs.getString("Answer"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                faqList.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageFAQServices/getAllFAQList() : " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                //System.out.println("In finally of getAllOperators method of ManageOperatorService in admin datalayer: " + e);
            }

        }
        return faqList;
    }
    public List<ManageFAQBean> getAllFAQListForViewFAQ() {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        List<ManageFAQBean> faqList = new ArrayList<ManageFAQBean>();
        try {
            con = ConnectDB.connect();
            st = con.createStatement();
            String str = "select * from FAQMaster where Is_Active=1;";
            rs = st.executeQuery(str);
            while (rs.next()) {
                ManageFAQBean objBean = new ManageFAQBean();
                objBean.setFaq_Id(rs.getInt("Faq_Id"));
                objBean.setFaq(rs.getString("FAQ"));
                objBean.setAnswer(rs.getString("Answer"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
                faqList.add(objBean);
            }
        } catch (Exception e) {
            System.out.println("Exception in catch of ManageFAQServices/getAllFAQList() : " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                //System.out.println("In finally of getAllOperators method of ManageOperatorService in admin datalayer: " + e);
            }

        }
        return faqList;
    }

    public ManageFAQBean getFAQById(int faq_Id) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ManageFAQBean objBean = new ManageFAQBean();
        try {
            conn = ConnectDB.connect();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from FAQMaster where faq_id=" + faq_Id);
            if (rs.next()) {
                objBean.setFaq(rs.getString("faq"));
                objBean.setAnswer(rs.getString("answer"));
                objBean.setIs_Active(rs.getInt("Is_Active"));
            }
        } catch (Exception e) {
            System.out.println("Exception in getFAQById(int faq_Id)()" + e);
        } finally {
            try {
                conn.close();
                stmt.close();
                rs.close();

            } catch (Exception e) {
            }

        }
        return objBean;
    }

    public boolean updateFAQ(AddEditFAQBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update FAQMaster set faq=?,answer=?,is_active=? where faq_id=?");
            pstmt.setString(1, objBean.getTaFAQ());
            pstmt.setString(2, objBean.getTaAnswer());
            pstmt.setInt(3, objBean.getRbStatus());
            pstmt.setInt(4, objBean.getHdnFaqId());
            System.out.println(pstmt.toString());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in updateFAQ()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();

            } catch (Exception e) {
            }

        }
        return result;
    }

    public String updateFAQStatus(int faq_Id, int is_Active) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String result = "Failed to change status";
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("update FAQMaster set is_active=? where faq_id=?");
            pstmt.setInt(1, is_Active);
            pstmt.setInt(2, faq_Id);
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = "Status changed successfull";
            }
        } catch (Exception e) {
            System.out.println("Exception in updateFAQ()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();

            } catch (Exception e) {
            }

        }
        return result;
    }

    public boolean addNewFAQ(AddEditFAQBean objBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        boolean result = false;
        try {
            conn = ConnectDB.connect();
            pstmt = conn.prepareStatement("insert into FAQMaster (faq,answer,is_active) values(?,?,?);");
            pstmt.setString(1, objBean.getTaFAQ());
            pstmt.setString(2, objBean.getTaAnswer());
            pstmt.setInt(3, objBean.getRbStatus());
            int i = pstmt.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (Exception e) {
            System.out.println("Exception in addNewFAQ()" + e);
        } finally {
            try {
                conn.close();
                pstmt.close();
            } catch (Exception e) {
            }
        }
        return result;
    }
}
