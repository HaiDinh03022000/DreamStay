/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.InfoUser;

import DAO.InfoUserDAO;
import DAO.LoginDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Infouser;
import Model.Notification;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author hatha
 */
public class ChangePassController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            InfoUserDAO info = new InfoUserDAO();
            NotificationDAO noti = new NotificationDAO();

            String cpass = request.getParameter("cpass");
            String npass = request.getParameter("npass");
            String rnpass = request.getParameter("rnpass");

            request.setAttribute("cpass", cpass);
            request.setAttribute("npass", npass);
            request.setAttribute("rnpass", rnpass);

            request.setAttribute("color", "red");

            if (cpass.equals("")) {
                request.setAttribute("mess", "Please Enter Curent Password!");
            } else if (!cpass.equals(acc.getPass())) {
                request.setAttribute("mess", "Current password not correct !");
            } else if (npass.equals("") || rnpass.equals("")) {
                request.setAttribute("mess", "Please Enter New Password or Repeat New Password !");
            } else if (!npass.equals(rnpass)) {
                request.setAttribute("mess", "New Password & Repeat New Password don't Match!");
            } else {
                LoginDAO cg = new LoginDAO();
                cg.ChangePass(acc.getAccId(), npass);
                request.setAttribute("mess", "Update Success!");
                request.setAttribute("color", "green");
                request.removeAttribute("cpass");
                request.removeAttribute("npass");
                request.removeAttribute("rnpass");
            }
            request.getRequestDispatcher("Loadinfo?type=2").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
