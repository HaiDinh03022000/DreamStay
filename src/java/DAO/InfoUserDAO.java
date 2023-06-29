/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import Model.Infouser;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author hatha
 */
public class InfoUserDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Infouser getinfor(int id) {
        String query = "select i.usid, i.fullname, i.uaddress, i.phonenumber, i.birthday, i.avatar, i.email\n"
                + "from Account a, InforUser i\n"
                + "where a.usid = i.usid and a.accid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Infouser(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void updateAccType(int accid) {
        String query = "update Account set acctype = 1 where accid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateInfo(int usid, String fullname, String uaddress, String phonenumber, String age) {
        String query = "update InforUser set fullname = ?, uaddress = ?, phonenumber = ?, birthday = ?\n"
                + "where usid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, uaddress);
            ps.setString(3, phonenumber);
            ps.setString(4, age);
            ps.setInt(5, usid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void uploadavatar(String usid, String avatar) {
        String query = "update InforUser set avatar = ?\n"
                + "where usid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, avatar);
            ps.setString(2, usid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateEmail(String usid, String email) {
        String query = "update InforUser set email = ?\n"
                + "where usid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, usid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public String getAvatar(String usid){
        String query = "select avatar from InforUser where usid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, usid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    public void deleBillByBillID(int bid) {
        String query = "DELETE FROM Bill WHERE bid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
//        InfoUserDAO a = new InfoUserDAO();
//        System.out.println(a.getAvatar(1));     
    }
}
