/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hatha
 */
public class Rooms {
    private int roomid;
    private String image1, image2, image3;
    private double price;
    private int quantity, mid;
    private String cateid;
    private int condition;

    public Rooms() {
    }

    public Rooms(int roomid, String image1, String image2, String image3, double price, int quantity, int mid, String cateid, int condition) {
        this.roomid = roomid;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.price = price;
        this.quantity = quantity;
        this.mid = mid;
        this.cateid = cateid;
        this.condition = condition;
    }

    public Rooms(int roomid, String cateid) {
        this.roomid = roomid;
        this.cateid = cateid;
    }
    

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getCateid() {
        return cateid;
    }

    public void setCateid(String cateid) {
        this.cateid = cateid;
    }

    public int getCondition() {
        return condition;
    }

    public void setCondition(int condition) {
        this.condition = condition;
    }

    @Override
    public String toString() {
        return "roomid=" + roomid + ", image1=" + image1 + ", image2=" + image2 + ", image3=" + image3 + ", price=" + price + ", quantity=" + quantity + ", mid=" + mid + ", cateid=" + cateid + ", condition=" + condition + "\n";
    }
    
    
}
