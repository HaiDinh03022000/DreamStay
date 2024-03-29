package Controller.Booking;

import DAO.InfoUserDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Bill;
import Model.Infouser;
import Model.Motel;
import Model.PayCard;
import Model.Rooms;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author win
 */
public class PaymentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PayCarDAO card = new PayCarDAO();
        NotificationDAO noti = new NotificationDAO();
        InfoUserDAO info = new InfoUserDAO();
        MotelDAO motel = new MotelDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String tt = request.getParameter("total");
            String pin = request.getParameter("pincode");
            String roomid = request.getParameter("roomid");
            String text = request.getParameter("text");

            String condition = request.getParameter("condition");
            String bid = request.getParameter("bid");

            if (condition != "" && bid != "") {
                request.setAttribute("condition", condition);
                request.setAttribute("bid", bid);
            }

            request.setAttribute("text", text);
            if (text.equals("")) {
                text = "want to book room";
            }

            request.setAttribute("roomid", roomid);
            request.setAttribute("color", "red");
            PayCard ca = card.getPayCardbyID(acc.getPayid());
            if (tt.equals("")) {
                request.setAttribute("messs", "Please choose how much months you want to book!");
            } else if (pin.equals("")) {
                request.setAttribute("mess", "Please Enter Your Card Pincode!");
            } else if (!pin.equals(ca.getPincode())) {
                request.setAttribute("mess", "Wrong Card Pincode!");
            } else {           
                double total = Double.parseDouble(tt);
                double now = Double.parseDouble(ca.getCmoney());
                if (now < total) {
                    request.setAttribute("mess", "Not Enough money!");
                } else {
                    int send = 0;
                    Rooms room = motel.getRoomByid(roomid);
                    Motel mt = motel.getMotelByID(room.getMid());

                    double month = total / room.getPrice();
                    int months = (int) month;
                    text = text + "%" + months;
                    if (condition != "" && bid != "") {
                        int con = Integer.parseInt(condition);
                        Bill bi = motel.getRoomidByBill(bid);

                        LocalDateTime currentDate = LocalDateTime.now();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
                        if (con == 1) {
                            LocalDateTime dateTime = LocalDateTime.parse(bi.getDatedue(), DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS"));
                            LocalDateTime datedue = dateTime.plusMonths(months);
                            String formattedDate = datedue.format(formatter);
                            motel.updateDatedueBill(bid, formattedDate);
                        } else {
                            if (room.getQuantity() <= 0) {
                                send = 1;
                                request.setAttribute("mess", "There are not enough rooms for you to extend!");
                            } else {
                                LocalDateTime datedue = currentDate.plusMonths(months);
                                String formattedDate = datedue.format(formatter);
                                motel.updateDatedueBill(bid, formattedDate);
                                motel.updateTrueBill(bid);
                                motel.updateSubQuantity(room.getRoomid());
                            }
                        }
                        noti.insertAlert("Extended booking room with id:" + room.getRoomid(), acc.getAccId(), room.getRoomid(), 4, total, mt.getAccid());
                        card.UpdateSubMoney(total, acc.getPayid());
                        card.UpdateaddCMoney(total * 5 / 100, "1");
                        String mtaccid = String.valueOf(mt.getAccid());
                        card.UpdateaddCMoney(total * 95 / 100, mtaccid);
                    } else {
                        card.UpdateSubMoney(total, acc.getPayid());
                        card.UpdateaddCMoney(total, "1");
                        noti.insertAlert(text, acc.getAccId(), room.getRoomid(), 1, total, mt.getAccid());
                    }
                    if(send == 0){
                        request.setAttribute("mess", "<i class=\"bi bi-check-circle-fill\"></i> Your order has been record!");
                        request.setAttribute("color", "green");
                    } else {
                        request.setAttribute("mess", "<i class=\"bi bi-x-circle-fill\"></i> There are not enough rooms for you to extend!");
                        request.setAttribute("cbook", "bb");
                    }                                                    
                    request.setAttribute("pincode", pin);
                    request.setAttribute("lock", "readonly");
                    request.setAttribute("hide", "hide");
                }
            }
            request.getRequestDispatcher("booking").forward(request, response);
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
