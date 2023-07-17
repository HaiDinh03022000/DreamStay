/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.AdminDAO;
import DAO.LoginDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Motel;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author hatha
 */
public class UpdateAccController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AdminDAO admin = new AdminDAO();
        LoginDAO login = new LoginDAO();
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();
        int accid = Integer.parseInt(request.getParameter("accid"));
        String action = request.getParameter("action");
        Account acc = login.GetAccByid(accid);
        if (action.equals("1")) {
            if (acc.getAccstatus() == 0) {
                admin.updateAccStatus(accid, 1);
            } else {
                admin.updateAccStatus(accid, 0);
            }
        }else{
            login.updateAccType(accid, 0);
            List<Motel> listMotel = motel.getAllOwnerMotel(accid);
            for (Motel mt : listMotel) {
                motel.UpStatusMotel(mt.getMid(), 0);
            }
            noti.insertAlertForAdmin("Your Motel Owner permission has been revoked by your admin", 1, 4, accid);
        }
        response.sendRedirect("listadmin?type=1");
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
