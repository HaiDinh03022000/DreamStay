/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Account;
import Model.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hatha
 */
public class NotificationDAO {

    ResultSet re;
    Connection con = null;
    PreparedStatement ps = null;

    public Notification GetNotiByid(String alertid) {
        String query = "select * from Alert where alertid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, alertid);
            re = ps.executeQuery();
            if (re.next()) {
                return new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Notification GetNotiByidget(int idget, int roomid) {
        String query = "select * from Alert where idget = ? and roommid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, idget);
            ps.setInt(2, roomid);
            re = ps.executeQuery();
            if (re.next()) {
                return new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Notification> getNotificationForOwner(int accid) {
        List<Notification> list = new ArrayList<>();
        String query = "select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and m.accid = ? and (a.staid = 1 or a.staid = 5)";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> returnMoney(int roomid) {
        List<Notification> list = new ArrayList<>();
        String query = "select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and a.roommid = ? and a.staid = 1";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, roomid);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> getDoneNotification(int accid) {
        List<Notification> list = new ArrayList<>();
        String query = "select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and m.accid = ? and ( a.staid = 2 or a.staid = 3)";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> getTop4Notifications(int accid) {
        List<Notification> list = new ArrayList<>();
        String query = "select top(4) a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and idget = ? and (staid = 1 or staid = 4 or staid = 6)\n"
                + "order by alertid desc";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> getPending(int accid) {
        List<Notification> list = new ArrayList<>();
        String query = "select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and a.idsend = ? and (a.staid = 1 or a.staid = 5)";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> getAllPending() {
        List<Notification> list = new ArrayList<>();
        String query = "select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and and (a.staid = 1 or a.staid = 5)";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> getDoneProcess(int accid) {
        List<Notification> list = new ArrayList<>();
        String query = "select a.alertid, a.imagecheck, a.textarea, a.dateup,a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar,a.seen\n"
                + "from Motel m, Alert a, Account ac , InforUser i, Room r\n"
                + "where m.mid = r.mid and ac.accid = a.idsend and i.usid = ac.usid and r.roommid = a.roommid and idget = ? and (staid = 4 or staid = 6)";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Notification> getAdminNotiPending() {
        List<Notification> list = new ArrayList<>();
        String query = "SELECT a.alertid, a.imagecheck, a.textarea, a.dateup, a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar, a.seen\n"
                + "FROM Alert a\n"
                + "JOIN Account ac ON ac.accid = a.idsend\n"
                + "JOIN InforUser i ON i.usid = ac.usid\n"
                + "WHERE a.idget = 1 and a.staid = 7;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Notification> getAdminNotiDone() {
        List<Notification> list = new ArrayList<>();
        String query = "SELECT a.alertid, a.imagecheck, a.textarea, a.dateup, a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar, a.seen\n"
                + "FROM Alert a\n"
                + "JOIN Account ac ON ac.accid = a.idsend\n"
                + "JOIN InforUser i ON i.usid = ac.usid\n"
                + "WHERE a.idget = 1 and a.staid = 8;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Notification> getAdminNotiByType(String type) {
        List<Notification> list = new ArrayList<>();
        String query = "SELECT a.alertid, a.imagecheck, a.textarea, a.dateup, a.pmoney, a.staid, a.idsend, a.roommid, a.idget, ac.username, i.avatar, a.seen\n"
                + "FROM Alert a\n"
                + "JOIN Account ac ON ac.accid = a.idsend\n"
                + "JOIN InforUser i ON i.usid = ac.usid\n"
                + "WHERE a.idget = 1 and a.textarea like '%' + ? + '%';";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, type);
            re = ps.executeQuery();
            while (re.next()) {
                list.add(new Notification(re.getString(1),
                        re.getString(2),
                        re.getString(3),
                        re.getString(4),
                        re.getDouble(5),
                        re.getInt(6),
                        re.getInt(7),
                        re.getInt(8),
                        re.getInt(9),
                        re.getString(10),
                        re.getString(11),
                        re.getInt(12)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertAlert(String textarea, int idsend, int roomid, int status, double pmoney, int idget) {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
        String formattedDate = currentDate.format(formatter);

        String query = "insert into Alert (textarea, dateup ,pmoney, staid, idsend, roommid, idget, seen)\n"
                + "  values (?,?,?,?,?,?,?,0);";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, textarea);
            ps.setString(2, formattedDate);
            ps.setDouble(3, pmoney);
            ps.setInt(4, status);
            ps.setInt(5, idsend);
            ps.setInt(6, roomid);
            ps.setInt(7, idget);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertAlertForAdmin(String textarea, int idsend, int status, int idget) {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
        String formattedDate = currentDate.format(formatter);

        String query = "insert into Alert (textarea, dateup , staid, idsend, idget)\n"
                + "  values (?,?,?,?,?);";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, textarea);
            ps.setString(2, formattedDate);
            ps.setInt(3, status);
            ps.setInt(4, idsend);
            ps.setInt(5, idget);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateStatus(String nfcid, int status) {
        String query = "update Alert set staid = ? where alertid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, status);
            ps.setString(2, nfcid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    

    public void updateSeen(String nfcid) {
        String query = "update Alert set seen = 1 where alertid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, nfcid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteNoti(String nfcid) {
        String query = "delete from Alert where alertid =?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, nfcid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delAll(int roomid) {
        String query = "delete from Alert where roommid = ? and staid = 1";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        NotificationDAO noti = new NotificationDAO();
        List<Notification> list = noti.getTop4Notifications(3);
        System.out.println(list);
    }
}
