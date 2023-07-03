/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.InfoUser;

import DAO.InfoUserDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Bill;
import Model.Infouser;
import Model.Notification;
import Model.PayCard;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author hatha
 */
public class UpLoadinfoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("paycard");
        session.removeAttribute("otp");
        Account acc = (Account) session.getAttribute("acc");
        InfoUserDAO info = new InfoUserDAO();
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO pc = new PayCarDAO();
        MotelDAO motel = new MotelDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String type = request.getParameter("type");
            String show = request.getParameter("show");
            if(show != null){
                request.setAttribute("show", show);
            }
            if (type != null) {
                if (type.equals("2")) {
                    request.setAttribute("allow2", "active show");
                    request.setAttribute("aw2", "active");
                } else if (type.equals("3")) {
                    request.setAttribute("allow3", "active show");
                    request.setAttribute("aw3", "active");
                } else if (type.equals("4")) {
                    request.setAttribute("allow4", "active show");
                    request.setAttribute("aw4", "active");
                } else if(type.equals("5")){
                    request.setAttribute("allow5", "active show");
                    request.setAttribute("aw5", "active");
                }
            } else {
                request.setAttribute("allow1", "active show");
                request.setAttribute("aw1", "active");
            }

            Infouser list = info.getinfor(acc.getAccId());
            request.setAttribute("listinfo", list);

            PayCard listpc = pc.getPayCardbyID(acc.getPayid());
            request.setAttribute("listpc", listpc);

            List<Notification> pending = noti.getPending(acc.getAccId());
            request.setAttribute("pending", pending);

            List<Notification> donepro = noti.getDoneProcess(acc.getAccId());
            request.setAttribute("donepro", donepro);

            List<Bill> listbill = motel.ListOwnerBill(acc.getAccId());
            request.setAttribute("bill", listbill);

            request.getRequestDispatcher("InfoUser.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            InfoUserDAO info = new InfoUserDAO();

            String fullname = request.getParameter("fullname");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String age = request.getParameter("age");
            int usid = Integer.parseInt(acc.getInfoid());
            info.updateInfo(usid, fullname, address, phone, age);
            response.sendRedirect("Loadinfo");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
