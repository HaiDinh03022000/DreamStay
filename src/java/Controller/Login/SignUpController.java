/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Login;

import DAO.LoginDAO;
import DAO.SendEmail;
import Model.Account;
import Model.Infouser;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.Date;

/**
 *
 * @author win
 */
public class SignUpController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoginDAO dao = new LoginDAO();
        String fname = request.getParameter("fname");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String email = request.getParameter("email");
        String age = request.getParameter("age");
        String otpcheck = request.getParameter("otp");

        Account acc = dao.checkMatchUser(user);
        String info = dao.checkMatchEmail(email);

        request.setAttribute("fname", fname);
        request.setAttribute("user", user);
        request.setAttribute("pass", pass);
        request.setAttribute("cpass", cpass);
        request.setAttribute("email", email);
        request.setAttribute("age", age);
        request.setAttribute("pass", pass);

        int year = Year.now().getValue();
        int y = year - Integer.parseInt(age);
        if (acc != null) {
            request.setAttribute("check", "User already exits!");
            request.setAttribute("back", "right-panel-active");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!pass.equals(cpass)) {
            request.setAttribute("check", "Password do not match!");
            request.setAttribute("back", "right-panel-active");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (info != null) {
            request.setAttribute("check", "Email already exits!");
            request.setAttribute("back", "right-panel-active");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (y < 18) {
            request.setAttribute("check", "You are not old enough!(18+)");
            request.setAttribute("back", "right-panel-active");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            String check = (String) session.getAttribute("otp");
            if (check == null) {
                SendEmail send = new SendEmail();
                String otp = send.getRanom();
                send.sendEmail(email, otp , "OTP code: ", "OTP Code to User SignUp Account");
                session.setAttribute("otp", otp);
                request.setAttribute("back", "right-panel-active");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (!otpcheck.equals(check)) {
                request.setAttribute("check", "OTP code don't match!");
                request.setAttribute("back", "right-panel-active");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                dao.insertUserInfo(fname, age, email);
                String id = dao.getInfoId(email);
                dao.insertAcc(user, pass, id);
                request.setAttribute("color", "green");
                request.setAttribute("mess", "Create Account Complete!");
                session.removeAttribute("otp");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
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
