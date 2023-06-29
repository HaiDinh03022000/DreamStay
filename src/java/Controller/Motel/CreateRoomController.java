/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Category;
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
import java.time.LocalDateTime;
import java.util.List;

/**
 *
 * @author win
 */
@MultipartConfig
public class CreateRoomController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        MotelDAO motel = new MotelDAO();
        //========================================================
        String mid = request.getParameter("mid");
        request.setAttribute("mid", mid);
        if (mid != null) {   
            int i = Integer.parseInt(mid);
            List<Category> cate = motel.listCateDontHave(i);
            request.setAttribute("cate", cate);
        } else {
            List<Category> cate = motel.listCate();
            request.setAttribute("cate", cate);
        }
        request.getRequestDispatcher("manageroom.jsp").forward(request, response);
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
            String mid = request.getParameter("mid");
            if (mid == null) {
                response.sendRedirect("managemotel");
            }
            //========================================================
            String webAppRoot = getServletContext().getRealPath("/");
            String webFolderPath1 = webAppRoot.replace("build\\web\\", "web\\");
            String imgFolderPath1 = webFolderPath1 + "img\\motelimg";
            String uploadPath = imgFolderPath1;
            List<Part> fileParts = (List<Part>) request.getParts();
            StringBuilder filePaths = new StringBuilder();
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
            String part1 = parts[1];
            String part2 = parts[2];
            String part3 = parts[3];

            //========================================================
            String accpect = request.getParameter("accpect");
            String deny = request.getParameter("deny");

            int cateid = Integer.parseInt(request.getParameter("cate"));
            int price = Integer.parseInt(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int i = Integer.parseInt(mid);

            switch (count) {
                case 1:
                    motel.insertRoom1(part1, price, quantity, i, cateid);
                    break;
                case 2:
                    motel.insertRoom2(part1, part2, price, quantity, i, cateid);
                    break;
                case 3:
                    motel.insertRoom3(part1, part2, part3, price, quantity, i, cateid);
                    break;
                default:
                    break;
            }
            //========================================================
            int rid = motel.getNewRoomId(i);
            noti.insertAlertForAdmin("Has Create Room have roomid is:" + rid + ": in motel:" + i, acc.getAccId(), 7, 1);
            if (accpect != null && deny == null) {
                //continue
                response.sendRedirect("createroom?mid="+mid);
            } else {
                //deny
                response.sendRedirect("managemotel");
                session.removeAttribute("mid");
            }
        }
    }

    //========================================================
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
    //========================================================
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
