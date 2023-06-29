/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.InfoUser;

import DAO.InfoUserDAO;
import DAO.LoginDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Bill;
import Model.Infouser;
import Model.Notification;
import Model.PayCard;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author hatha
 */
public class ConnectPayCardController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        PayCarDAO pd = new PayCarDAO();
        InfoUserDAO info = new InfoUserDAO();
        LoginDAO lg = new LoginDAO();
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            String pc = request.getParameter("paycard");
            String paycard = pc.replace(" ", "");
            String pincode = request.getParameter("pincode");
            request.setAttribute("paycard", paycard);

            Infouser list = info.getinfor(acc.getAccId());
            request.setAttribute("listinfo", list);
            List<Notification> pending = noti.getPending(acc.getAccId());
            request.setAttribute("pending", pending);
            List<Notification> donepro = noti.getDoneProcess(acc.getAccId());
            request.setAttribute("donepro", donepro);
            List<Bill> listbill = motel.ListOwnerBill(acc.getAccId());
            request.setAttribute("bill", listbill);

            PayCard listPC = pd.getPayCardbyNumPC(paycard);
            PayCard listpc = pd.getPayCardbyID(acc.getPayid());
            request.setAttribute("listpc", listpc);

            request.setAttribute("allow3", "active show");
            request.setAttribute("aw3", "active");
            request.setAttribute("color", "red");

            if (paycard.equals("")) {
                request.setAttribute("messss", "Please Enter Your PayCard!");
            } else if (listPC == null) {
                request.setAttribute("messss", "Your PayCard Isvalid!");
            } else {
                session.setAttribute("paycard", paycard);
                session.setMaxInactiveInterval(180);
                if (pincode == null) {
                    request.setAttribute("listPC", listPC);
                } else if (!pincode.equals(listPC.getPincode())) {
                    request.setAttribute("messss", "Pincode is not correct!");
                    request.setAttribute("listPC", listPC);
                } else {
                    request.setAttribute("messss", "Connect Complete!");
                    request.setAttribute("listPC", listPC);
                    request.setAttribute("color", "green");
                    pd.InsertPayCard(acc.getAccId(), listPC.getPayid());
                    session.removeAttribute("paycard");
                    request.removeAttribute("paycard");
                    Account ac = lg.GetAccByid(acc.getAccId());
                    session.setAttribute("acc", ac);
                }
            }
            request.getRequestDispatcher("InfoUser.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
