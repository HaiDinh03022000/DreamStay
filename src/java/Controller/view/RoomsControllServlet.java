package Controller.view;

import DAO.MotelDAO;
import Model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;
import Model.Motel;
import jakarta.servlet.http.HttpSession;

public class RoomsControllServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        MotelDAO dao = new MotelDAO();
        List<Motel> ListMt = (List<Motel>) session.getAttribute("listM");
        List<Category> listCate = dao.listCate();
        request.setAttribute("listCate", listCate);
        if (ListMt != null) {
            request.setAttribute("listM", ListMt);
        } else {
            List<Motel> listM = dao.getAllMotels();
            request.setAttribute("listM", listM);          
        }
        request.getRequestDispatcher("rooms.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
