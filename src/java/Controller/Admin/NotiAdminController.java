/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.LoginDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Notification;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author hatha
 */
public class NotiAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO card = new PayCarDAO();
        LoginDAO login = new LoginDAO();
        String alid = request.getParameter("alid");
        String action = request.getParameter("action");
        Notification nt = noti.GetNotiByid(alid);
        noti.updateStatus(alid, 8);
        if (action != null) {
            if (action.equals("1")) {
                Account acc = login.GetAccByid(nt.getIdsend());
                card.UpdateSubMoney(10000, acc.getPayid());
                card.UpdateaddCMoney(100000, "1");
                login.updateAccType(nt.getIdsend());
                noti.deleteNotiOfIDsend(nt.getIdsend());
                noti.insertAlertForAdmin("has accepted your request to become an Owner Motel", nt.getIdget(), 4, nt.getIdsend());
            } else {
                noti.deleteNotiOfIDsend(nt.getIdsend());
                noti.insertAlertForAdmin("has deny your request to become an Owner Motel", nt.getIdget(), 4, nt.getIdsend());
            }
        }
        response.sendRedirect("listadmin?type=2");
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
