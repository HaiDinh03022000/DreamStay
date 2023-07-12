/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.InfoUser;

import DAO.InfoUserDAO;
import DAO.MotelDAO;
import DAO.NotificationDAO;
import DAO.PayCarDAO;
import Model.Account;
import Model.Bill;
import Model.Infouser;
import Model.Notification;
import Model.PayCard;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import static java.awt.SystemColor.info;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author hatha
 */
@MultipartConfig
public class UploadAvatarController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        InfoUserDAO dao = new InfoUserDAO();
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO pc = new PayCarDAO();
        MotelDAO motel = new MotelDAO();
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            //delete old image
            String oldimg = dao.getAvatar(acc.getInfoid());
            String webAppRoot = getServletContext().getRealPath("/");
            String webFolderPath1 = webAppRoot.replace("build\\web\\", "web\\");
            String imgFolderPath1 = webFolderPath1 + "img\\Avatar";
            File file = new File(imgFolderPath1 + File.separator + oldimg);
            file.delete();
            //upload image
            Part filePart = request.getPart("avatar");
            String fileName = extractFileName(filePart);
            if (fileName.equals("")) {
                request.setAttribute("error", "Please upload your image!!");
                request.setAttribute("color", "red");
            } else {
                String savePath = getServletContext().getRealPath("/");
                String webFolderPath = savePath.replace("build\\web\\", "web\\");
                String imgFolderPath = webFolderPath + "img\\Avatar";

                filePart.write(imgFolderPath + File.separator + fileName);
                dao.uploadavatar(acc.getInfoid(), fileName);
                request.setAttribute("error", "Upload Successfull!!");
                request.setAttribute("color", "green");
            }
            Infouser list = dao.getinfor(acc.getAccId());
            request.setAttribute("listinfo", list);

            PayCard listpc = pc.getPayCardbyID(acc.getPayid());
            request.setAttribute("listpc", listpc);

            List<Notification> pending = noti.getPending(acc.getAccId());
            request.setAttribute("pending", pending);

            List<Notification> donepro = noti.getDoneProcess(acc.getAccId());
            request.setAttribute("donepro", donepro);

            List<Bill> listbill = motel.ListOwnerBill(acc.getAccId());
            request.setAttribute("bill", listbill);
            
            request.setAttribute("allow1", "active show");
            request.setAttribute("aw1", "active");
            request.getRequestDispatcher("InfoUser.jsp").forward(request, response);
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
