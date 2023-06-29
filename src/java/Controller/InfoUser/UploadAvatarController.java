/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.InfoUser;

import DAO.InfoUserDAO;
import Model.Account;
import Model.Infouser;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

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
                request.getRequestDispatcher("InfoUser.jsp").forward(request, response);
            } else {
                String savePath = getServletContext().getRealPath("/");
                String webFolderPath = savePath.replace("build\\web\\", "web\\");
                String imgFolderPath = webFolderPath + "img\\Avatar";

                filePart.write(imgFolderPath + File.separator + fileName);
                dao.uploadavatar(acc.getInfoid(), fileName);
                response.sendRedirect("Loadinfo");
            }
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
