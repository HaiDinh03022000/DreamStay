/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Bill;
import Model.Motel;
import Model.Notification;
import Model.Review;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author win
 */
public class OwnerBillController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        NotificationDAO noti = new NotificationDAO();
        MotelDAO motel = new MotelDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String id = request.getParameter("mid");
            if(id != null){
                int mid = Integer.parseInt(id);
                List<Bill> bll = motel.getBillByMid(mid);
                List<Review> rv = motel.listReview(mid);
                request.setAttribute("bill", bll);
                request.setAttribute("review", rv);
            }
            List<Notification> notifications = noti.getNotificationForOwner(acc.getAccId());
            List<Motel> m = motel.getAllOwnerMotel(acc.getAccId());
            request.setAttribute("noti", notifications);           
            request.setAttribute("ownerlist", m);
            request.getRequestDispatcher("on-Bill.jsp").forward(request, response);

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
