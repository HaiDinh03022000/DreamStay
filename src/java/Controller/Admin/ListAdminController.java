/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.AdminDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Motel;
import Model.Notification;
import Model.Rooms;
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
 * @author ADMIN
 */
public class ListAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        NotificationDAO noti = new NotificationDAO();
        AdminDAO admin = new AdminDAO();
        MotelDAO motel = new MotelDAO();
        Account acc = (Account) session.getAttribute("acc");
        int type = Integer.parseInt(request.getParameter("type"));
        if (type == 1) {
            String acctype = request.getParameter("acctype");
            if (acctype != null) {
                if (acctype.equalsIgnoreCase("0")) {
                    List<Account> account = admin.getAccountByType(acctype);
                    request.setAttribute("acc", account);
                } else {
                    List<Account> account = admin.getAccountByType(acctype);
                    request.setAttribute("acc", account);
                }
            } else {
                List<Account> account = admin.getAllAccount();
                request.setAttribute("acc", account);
            }
            request.getRequestDispatcher("ad-TableAccount.jsp").forward(request, response);
        } else if (type == 2) {
            String ctype = request.getParameter("ctype");
            if (ctype != null) {
                if (ctype.equalsIgnoreCase("1")) {
                    List<Notification> n = noti.getAdminNotiByType("update");
                    request.setAttribute("noti", n);
                } else {
                    List<Notification> n = noti.getAdminNotiByType("create");
                    request.setAttribute("noti", n);
                }
            } else {
                List<Notification> pendingMotel = noti.getAdminNotiPendingMotel("become");
                List<Notification> pendingAcc = noti.getAdminNotiPendingAcc("become");
                List<Notification> complete = noti.getAdminNoti(acc.getAccId(),8,"");

                request.setAttribute("notipendingMotel", pendingMotel);
                request.setAttribute("notipendingAcc", pendingAcc);
                request.setAttribute("noticomplete", complete);
            }
            request.getRequestDispatcher("ad-TableNotification.jsp").forward(request, response);
        } else if(type == 3){
            String id = request.getParameter("mid");
            if(id != null){
                int mid = Integer.parseInt(id);
                List<Rooms> room = motel.getAllRoom(mid);
                request.setAttribute("room", room);
            }
            List<Motel> mt = motel.getListMotel();
            request.setAttribute("motel", mt);        
            request.getRequestDispatcher("ad-TableMotel.jsp").forward(request, response);
        }    
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    public String getServletInfo() {
        return "Short description";
    }

}
