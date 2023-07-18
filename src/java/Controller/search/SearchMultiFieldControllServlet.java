/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.search;

import DAO.MotelDAO;
import Model.Motel;
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
public class SearchMultiFieldControllServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String district = request.getParameter("district");
        int price = Integer.parseInt(request.getParameter("price"));
        int category = Integer.parseInt(request.getParameter("category"));

        request.setAttribute("address", district);
        request.setAttribute("price", price);
        request.setAttribute("category", category);
        request.setAttribute("selected", "selected");

        MotelDAO dao = new MotelDAO();

        if (category == 0 && price == 0 && district.equals("0")) {
            List<Motel> listM = dao.getAllMotels();
            session.setAttribute("listM", listM);
        } else if (category == 0 && price == 0) {
            List<Motel> listM = dao.searchByDistrict(district);
            session.setAttribute("listM", listM);

        } else if (district.equals("0") && category == 0) {
            List<Motel> listM = dao.searchByPrice(price);
            session.setAttribute("listM", listM);

        } else if (district.equals("0") && price == 0) {
            List<Motel> listM = dao.searchByCate(category);
            session.setAttribute("listM", listM);

        } else if (category == 0) {
            List<Motel> listM = dao.searchBy2_1(district, price);
            session.setAttribute("listM", listM);

        } else if (price == 0) {
            List<Motel> listM = dao.searchBy2_2(district, category);
            session.setAttribute("listM", listM);

        } else if (district.equals("0")) {
            List<Motel> listM = dao.searchBy2_3(price, category);
            session.setAttribute("listM", listM);

        } else {
            List<Motel> listM = dao.searchByMultiField(district, price, category);
            session.setAttribute("listM", listM);
        }
        request.getRequestDispatcher("rooms").forward(request, response);
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
