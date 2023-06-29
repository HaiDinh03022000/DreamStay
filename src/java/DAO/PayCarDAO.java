/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Motel;
import Model.Notification;
import Model.PayCard;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author hatha
 */
public class PayCarDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public PayCard getPayCardbyNumPC(String numbercard) {
        String query = "select * from Paycard where numcard = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, numbercard);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new PayCard(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public PayCard getPayCardbyID(String payid) {
        String query = "select * from Paycard where pcid = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, payid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new PayCard(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void InsertPayCard(int accid, String payid) {
        String query = "update Account set pcid = ? where accid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, payid);
            ps.setInt(2, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateSubMoney(double cmoney, String payid) {
        String query = "update Paycard set cmoney = cmoney - ? where pcid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setDouble(1, cmoney);
            ps.setString(2, payid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void UpdateaddCMoney(double cmoney, String payid) {
        String query = "update Paycard set cmoney = cmoney + ? where pcid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setDouble(1, cmoney);
            ps.setString(2, payid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        NotificationDAO noti = new NotificationDAO();
        PayCarDAO card = new PayCarDAO();
        Notification lnoti = noti.GetNotiByid("13");
        double backM = lnoti.getPmoney() - lnoti.getPmoney() * 5 / 100;
        System.out.println(backM);
    }
}
