/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Motel;
import Model.Notification;
import Model.Rooms;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.List;

@MultipartConfig
public class UpdateMotelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();

        //========================================================
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            int mid = Integer.parseInt(request.getParameter("mid"));
            Motel m = motel.getMotelByID(mid);
            List<Rooms> ls = motel.getAllidRoom(mid);

            request.setAttribute("m", m);
            request.setAttribute("type", ls);
            request.getRequestDispatcher("createMotel.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();

        String randomCode = generateRandomCode(4);
        //========================================================
        //upload image
        String fileName = request.getParameter("img1");

        Part filePart = request.getPart("img");
        if (fileName != null && filePart.getSize() != 0) {
            fileName = randomCode + "_" + extractFileName(filePart);
            if (fileName.equals("")) {
                request.setAttribute("error", "Please upload your image!!");
                request.setAttribute("color", "red");
                request.getRequestDispatcher("uploadmotel").forward(request, response);
            }
            String savePath = getServletContext().getRealPath("/");
            String webFolderPath = savePath.replace("build\\web\\", "web\\");
            String imgFolderPath = webFolderPath + "img\\motelimg";
            filePart.write(imgFolderPath + File.separator + fileName);
        }

        //========================================================
        int mid = Integer.parseInt(request.getParameter("mid"));
        Motel mt = motel.getMotelByID(mid);
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String coordinates = request.getParameter("coordinates");
        String description = request.getParameter("description");
        motel.updateMotel1(name, fileName, description, address, coordinates, mid);
        if (mt.getCondition() == 1) {
            boolean i = false;
            List<Notification> listNoti = noti.GetNotiByidget(acc.getAccId());
            for (Notification nt : listNoti) {
                if (nt.getTextarea().contains("Has Updated Motel have mid is:" + mid)) {
                    noti.updateStatus(nt.getNftid(), 7);
                    i = true;
                }
            }
            if (i == false) {
                noti.insertAlertForAdmin("Has Updated Motel have mid is:" + mid, acc.getAccId(), 7, 1);
            }
        }
        response.sendRedirect("managemotel");
    }

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$&";

    public static String generateRandomCode(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder sb = new StringBuilder(length);

        for (int i = 0; i < length; i++) {
            char randomChar;
            do {
                randomChar = CHARACTERS.charAt(random.nextInt(CHARACTERS.length()));
            } while (randomChar == '%');
            sb.append(randomChar);
        }

        return sb.toString();
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
