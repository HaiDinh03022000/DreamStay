

package Controller.Booking;

import DAO.InfoUserDAO;
import DAO.MotelDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Bill;
import Model.Infouser;
import Model.Motel;
import Model.Rooms;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;



public class BookingController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

         
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PayCarDAO card = new PayCarDAO();
        MotelDAO dao = new MotelDAO();
        InfoUserDAO info = new InfoUserDAO();
        
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String id = request.getParameter("roomid");
            String pin = request.getParameter("pin");
            if(id==null){
                String bid = request.getParameter("bid");
                String conditon = request.getParameter("conditon");
                Bill bi = dao.getRoomidByBill(bid);
                id = String.valueOf(bi.getRoomid());
                request.setAttribute("condition", conditon);
                request.setAttribute("bid", bid);
                
            }
            String avatar = info.getAvatar(acc.getInfoid());
            request.setAttribute("avatar", avatar);
            Rooms room = dao.getRoomByid(id);
            request.setAttribute("detail", room);

            Motel motel = dao.getMotelByID(room.getMid());
            List<Motel> mt = dao.ListRanMotel(motel.getMid(), motel.getAccid());
            request.setAttribute("ran", mt);           
            request.setAttribute("motel", motel); 
                  
            Infouser list = info.getinfor(acc.getAccId());
            
            request.setAttribute("listinfo", list);
            request.setAttribute("card",  card.getPayCardbyID(acc.getPayid()));
            request.setAttribute("roomid", id);
            request.getRequestDispatcher("booking.jsp").forward(request, response);
            
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
