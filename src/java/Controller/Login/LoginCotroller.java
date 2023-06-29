/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Login;

import DAO.LoginDAO;
import Model.Account;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author win
 */
public class LoginCotroller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        HttpSession session = request.getSession();
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        String check = request.getParameter("rmb");

        LoginDAO dao = new LoginDAO();
        request.setAttribute("user", user);
        request.setAttribute("pass", pass);

        if (user == "" || pass == "") {
            request.setAttribute("mess", "Please enter username or password");
            request.setAttribute("color", "red");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (user.equals("admin") && pass.equals("12345678")) {
            Account a = dao.login(user, pass);
            session.setAttribute("acc", a);
            session.setMaxInactiveInterval(36000);
            response.sendRedirect("getincomeadmin");
        } else {
            Account a = dao.login(user, pass);
            if (a == null) {
                request.setAttribute("mess", "Wrong user or pass");
                request.setAttribute("color", "red");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                if (check != null) {
                    Cookie u = new Cookie("u", user);
                    u.setMaxAge(60 * 60);
                    response.addCookie(u);
                }
                session.setAttribute("acc", a);
                session.setMaxInactiveInterval(36000);
                response.sendRedirect("index");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
