package Controller.view;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Motel;
import Model.Notification;
import Model.Review;
import Model.Rooms;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class RoomsDetailServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();

        int id = Integer.parseInt(request.getParameter("mid"));
        String check = request.getParameter("check");
        String roomid = request.getParameter("roomid");

        if (check != null && roomid == null) {
            roomid = motel.getFroom(id);
        }
        if (acc != null) {
            int nfc = motel.GetOwnerBill(acc.getAccId(), id);
            if (nfc == acc.getAccId()) {
                request.setAttribute("checkrv", nfc);
            }
        }

        Rooms room = motel.getRoomByid(roomid);
        Motel m = motel.getMotelByID(id);
        if (m == null) {
            response.sendRedirect("404notfound.jsp");
        } else {
            List<Review> r = motel.listReview(id);
            List<Rooms> ls = motel.getAllRoomType(id);

            request.setAttribute("review", r);
            request.setAttribute("detail", m);
            request.setAttribute("room", room);
            request.setAttribute("allid", ls);
            request.setAttribute("rid", roomid);
            request.getRequestDispatcher("room-details.jsp").forward(request, response);
        }
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
