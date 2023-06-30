package Controller.view;

import DAO.LoginDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Bill;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.Motel;
import Model.Notification;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author ASUS-FPT
 */
public class IndexControllServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        MotelDAO motel = new MotelDAO();
        LoginDAO d = new LoginDAO();
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO card = new PayCarDAO();
        
        String user = "";
        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("u")) {
                    user = o.getValue();
                }
            }
        }
        Account a = d.checkuser(user);
        if (a != null) {
            session.setAttribute("acc", a);
            session.setMaxInactiveInterval(36000);
        }
        Account acc = (Account) session.getAttribute("acc");
        if (acc != null) {            
            List<Notification> listnoti = noti.getTop4Notifications(acc.getAccId());
            List<Notification> allnoti = noti.getPending(acc.getAccId());           
            for (Notification en : allnoti) {
                LocalDateTime currentDate = LocalDateTime.now();
                LocalDateTime dateTime = LocalDateTime.parse(en.getDateup(), DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS"));
                Duration duration = Duration.between(dateTime, currentDate);
                long time = duration.toDays();
                long checktime = duration.toHours();
                if(checktime >= 3 && en.getAstatus() == 1){
                    noti.updateStatus(en.getNftid(), 5);
                }
                if(time >= 1){
                    noti.insertAlert("Your application has expired", 1, en.getRoomid(), 6, en.getPmoney(), en.getIdsend());
                    noti.insertAlert("Your application has expired for processing", 1, en.getRoomid(), 6, en.getPmoney(), en.getIdget()); 
                    card.UpdateaddCMoney(en.getPmoney(), acc.getPayid());
                    card.UpdateSubMoney(en.getPmoney(), "1");
                    noti.deleteNoti(en.getNftid());
                }
            }
            List<Bill> listbill = motel.getListBill();
            for (Bill bil : listbill) {
                LocalDateTime dateTime = LocalDateTime.parse(bil.getDatedue(), DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS"));
                if(dateTime.isBefore(LocalDateTime.now())){
                    motel.updateFalseBill(bil.getBillid());
                    motel.updateAddQuantity(bil.getRoomid());
                }
            }
            session.setAttribute("listnt", listnoti);
        }     
        List<Motel> listM = motel.getTop4Motels();
        request.setAttribute("listTop4M", listM);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
    }// </editor-fold>

}
