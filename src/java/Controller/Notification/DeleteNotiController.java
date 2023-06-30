/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Notification;

import DAO.MotelDAO;
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
public class DeleteNotiController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO card = new PayCarDAO();
        MotelDAO motel = new MotelDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String id = request.getParameter("id");
            String type = request.getParameter("type");
            if (type != null) {
                if (type.equals("1")) {
                    Notification lnoti = noti.GetNotiByid(id);
                    noti.insertAlert("canceled the order", acc.getAccId(), lnoti.getRoomid(), 4, lnoti.getPmoney(), lnoti.getIdget());
                    double backM = lnoti.getPmoney() - lnoti.getPmoney() * 5 / 100;
                    card.UpdateaddCMoney(backM, acc.getPayid());
                    card.UpdateSubMoney(backM, "1");
                    noti.deleteNoti(id);
                    
                    request.getRequestDispatcher("Loadinfo?type=4").forward(request, response);
//                response.sendRedirect("Loadinfo");
                }
                if (type.equals("3")) {
                    noti.deleteNoti(id);
                    response.sendRedirect("listadmin?type=2");
                }
            } else {
                noti.deleteNoti(id);
                response.sendRedirect("listdone");
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
