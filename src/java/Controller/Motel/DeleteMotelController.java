package Controller.Motel;

import DAO.AdminDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Rooms;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class DeleteMotelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        AdminDAO admin = new AdminDAO();
        NotificationDAO noti = new NotificationDAO();

        //========================================================
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            int mid = Integer.parseInt(request.getParameter("id"));
            String check = request.getParameter("check");
            List<Rooms> r = motel.getAllidRoom(mid);
            for (Rooms ro : r) {
                admin.deleAlertByRoomid(ro.getRoomid());
                admin.deleBillByRoomid(ro.getRoomid());
            }
            admin.deleReviewByMid(mid);
            admin.deleRoomByMid(mid);
            admin.deleMotelByMid(mid);
            if (check != null) {
                String nftid = request.getParameter("aleartid");
                noti.updateStatus(nftid, 8);
                response.sendRedirect("listadmin?type=2");
            } else {
                noti.insertAlertForAdmin("Has Deleted a Motel have id is:" + mid, acc.getAccId(), 8, 1);
                response.sendRedirect("managemotel");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
