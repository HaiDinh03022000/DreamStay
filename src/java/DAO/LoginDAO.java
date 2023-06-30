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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

/**
 *
 * @author win
 */
public class LoginDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void ChangePass(int id, String pass) {
        String query = "update Account set password = ?\n"
                + "where accid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, pass);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account login(String user, String pass) {
        String query = "select * from Account\n"
                + "  where username = ?\n"
                + "  and password = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkuser(String user) {
        String query = "select * from Account\n"
                + "  where username = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account Repass(String user, String email) {
        String query = "select a.accid ,a.username, a.password, a.acctype , a.datesign , a.otpcode, a.usid, a.pcid\n"
                + "from Account a, InforUser i\n"
                + "where a.usid = i.usid and a.username = ? and i.email = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkMatchUser(String user) {
        Account a = new Account();
        String query = "select * from Account where username = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            if (rs.next()) {
                a.setUser(rs.getString(2));
                return a;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String checkMatchEmail(String email) {
        String query = "select email from InforUser where email = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                String em = rs.getString(1);
                return em;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertAcc(String user, String pass, String usid) {
        LocalDate currentDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        String formattedDate = currentDate.format(formatter);

        String query = " insert into Account(username, password, acctype, datesign, otpcode, usid)\n"
                + "values(?,?,0,?,'*',?);";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, formattedDate);
            ps.setString(4, usid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public String getInfoId(String email) {
        String query = "select usid from InforUser\n"
                + "  where email = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                String id = rs.getString(1);
                return id;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertUserInfo(String fullname, String age, String email) {
        String query = "insert into InforUser\n"
                + "values \n"
                + "	(?,'*','*',?,'none.jpg', ?,1);";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, fullname);
            ps.setString(2, age);
            ps.setString(3, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void InsertOTP(int accid, String otp) {
        String query = "update Account set otpcode = ? where accid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, otp);
            ps.setInt(2, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account checkMatchOTP(String otp) {
        String query = "select otpcode from Account where otpcode = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, otp);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account info = new Account();
                info.setOtp(rs.getString(1));
                return info;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account GetAccByid(int accid) {
        String query = "select * from Account\n"
                + "  where accid = ?";
        try {
            conn = new Connections().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String Encode(String otp) {
        String encodedString = Base64.getEncoder().encodeToString(otp.getBytes());
        return encodedString;
    }
    
    public String Decode(String otpbase){
        byte[] decodedBytes = Base64.getDecoder().decode(otpbase);
        String decodedString = new String(decodedBytes);
        return decodedString;
    }

    public static void main(String[] args) {
        LoginDAO a = new LoginDAO();
        String otpbase = a.Encode("734343");
        String otp = a.Decode(otpbase);
        System.out.println("Encode: "+otpbase);
        System.out.println("Decode: "+otp);
    }

}
