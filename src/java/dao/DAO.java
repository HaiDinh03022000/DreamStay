package dao;

import connectdatabase.Connections;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Motel;

public class DAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Motel> getAllMotels() {
        List<Motel> list = new ArrayList<>();
        String query = "select m.mid, m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress\n"
                + "from Motel m";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Motel getMotelByID(String mid) {

        String query = "select * from Motel \n"
                + "where mid = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, mid);
            rs = ps.executeQuery();
            if (rs.next()) {

                return new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14),
                        rs.getInt(15),
                        rs.getInt(16));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Motel> getTop4Motels() {
        List<Motel> list = new ArrayList<>();
        String query = "select top(4) m.mid, m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress , SUM(r.rscore) as 'Total Score' \n"
                + "from Motel m, Review r\n"
                + "where m.mid = r.mid \n"
                + "group by m.mid,m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress \n"
                + "ORDER BY 'Total Score' DESC;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchByName(String txtsearch) {
        List<Motel> list = new ArrayList<>();
        String query = "select m.mid, m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress, SUM(r.rscore) as 'Total Score' \n"
                + "from Motel m ,Review r\n"
                + "where m.mid = r.mid and maddress like '%' + ? + '%'\n"
                + "group by m.mid,m.mname , m.mimage1 ,m.price, m.mdistrict ,m.maddress ";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, txtsearch);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
//        List<Motel> m = dao.getAllMotels();
//        System.out.println(m);
//        List<Motel> m = dao.getTop4Motels();
//        System.out.println(m);
        List<Motel> m = dao.searchByName("v");
        System.out.println(m);
//        System.out.println(dao.getMotelByID("3"));
    }
}
