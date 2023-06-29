/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hatha
 */
public class Bill {
    private int billid;
    private String dateup, description;
    private double price;
    private String datedue;
    private int roomid, accid, condition;

    public Bill() {
    }

    public Bill(int billid, String dateup, String descripsion, double price, String datedue, int roomid, int accid, int condition) {
        this.billid = billid;
        this.dateup = dateup;
        this.description = descripsion;
        this.price = price;
        this.datedue = datedue;
        this.roomid = roomid;
        this.accid = accid;
        this.condition = condition;
    }

    public int getBillid() {
        return billid;
    }

    public void setBillid(int billid) {
        this.billid = billid;
    }

    public String getDateup() {
        return dateup;
    }

    public void setDateup(String dateup) {
        this.dateup = dateup;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDatedue() {
        return datedue;
    }

    public void setDatedue(String datedue) {
        this.datedue = datedue;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getAccid() {
        return accid;
    }

    public void setAccid(int accid) {
        this.accid = accid;
    }

    public int getCondition() {
        return condition;
    }

    public void setCondition(int condition) {
        this.condition = condition;
    }

    @Override
    public String toString() {
        return "Bill{" + "billid=" + billid + ", dateup=" + dateup + ", descripsion=" + description + ", price=" + price + ", datedue=" + datedue + ", roomid=" + roomid + ", accid=" + accid + ", condition=" + condition + '}';
    }
}
