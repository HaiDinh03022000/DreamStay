/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.AdminDAO;
import Model.Account;
import Model.Income;
import Model.Infouser;
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
 * @author hatha
 */
public class GetIncomeAdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO ad = new AdminDAO();
        Income income = ad.getIncomeOfAdmin();
        List<Infouser> info = ad.getTop3Info();
        List<Notification> noti = ad.getTop3AdminNoti();
        Infouser top1 = ad.getTop1RScore();

        request.setAttribute("income", income);
        request.setAttribute("info", info);
        request.setAttribute("noti", noti);
        request.setAttribute("top1", top1);

        request.getRequestDispatcher("admindashboard.jsp").forward(request, response);
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
