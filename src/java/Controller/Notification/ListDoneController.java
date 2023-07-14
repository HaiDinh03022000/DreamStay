/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Notification;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Bill;
import Model.Motel;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class ListDoneController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        NotificationDAO noti = new NotificationDAO();
        MotelDAO motel = new MotelDAO();
        int[] data = motel.getDataOwner(acc.getAccId());
        List<Bill> bill = motel.getTop2BillOfOwner(acc.getAccId());
        Motel mt = motel.getTop1Motel(acc.getAccId());
        request.setAttribute("bill", bill);
        request.setAttribute("data", data);
        request.setAttribute("motel", mt);
        request.getRequestDispatcher("ownermotel.jsp").forward(request, response); 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
