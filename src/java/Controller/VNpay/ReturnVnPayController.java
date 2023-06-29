/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.VNpay;

import DAO.LoginDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Motel;
import Model.Rooms;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author win
 */
public class ReturnVnPayController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
            double vnp_Amount = Double.parseDouble(request.getParameter("vnp_Amount")) / 100;
            String vnp_TransactionStatus = request.getParameter("vnp_TransactionStatus");
            if (vnp_TransactionStatus.equalsIgnoreCase("00")) {
                String roomid = (String) session.getAttribute("roomid");
                Rooms room = motel.getRoomByid(roomid);
                Motel mt = motel.getMotelByID(room.getMid());
                double month = vnp_Amount / room.getPrice();
                int months = (int) month;
                noti.insertAlert("Has Book room %" + months, acc.getAccId(), room.getRoomid(), 1, vnp_Amount, mt.getAccid());
                card.UpdateaddCMoney(vnp_Amount, "1");
            }else{
                response.sendRedirect("Successful.html");
            }
            response.sendRedirect("Successful.html");
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
