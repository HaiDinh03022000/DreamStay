/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Notification;

import DAO.InfoUserDAO;
import DAO.LoginDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
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
 * @author win
 */
public class BecomeMotelOwnerController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO card = new PayCarDAO();
        LoginDAO login = new LoginDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String pass = request.getParameter("pass");
            String email = request.getParameter("email");
            request.setAttribute("color", "red");
            if (pass.equals("")) {
                request.setAttribute("pmess", "Please Enter Curent Password!");
            } else if (!pass.equals(acc.getPass())) {
                request.setAttribute("pmess", "Current password not correct !");
            } else if (login.checkMatchEmail(email) == null) {
                request.setAttribute("pmess", "Email not correct !");
            } else {
                request.setAttribute("color", "green");
                request.setAttribute("pmess", "Your message has been sent successfully!");
                boolean i = false;
                List<Notification> listNoti = noti.GetNotiByidget(acc.getAccId());
                for (Notification nt : listNoti) {
                    if (nt.getTextarea().contains("Want to become Owner Motel") && nt.getIdsend() == acc.getAccId()) {
                        noti.updateStatus(nt.getNftid(), 7);
                        i = true;
                    }
                }
                if (i == false) {
                    noti.insertAlertForAdmin("Want to become Owner Motel", acc.getAccId(), 7, 1);
                }
                card.UpdateSubMoney(10000, acc.getPayid());
                card.UpdateaddCMoney(10000, "1");
            }
            request.getRequestDispatcher("Loadinfo?type=4").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
