/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Login;

import DAO.LoginDAO;
import DAO.SendEmail;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author hatha
 */
public class RePassController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String user = request.getParameter("user");
        String email = request.getParameter("email");

        request.setAttribute("user", user);
        request.setAttribute("email", email);

        if (user == "" || email == "") {
            request.setAttribute("mess", "Please enter Username and PhoneNumber");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        }
        LoginDAO dao = new LoginDAO();
        Account a = dao.Repass(user, email);
        if (a == null) {
            request.setAttribute("mess", "Wrong user or Email");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        } else {
            SendEmail send = new SendEmail();
            String otp = send.getRanom();
            dao.InsertOTP(a.getAccId(), otp);
            send.sendEmail(email, otp, "OTP Code: ", "OTP Code to User Reset Password");
            session.setAttribute("accid", a);
            request.setAttribute("back", "right-panel-active");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoginDAO dao = new LoginDAO();
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("accid");
        String user = acc.getUser();

        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String otp = request.getParameter("otp");

        request.setAttribute("user", user);
        request.setAttribute("pass", pass);
        request.setAttribute("cpass", cpass);

        if (pass.equals("") || cpass.equals("")) {
            request.setAttribute("back", "right-panel-active");
            request.setAttribute("mes", "Please enter new password!");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        } else if (!pass.equals(cpass)) {
            request.setAttribute("back", "right-panel-active");
            request.setAttribute("mes", "Password do not match!");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        }
        if (otp.equals("")) {
            request.setAttribute("back", "right-panel-active");
            request.setAttribute("mes", "Please enter OTP code!");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        }
        if (dao.checkMatchOTP(otp) == null) {
            request.setAttribute("back", "right-panel-active");
            request.setAttribute("mes", "Invalid OTP code!");
            request.getRequestDispatcher("forgetpass.jsp").forward(request, response);
        } else {
            dao.ChangePass(acc.getAccId(), pass);
            request.setAttribute("color", "green");
            request.setAttribute("mess", "Change Password Complete!");
            request.setAttribute("back", "");
            dao.InsertOTP(acc.getAccId(), "*");
            session.removeAttribute("a");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
