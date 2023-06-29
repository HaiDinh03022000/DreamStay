/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Notification;

import DAO.LoginDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author hatha
 */
public class AcceptNotiController extends HttpServlet {

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
        LoginDAO ac = new LoginDAO();
        PayCarDAO card = new PayCarDAO();
        NotificationDAO noti = new NotificationDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String id = request.getParameter("id");
            Notification a = noti.GetNotiByid(id);
            String rid = String.valueOf(a.getRoomid());
            Rooms rooms = motel.getRoomByid(rid);
            if (rooms.getQuantity() <= 0) {
//                request.setAttribute("mess", "Not Enough money!");
                request.setAttribute("color", "red");
                List<Notification> n = noti.returnMoney(a.getRoomid());
                for (Notification ns : n) {
                    Account accc = ac.GetAccByid(ns.getIdsend());
                    //update money from admin to customer
                    card.UpdateaddCMoney(ns.getPmoney(), accc.getPayid());
                    //update admin
                    card.UpdateSubMoney(ns.getPmoney(), "1");
                    noti.insertAlert("Sorry our room has been fulled!", ns.getIdget(), ns.getRoomid(), 4, ns.getPmoney(), ns.getIdsend());
                }
                noti.delAll(a.getRoomid());
                request.getRequestDispatcher("owner").forward(request, response);
            } else {
                String m = a.getTextarea();
                String[] mo = m.split("%");
                int month = Integer.parseInt(mo[1]);
                
                motel.updateSubQuantity(a.getRoomid());

                //update money from admin to owner
                card.UpdateaddCMoney(a.getPmoney() * 95 / 100, acc.getPayid());
                //update admin
                card.UpdateSubMoney(a.getPmoney() * 95 / 100, "1");

                noti.updateStatus(id, 2);
                noti.insertAlert("has Accepted your oder", a.getIdget(), a.getRoomid(), 4, a.getPmoney(), a.getIdsend());
                
                LocalDateTime currentDate = LocalDateTime.now();
                LocalDateTime datedue = currentDate.plusMonths(month);
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
                String formattedDate = datedue.format(formatter);
                motel.insertBill("Successful booking Room with ID is "+rooms.getRoomid(), rooms.getPrice(), formattedDate, rooms.getRoomid(), a.getIdsend(), 1);
                response.sendRedirect("owner");
            }
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
