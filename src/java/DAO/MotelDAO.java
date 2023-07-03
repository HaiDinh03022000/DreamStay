package DAO;

import Model.Bill;
import Model.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.Motel;
import Model.Review;
import Model.Rooms;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MotelDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public int getMidByimg(String img) {
        String query = "select mid from Motel where motelimg = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, img);
            rs = ps.executeQuery();
            while (rs.next()) {
                int mid = rs.getInt(1);
                return mid;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Motel> getAllMotels() {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, avg(rm.price) as avgprice ,m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> getAllOwnerMotel(int accid) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, avg(rm.price) as avgprice ,m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "Where m.accid = ?\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> ListRanMotel(int mid, int accid) {
        List<Motel> list = new ArrayList<>();
        String query = "select top 3 * from Motel where mid != ? and accid = ? order by newid();";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            ps.setInt(2, accid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getFroom(int mid) {
        String query = "select top 1 r.roommid from Motel m, Room r where m.mid = r.mid and m.mid =?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            if (rs.next()) {
                String em = rs.getString(1);
                return em;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Rooms> getAllidRoom(int mid) {
        List<Rooms> list = new ArrayList<>();
        String query = "select r.roommid, c.catenme from Motel m, Room r, Category c where m.mid = r.mid and r.cateid = c.cateid and m.mid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Rooms(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Rooms> getAllRoom(int mid) {
        List<Rooms> list = new ArrayList<>();
        String query = "select r.roommid, c.catenme from Motel m, Room r, Category c where m.mid = r.mid and r.cateid = c.cateid and m.mid = ? and r.quantity > 0";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Rooms(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Rooms getRoomByid(String roomid) {
        String query = "select * from Room where roommid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, roomid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Rooms(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getString(8),
                        rs.getInt(9));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public Motel getMotelByID(int mid) {

        String query = "SELECT m.mid, m.mname, m.motelimg,m.mdescription,  m.maddress,m.dateupload,m.coordinates,m.accid, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "WHERE m.mid = ?\n"
                + "GROUP BY m.mid, m.mname, m.motelimg,m.mdescription, m.maddress,m.dateupload,m.coordinates,m.accid";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            if (rs.next()) {

                return new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getDouble(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Motel> getTop4Motels() {
        List<Motel> list = new ArrayList<>();
        String query = "select top(4) m.mid, m.mname, m.motelimg,m.mdescription,  m.maddress,m.dateupload,m.coordinates,m.accid, avg(r.rscore) as 'Total Score' \n"
                + "from Motel m, Review r\n"
                + "where m.mid = r.mid \n"
                + "group by m.mid, m.mname, m.motelimg,m.mdescription,  m.maddress,m.dateupload,m.coordinates,m.accid\n"
                + "ORDER BY 'Total Score' DESC;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getDouble(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

//    public List<Motel> getNew6Motels() {
//        List<Motel> list = new ArrayList<>();
//        String query = "select top(6) mid, mname , mimage1 ,price, mdistrict ,maddress \n"
//                + "from Motel \n"
//                + "group by mid,mname , mimage1 ,price, mdistrict ,maddress \n"
//                + "ORDER BY mid DESC;";
//        try {
//            con = new Connections().getConnection();
//            ps = con.prepareStatement(query);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(new Motel(rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getInt(7)));
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
    public List<Motel> searchByName(String txtsearch) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "WHERE m.maddress LIKE '%' + ? + '%'\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, txtsearch);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> listCate() {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> listCateDontHave(int mid) {
        List<Category> list = new ArrayList<>();
        String query = "SELECT c.* FROM Category c\n"
                + "LEFT JOIN Room r ON c.cateid = r.cateid AND r.mid = ?\n"
                + "WHERE r.cateid IS NULL;";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchByMultiField(String district, int maxprice, int cateid) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "WHERE m.maddress like '%'+?+'%'  and rm.cateid = ? AND (rm.price BETWEEN ? AND ?)\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress\n";
        int minprice = 0;
        if (maxprice > 1000000) {
            minprice = maxprice - 1000000;
        }
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, district);
            ps.setInt(2, cateid);
            ps.setInt(3, minprice);
            ps.setInt(4, maxprice);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchBy2_1(String district, int maxprice) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT DISTINCT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "INNER JOIN Room rm ON m.mid = rm.mid\n"
                + "WHERE m.maddress LIKE '%'+ ? +'%' AND (rm.price BETWEEN ? AND ?)\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress;";

        int minprice = 0;
        if (maxprice > 1000000) {
            minprice = maxprice - 1000000;
        }
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, district);
            ps.setInt(2, minprice);
            ps.setInt(3, maxprice);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchBy2_2(String district, int cateid) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "WHERE m.maddress like '%'+?+'%'  and rm.cateid = ?\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, district);
            ps.setInt(2, cateid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchBy2_3(int maxprice, int cateid) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "WHERE rm.cateid = ? AND (rm.price BETWEEN ? AND ?) \n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress;";

        int minprice = 0;
        if (maxprice > 1000000) {
            minprice = maxprice - 1000000;
        }
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, cateid);
            ps.setInt(2, minprice);
            ps.setInt(3, maxprice);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchByDistrict(String district) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Room rm ON m.mid = rm.mid\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "WHERE m.maddress LIKE '%' + ? + '%'\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, district);

            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchByPrice(int maxprice) {
        List<Motel> list = new ArrayList<>();
        String query = "SELECT DISTINCT  m.mid, m.mname, m.motelimg, AVG(rm.price) AS avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "FROM Motel m\n"
                + "LEFT JOIN Review r ON m.mid = r.mid\n"
                + "INNER JOIN Room rm ON m.mid = rm.mid\n"
                + "WHERE rm.price BETWEEN ? AND ?\n"
                + "GROUP BY m.mid, m.mname, m.motelimg, m.maddress;";
        int minprice = 0;
        if (maxprice > 1000000) {
            minprice = maxprice - 1000000;
        }
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, minprice);
            ps.setInt(2, maxprice);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Motel> searchByCate(int cateid) {
        List<Motel> list = new ArrayList<>();
        String query = "select m.mid, m.mname, m.motelimg, avg(rm.price) as avgprice, m.maddress, COALESCE(AVG(r.rscore), 0) AS avgsc\n"
                + "from Motel m \n"
                + "LEFT JOIN Room rm on m.mid = rm.mid\n"
                + "left join Review r on m.mid = r.mid \n"
                + "where cateid = ?\n"
                + "group by m.mid, m.mname, m.motelimg, m.maddress";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, cateid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Motel(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getDouble(6)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Review> listReview(int mid) {
        List<Review> list = new ArrayList<>();
        String query = "select r.rvid , r.img, r.dateup, r.rscore, r.comment, r.accid, r.mid, a.username , i.avatar\n"
                + "from Review r , Account a ,InforUser i, Motel m\n"
                + "where r.accid = a.accid and i.usid = a.usid and m.mid = r.mid and m.mid = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Review> listReviewOwner(int accid) {
        List<Review> list = new ArrayList<>();
        String query = "select r.rvid , r.img, r.dateup, r.rscore, r.comment, r.accid, r.mid, a.username , i.avatar\n"
                + "from Review r , Account a ,InforUser i, Motel m\n"
                + "where r.accid = a.accid and i.usid = a.usid and m.mid = r.mid and m.accid = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void updateSubQuantity(int roomid) {
        String query = "update Room set quantity = quantity - 1 where roommid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateAddQuantity(int roomid) {
        String query = "update Room set quantity = quantity + 1 where roommid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateMotel1(String name, String img, String desc, String address, String coordinates, int mid) {
        String query = "update Motel set mname = ? ,motelimg = ?, mdescription = ?,maddress = ? ,coordinates = ?"
                + " where mid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setString(3, desc);
            ps.setString(4, address);
            ps.setString(5, coordinates);
            ps.setInt(6, mid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateMotel2(String name, String desc, String address, String coordinates, int mid) {
        String query = "update Motel set mname = ?, mdescription = ?,maddress = ? ,coordinates = ?"
                + " where mid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setString(3, address);
            ps.setString(4, coordinates);
            ps.setInt(5, mid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateRoom1(double price, int quantity, int roomid) {
        String query = "update Room set price = ?, quantity = ? where roommid = ?;";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setDouble(1, price);
            ps.setInt(2, quantity);
            ps.setInt(3, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateRoom2_1(String img1, double price, int quantity, int roomid) {
        String query = "update Room set mimage1 = ?, price = ?, quantity = ? where roommid = ?;";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, img1);
            ps.setDouble(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateRoom2_2(String img1, String img2, double price, int quantity, int roomid) {
        String query = "update Room set mimage1 = ?, mimage2 = ?, price = ?, quantity = ? where roommid = ?;";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, img1);
            ps.setString(2, img2);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setInt(5, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateRoom2_3(String img1, String img2, String img3, double price, int quantity, int roomid) {
        String query = "update Room set mimage1 = ?, mimage2 = ?, mimage3 = ?, price = ?, quantity = ? where roommid = ?;";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, img1);
            ps.setString(2, img2);
            ps.setString(3, img3);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);
            ps.setInt(6, roomid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertMotel(String name, String img1, String address, String coordinates, String description, int accid) {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
        String formattedDate = currentDate.format(formatter);

        String query = "insert into Motel (mname, motelimg, mdescription,maddress,dateupload,coordinates,accid)\n"
                + "  values (?,?,?,?,?,?,?);";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, img1);
            ps.setString(3, description);
            ps.setString(4, address);
            ps.setString(5, formattedDate);
            ps.setString(6, coordinates);
            ps.setInt(7, accid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertReview(String rscore, String comment, int accid, String mid) {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
        String formattedDate = currentDate.format(formatter);

        String query = "insert into Review(dateup, rscore, comment, accid, mid)\n"
                + " values(?,?,?,?,?);";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, formattedDate);
            ps.setString(2, rscore);
            ps.setString(3, comment);
            ps.setInt(4, accid);
            ps.setString(5, mid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleReviewByID(String rvid) {
        String query = "DELETE FROM Review WHERE rvid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, rvid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertRoom3(String img1, String img2, String img3, int price, int quantity, int mid, int cateid) {
        String query = "insert into Room\n"
                + "values(?,?,?,?,?,?,?,1)";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, img1);
            ps.setString(2, img2);
            ps.setString(3, img3);
            ps.setInt(4, price);
            ps.setInt(5, quantity);
            ps.setInt(6, mid);
            ps.setInt(7, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertRoom2(String img1, String img2, int price, int quantity, int mid, int cateid) {
        String query = "insert into Room(mimage1, mimage2, price, quantity, mid, cateid, codition)\n"
                + "values(?,?,?,?,?,?,1)";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, img1);
            ps.setString(2, img2);
            ps.setInt(3, price);
            ps.setInt(4, quantity);
            ps.setInt(5, mid);
            ps.setInt(6, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertRoom1(String img1, int price, int quantity, int mid, int cateid) {
        String query = "insert into Room(mimage1, price, quantity, mid, cateid, codition)\n"
                + "values(?,?,?,?,?,1)";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, img1);
            ps.setInt(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, mid);
            ps.setInt(5, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertBill(String description, double price, String datedue, int roomid, int accid, int condition) {
        LocalDateTime currentDate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS");
        String formattedDate = currentDate.format(formatter);

        String query = "insert into Bill values (?,?,?,?,?,?,?);";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, formattedDate);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setString(4, datedue);
            ps.setInt(5, roomid);
            ps.setInt(6, accid);
            ps.setInt(7, condition);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Bill> getListBill() {
        List<Bill> list = new ArrayList<>();
        String query = "select * from Bill where condition = 1";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Bill> getBillByMid(int mid) {
        List<Bill> list = new ArrayList<>();
        String query = "select b.* from Motel m, Bill b, Room r\n"
                + "where m.mid = r.mid and b.roommid = r.roommid and m.mid = ?";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Bill> ListOwnerBill(int accid) {
        List<Bill> list = new ArrayList<>();
        String query = "select * from Bill where accid = ? order by bid desc";
        try {
            con = new Connections().getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Bill getRoomidByBill(String bid) {
        String query = "select * from Bill where bid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, bid);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Bill(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7),
                        rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void updateFalseBill(int billid) {
        String query = "update Bill set condition = 0 where bid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, billid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateTrueBill(String billid) {
        String query = "update Bill set condition = 1 where bid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, billid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateDatedueBill(String billid, String datedue) {
        String query = "update Bill set datedue = ? where bid = ?";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setString(1, datedue);
            ps.setString(2, billid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int GetOwnerBill(int accid, int mid) {
        String query = "select b.accid from Bill b, Motel m, Room r\n"
                + "where b.roommid = r.roommid and m.mid = r.mid and  b.accid = ? and m.mid = ?; ";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, accid);
            ps.setInt(2, mid);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int getNewRoomId(int mid) {
        String query = "select top(1) roommid from Room where mid = ? order by roommid desc";
        try {
            con = new Connections().getConnection();//mo ket noi voi sql
            ps = con.prepareStatement(query);
            ps.setInt(1, mid);
            rs = ps.executeQuery();
            if (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public static void main(String[] args) {
        MotelDAO dao = new MotelDAO();
        List<Bill> b = dao.getBillByMid(2);
        System.out.println(b);
    }
}
