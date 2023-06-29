/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Motel;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Account;
import Model.Category;
import static com.oracle.wls.shaded.org.apache.xalan.xsltc.compiler.Constants.CHARACTERS;
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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author win
 */
@MultipartConfig
public class MotelController extends HttpServlet {

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

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("createMotel.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();
        //========================================================
        String randomCode = generateRandomCode(4);
        //========================================================
        //upload image
        Part filePart = request.getPart("img");
        String fileName = randomCode + "_" + extractFileName(filePart);
        if (fileName.equals("")) {
            request.setAttribute("error", "Please upload your image!!");
            request.setAttribute("color", "red");
            request.getRequestDispatcher("uploadmotel").forward(request, response);
        }
        String savePath = getServletContext().getRealPath("/");
        String webFolderPath = savePath.replace("build\\web\\", "web\\");
        String imgFolderPath = webFolderPath + "img\\motelimg";
        filePart.write(imgFolderPath + File.separator + fileName);

        //========================================================
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String coordinates = request.getParameter("coordinates");
        String description = request.getParameter("description");
        //========================================================
        motel.insertMotel(name, fileName, address, coordinates, description, acc.getAccId());  
        int mid = motel.getMidByimg(fileName);
        noti.insertAlertForAdmin("Has Create Motel:" + mid, acc.getAccId(), 7, 1);
        response.sendRedirect("createroom?mid="+mid);
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
