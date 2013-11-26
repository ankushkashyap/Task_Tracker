  
<%@page import="email.SendSMTP"%>
<%@page  import="datalayer.common.CommonServices,beans.common.ForgotPasswordBean" %>

<%
    if (request.getParameter("sbtnSubmit") != null) {
        CommonServices obj = new CommonServices();
        String username = request.getParameter("txtUsername");
        ForgotPasswordBean objBean = obj.forgotPassword(username);
        if (objBean == null) {
            session.setAttribute("msg", "Invalid Username ............");
            response.sendRedirect("ForgotPassword_mp.jsp?msg=Invalid Username ............");
        } else {
            String password = objBean.getTxtPassword();
            String email = objBean.getTxtEmail();
            String msg="Your Username is "+username+"\n Password is "+password;

            String subject = "Task Tracker Account Details:";
         //   System.out.println("email  " + password + email + subject + objBean.getTxtResult());
            String emailresult = SendSMTP.sendMail(email, msg, subject);
           
            response.sendRedirect("ForgotPassword_mp.jsp?msg="+emailresult);
        }
    }
%>
