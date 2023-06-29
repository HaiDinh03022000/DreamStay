/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Notification;

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

/**
 *
 * @author hatha
 */
public class DenyNotiController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PayCarDAO card = new PayCarDAO();
        NotificationDAO noti = new NotificationDAO();

        LoginDAO ac = new LoginDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String id = request.getParameter("id");
            Notification a = noti.GetNotiByid(id);
            Account accc = ac.GetAccByid(a.getIdsend());
            //update money from admin to customer
            card.UpdateaddCMoney(a.getPmoney(), accc.getPayid());
            //update admin
            card.UpdateSubMoney(a.getPmoney(), "1");
            noti.updateStatus(id, 3);
            noti.insertAlert("has Deny your oder", a.getIdget(), a.getRoomid(), 4, a.getPmoney(), a.getIdsend());
            response.sendRedirect("owner");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
