<%@page import="beans.module.AddEditProjectPortfolioBean"%>
<%@page import="datalayer.module.ManageProjectPortfolioServices"%>
<jsp:useBean id="objBean" class="beans.module.AddEditProjectPortfolioBean">
    <jsp:setProperty name="objBean" property="*" />
</jsp:useBean>
<%

    String url = "";
    int updateFlag = 0;


    ManageProjectPortfolioServices obj = new ManageProjectPortfolioServices();
    int update_By = (Integer) session.getAttribute("User_Id");
    if (request.getParameter("sbtnUpdateAndBacktoProject") != null) {
        if (request.getParameterValues("chk") != null) {
            String str[] = request.getParameterValues("chk");
            boolean b = obj.updateProjectPortfolio(objBean, update_By);
            for (int i = 0; i < str.length; i++) {
                int phase_Id = Integer.parseInt(str[i]);
                AddEditProjectPortfolioBean objPhasesBean = new AddEditProjectPortfolioBean();
                objPhasesBean.setHdnProjectId(objBean.getHdnProjectId());
                objPhasesBean.setTxtPhaseEndDate(request.getParameter("txtPhaseEndDate" + phase_Id));
                objPhasesBean.setTxtPhaseStartDate(request.getParameter("txtPhaseStartDate" + phase_Id));
                objPhasesBean.setProjectPhase_Id(phase_Id);
                boolean b1 = obj.updateProjectPhasess(objPhasesBean);
            }

            if (b) {
                url = "ManageProjectPortfolio_mp.jsp?msg=Project details updated successfully";
            } else {
                url = "EditProjectPortfolio_mp.jsp?project_id=" + objBean.getHdnProjectId() + "&msg=Project details not updated";
            }
        } else {
            url = "EditProjectPortfolio_mp.jsp?project_id=" + objBean.getHdnProjectId() + "&msg=Record not added";
        }

    } else if (request.getParameter("sbtnUpdateAndProceedForTeam") != null) {
        boolean b = obj.updateProjectPortfolio(objBean, update_By);
        if (b) {
            url = "ProjectTeam_mp.jsp?project_Id=" + objBean.getHdnProjectId() + "&msg=Project details updated successfully";
        } else {
            url = "EditProjectPortfolio_mp.jsp?project_id=" + objBean.getHdnProjectId() + "&msg=Project details not updated";
        }
    } else if (request.getParameter("sbtnUpdateAndProceedForDocuments") != null) {
        boolean b = obj.updateProjectPortfolio(objBean, update_By);
        if (b) {
            url = "ProjectDocuments_mp.jsp?project_Id=" + objBean.getHdnProjectId() + "&msg=Project details updated successfully";
        } else {
            url = "EditProjectPortfolio_mp.jsp?project_id=" + objBean.getHdnProjectId() + "&msg=Project details not updated";
        }

    }
    
    if (request.getParameter("sbtnSaveAndBacktoProject") != null) {


        if (request.getParameterValues("chk") != null) {
            String str[] = request.getParameterValues("chk");

            int perojectId = obj.addProjectPortfolio(objBean, update_By);

            if (perojectId > -1) {
                for (int i = 0; i < str.length; i++) {
                    int phase_Id = Integer.parseInt(str[i]);
                    AddEditProjectPortfolioBean objPhasesBean = new AddEditProjectPortfolioBean();
                    objPhasesBean.setHdnProjectId(perojectId);
                    objPhasesBean.setTxtPhaseEndDate(request.getParameter("txtPhaseEndDate" + phase_Id));
                    objPhasesBean.setTxtPhaseStartDate(request.getParameter("txtPhaseStartDate" + phase_Id));
                    objPhasesBean.setProjectPhase_Id(phase_Id);
                    boolean b = obj.addProjectPhasess(objPhasesBean);
                    if (b) {
                        url = "ManageProjectPortfolio_mp.jsp?Added Succesfully";
                    } else {
                        url = "AddProjectPortfolio_mp.jsp?msg=Record not added";
                    }
                }
            } else {
                url = "AddProjectPortfolio_mp.jsp?msg=Record not added";
            }
        } else {
            url = "AddProjectPortfolio_mp.jsp?msg=Record not added";
        }


    }
    response.sendRedirect(url);

%>