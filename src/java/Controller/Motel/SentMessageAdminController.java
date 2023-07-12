/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Notification;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author hatha
 */
public class SentMessageAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();

        String alid = request.getParameter("alid");
        Notification nt = noti.GetNotiByid(alid);
        String[] part = nt.getTextarea().split(":");
        if (part.length > 2) {
            boolean i = false;
            List<Notification> listNoti = noti.GetNotiByidget(acc.getAccId());
            for (Notification nte : listNoti) {
                if (nte.getTextarea().contains("Want to unlock Room have id:" + part[1].trim() + ": in Motel:" + part[3].trim())) {
                    noti.updateStatus(nte.getNftid(), 7);
                    i = true;
                }
            }
            if (i == false) {
                noti.insertAlertForAdmin("Want to unlock Room have id:" + part[1].trim() + ": in Motel:" + part[3].trim(), acc.getAccId(), 7, 1);
            }
        } else {
            boolean i = false;
            List<Notification> listNoti = noti.GetNotiByidget(acc.getAccId());
            for (Notification nte : listNoti) {
                if (nte.getTextarea().contains("Want to unlock Motel have id:" + part[1].trim())) {
                    noti.updateStatus(nte.getNftid(), 7);
                    i = true;
                }
            }
            if (i == false) {
                noti.insertAlertForAdmin("Want to unlock Motel have id:" + part[1].trim(), acc.getAccId(), 7, 1);
            }
        }
        response.sendRedirect("getownernoti");
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
