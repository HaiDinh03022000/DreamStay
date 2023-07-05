/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import DAO.MotelDAO;
import DAO.NotificationDAO;
import Model.Motel;
import Model.Rooms;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author hatha
 */
public class AdminManageMotelController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MotelDAO motel = new MotelDAO();
        NotificationDAO noti = new NotificationDAO();
        int mid = Integer.parseInt(request.getParameter("mid"));
        String nftid = request.getParameter("aleartid");
        String link = request.getParameter("link");
        String rid = request.getParameter("roomid");
        Motel mt = motel.getMotelByID(mid);
        if (rid == null) {
            if (mt.getCondition() == 0) {
                motel.UpStatusMotel(mid, 1);
                noti.insertAlertForAdmin("has unlock your motel have id :" + mid, 1, 4, mt.getAccid());
            } else {
                motel.UpStatusMotel(mid, 0);
                noti.insertAlertForAdmin("has lock your motel have id :" + mid, 1, 4, mt.getAccid());
            }
            if (nftid != null) {
                noti.updateStatus(nftid, 8);
            }
        } else {
            int roomid = Integer.parseInt(rid);
            Rooms room = motel.getRoomByid(rid);
            if (room.getCondition() == 0) {
                motel.UpStatusRoom(roomid, 1);
                noti.insertAlertForAdmin("has unLock your roomid :" + rid + " :in motelid :" + mid, 1, 4, mt.getAccid());
            } else {
                motel.UpStatusRoom(roomid, 0);
                noti.insertAlertForAdmin("has Lock your roomid :" + rid + " :in motelid :" + mid, 1, 4, mt.getAccid());
            }
            if (nftid != null) {
                noti.updateStatus(nftid, 8);
            }
        }
        if (link.equals("3")) {
            response.sendRedirect("listadmin?type=3");
        } else {
            response.sendRedirect("listadmin?type=2");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
