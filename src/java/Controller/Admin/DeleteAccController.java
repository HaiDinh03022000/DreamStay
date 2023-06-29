/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.AdminDAO;
import DAO.InfoUserDAO;
import Model.Account;
import Model.Infouser;
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
 * @author ADMIN
 */
public class DeleteAccController extends HttpServlet {

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
        AdminDAO admin = new AdminDAO();
        InfoUserDAO info = new InfoUserDAO();
        int accid = Integer.parseInt(request.getParameter("accid"));
        int acctype = Integer.parseInt(request.getParameter("acctype"));
        Infouser i = info.getinfor(accid);
        if (acctype == 0) {
            admin.deleteuserACC(accid, i.getUsid());
        } else {
            admin.deleteOwnerACC(accid, i.getUsid());   
        }
        response.sendRedirect("listadmin?type=1");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
