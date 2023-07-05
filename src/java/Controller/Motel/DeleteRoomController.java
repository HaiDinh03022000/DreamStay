/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.AdminDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
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
import java.util.List;

/**
 *
 * @author win
 */
public class DeleteRoomController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        AdminDAO admin = new AdminDAO();
        NotificationDAO noti = new NotificationDAO();
        //========================================================
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            int id = Integer.parseInt(request.getParameter("roomid"));
            int mid = Integer.parseInt(request.getParameter("mid"));
            Motel mt = motel.getMotelByID(mid);
            admin.deleBillByRoomid(id);
            admin.deleAlertByRoomid(id);
            admin.deleRoomByRoomId(id);
            noti.insertAlertForAdmin("Has Delete a Roomid:" + id, acc.getAccId(), 8, 1);
            response.sendRedirect("updatemotel?mid=" + mid);
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
