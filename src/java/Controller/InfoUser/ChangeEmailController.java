/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.InfoUser;

import DAO.InfoUserDAO;
import DAO.LoginDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import DAO.SendEmail;
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
import java.util.List;

/**
 *
 * @author hatha
 */
public class ChangeEmailController extends HttpServlet {

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
        MotelDAO motel = new MotelDAO();
        PayCarDAO pc = new PayCarDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            InfoUserDAO info = new InfoUserDAO();

            String oldemail = request.getParameter("oldemail");
            String email = request.getParameter("email");
            String otpcheck = request.getParameter("otp");

            LoginDAO lg = new LoginDAO();
            String checkemail = lg.checkMatchEmail(email);
            request.setAttribute("email", email);

            Infouser list = info.getinfor(acc.getAccId());
            request.setAttribute("listinfo", list);
            List<Notification> pending = noti.getPending(acc.getAccId());
            request.setAttribute("pending", pending);
            List<Notification> donepro = noti.getDoneProcess(acc.getAccId());
            request.setAttribute("donepro", donepro);
            List<Bill> listbill = motel.ListOwnerBill(acc.getAccId());
            request.setAttribute("bill", listbill);
            PayCard listpc = pc.getPayCardbyID(acc.getPayid());
            request.setAttribute("listpc", listpc);

            request.setAttribute("allow3", "active show");
            request.setAttribute("aw3", "active");
            request.setAttribute("color", "red");

            if (email.equals("")) {
                request.setAttribute("messs", "Please Enter Email!");
            } else if (checkemail != null) {
                request.setAttribute("messs", "Email already Exists!");
            } else {
                String checko = (String) session.getAttribute("otp");
                if (checko == null) {
                    SendEmail send = new SendEmail();
                    String otp = send.getRanom();
                    send.sendEmail(oldemail, otp, "OTP Code: ", "OTP Code to User Change Email");
                    session.setAttribute("otp", otp);
                } else if (!otpcheck.equals(checko)) {
                    request.setAttribute("messs", "OTP code don't match!");
                } else {
                    info.updateEmail(acc.getInfoid(), email);
                    request.setAttribute("messs", "Update Complete!");
                    request.setAttribute("color", "green");
                    session.removeAttribute("otp");
                    request.removeAttribute("email");
                    Account ac = lg.GetAccByid(acc.getAccId());
                    session.setAttribute("acc", ac);
                    Infouser listt = info.getinfor(acc.getAccId());
                    request.setAttribute("listinfo", listt);
                }
            }
            request.getRequestDispatcher("InfoUser.jsp").forward(request, response);

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
