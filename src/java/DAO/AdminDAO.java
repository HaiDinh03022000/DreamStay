/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import Model.Income;
import Model.Infouser;
import Model.Motel;
import Model.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class AdminDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account where accid != 1 order by accid desc";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));

            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updateAccStatus(int accid, int status) {
        String query = "update Account set accstatus = ? where accid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public List<Account> getAccountByType(String type) {
        List<Account> list = new ArrayList<>();
        String query = "select * from Account where acctype = ? and accid !=1 order by accid desc";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, type);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteuserACC(int accid, int usid) {
        deleReviewByAccid(accid);
        deleBillByAccId(accid);
        deleAlertbyAccid(accid);
        deleAcc(accid);
        deleInfo(usid);
    }

    public void deleteOwnerACC(int accid, int usid) {
        MotelDAO motel = new MotelDAO();
        List<Motel> m = motel.getAllOwnerMotel(accid);
        deleReviewByAccid(accid);
        deleBillByAccId(accid);
        deleAlertbyAccid(accid);
        for (Motel mt : m) {
            deleReviewByMid(mt.getMid());
            deleRoomByMid(mt.getMid());
        }
        deleMotelByAccid(accid);
        deleAcc(accid);
        deleInfo(usid);

    }

    public void deleReviewByAccid(int accid) {
        String query = "DELETE FROM Review WHERE accid = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleReviewByMid(int mid) {
        String query = "DELETE FROM Review WHERE mid = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleBillByAccId(int accid) {
        String query = "DELETE FROM Bill WHERE accid = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleBillByRoomid(int roomid) {
        String query = "DELETE FROM Bill WHERE roommid = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleAlertbyAccid(int accid) {
        String query = "DELETE FROM Alert WHERE idsend = ? OR idget = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            ps.setInt(2, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleAlertByRoomid(int roomid) {
        String query = "DELETE FROM Alert WHERE roommid = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleAcc(int accid) {
        String query = "DELETE FROM Account WHERE accid = ?";

        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleInfo(int usid) {
        String query = "DELETE FROM InforUser WHERE usid =?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, usid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleMotelByAccid(int accid) {
        String query = "DELETE FROM Motel WHERE accid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleMotelByMid(int mid) {
        String query = "DELETE FROM Motel WHERE mid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleRoomByMid(int mid) {
        String query = "DELETE FROM Room WHERE mid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleRoomByRoomId(int rid) {
        String query = "DELETE FROM Room WHERE roommid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, rid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getTtAccount() {
        String query = "select count(accid) from Account";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTtOwner() {
        String query = "select count(accid) from Account where acctype = 1";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTtRooms() {
        String query = "select count(roommid) from Room";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getTtMoney() {
        String query = "select cmoney from Paycard where pcid = 1";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Infouser> getTop3Info() {
        List<Infouser> list = new ArrayList<>();
        String query = "SELECT TOP 3 * FROM InforUser ORDER BY usid DESC;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Infouser(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Income getIncomeOfAdmin() {
        AdminDAO ad = new AdminDAO();
        int ttAccs = ad.getTtAccount();
        int ttOwners = ad.getTtOwner();
        int ttRooms = ad.getTtRooms();
        int ttMoney = ad.getTtMoney();
        return new Income(ttAccs, ttOwners, ttRooms, ttMoney);
    }

    public List<Notification> getTop3AdminNoti() {
        List<Notification> list = new ArrayList<>();
        String query = "SELECT top(4) a.alertid, a.imagecheck, a.textarea, a.dateup, a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar, a.seen\n"
                + "FROM Alert a\n"
                + "JOIN Account ac ON ac.accid = a.idsend\n"
                + "JOIN InforUser i ON i.usid = ac.usid\n"
                + "WHERE a.idget = 1\n"
                + "order by a.alertid desc";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Notification(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8),
                        rs.getInt(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Infouser getTop1RScore() {
        String query = "select top(1) i.usid, i.fullname, i.uaddress, i.phonenumber, i.birthday, i.avatar, i.email\n"
                + "from InforUser i, Motel m, Review r, Account a where i.usid = a.usid and m.accid = a.accid and m.mid = r.mid \n"
                + "group by i.usid, i.fullname, i.uaddress, i.phonenumber, i.birthday, i.avatar, i.email order by avg(r.rscore) desc";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
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

    public static void main(String[] args) {
        AdminDAO ad = new AdminDAO();
//        List<Account> li = ad.getAllAccount();
//        System.out.println(li);
//        ad.deleteuserACC("3");
        ad.updateAccStatus(2, 1);
    }

}
