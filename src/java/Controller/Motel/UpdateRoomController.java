/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
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
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.util.List;

/**
 *
 * @author hatha
 */
@MultipartConfig
public class UpdateRoomController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
            String roomid = request.getParameter("roomid");
            Rooms room = motel.getRoomByid(roomid);

            request.setAttribute("room", room);
            request.getRequestDispatcher("manage-room.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();

        //========================================================
        if (acc == null) {
            response.sendRedirect("login.jsp");
        } else {
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int roomid = Integer.parseInt(request.getParameter("roomid"));
            String roomstring = request.getParameter("roomid");
            //========================================================
            String webAppRoot = getServletContext().getRealPath("/");
            String webFolderPath1 = webAppRoot.replace("build\\web\\", "web\\");
            String imgFolderPath1 = webFolderPath1 + "img\\motelimg";
            String uploadPath = imgFolderPath1;
            List<Part> fileParts = (List<Part>) request.getParts();
            StringBuilder filePaths = new StringBuilder();
            int check = 0;
            int count = 0;
            //========================================================
            for (Part part : fileParts) {
                if (count >= 3) {
                    break;
                }
                String randomCode = generateRandomCode(4);
                String fileName = randomCode + "_" + getFileName(part);
                String filePath = uploadPath + File.separator + fileName;
                if (!filePath.contains("null") && fileName.length() > 5) {
                    part.write(filePath);
                    check++;
                    count++;
                }

                if (filePaths.length() > 0) {
                    filePaths.append("%");
                }
                filePaths.append(fileName);
            }
            //========================================================
            String path = filePaths.toString();

            String[] parts = path.split("%");
            String part1 = parts[0];
            String part2 = parts[1];
            String part3 = parts[2];
            if (check == 0) {
                motel.updateRoom1(price, quantity, roomid);

            } else {
                if (count == 1) {
                    motel.updateRoom2_1(part1, price, quantity, roomid);
                } else if (count == 2) {
                    motel.updateRoom2_2(part1, part2, price, quantity, roomid);
                } else {
                    motel.updateRoom2_3(part1, part2, part3, price, quantity, roomid);
                }
                motel.updateRoom1(price, quantity, roomid);
            }
            Rooms r = motel.getRoomByid(roomstring);
            if (r.getCondition() == 1) {
                boolean i = false;
                List<Notification> listNoti = noti.GetNotiByidget(acc.getAccId());
                for (Notification nt : listNoti) {
                    if (nt.getTextarea().contains("Has Update Room have roomid is:" + roomid + ": in motel:" + r.getMid())) {
                        noti.updateStatus(nt.getNftid(), 7);
                        i = true;
                    }
                }
                if (i == false) {
                    noti.insertAlertForAdmin("Has Update Room have roomid is:" + roomid + ": in motel:" + r.getMid(), acc.getAccId(), 7, 1);
                }
            }
            response.sendRedirect("managemotel");
        }
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

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim()
                        .replace("\"", "");
            }
        }
        return null;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
