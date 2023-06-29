/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hatha
 */
public class PayCard {
    private String payid, fullname, numcard, cmoney, releasedate, pincode;

    public PayCard(String payid, String fullname, String numcard, String cmoney, String releasedate, String pincode) {
        this.payid = payid;
        this.fullname = fullname;
        this.numcard = numcard;
        this.cmoney = cmoney;
        this.releasedate = releasedate;
        this.pincode = pincode;
    }

    public PayCard() {
    }

    public String getPayid() {
        return payid;
    }

    public void setPayid(String payid) {
        this.payid = payid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getNumcard() {
        return numcard;
    }

    public void setNumcard(String numcard) {
        this.numcard = numcard;
    }

    public String getCmoney() {
        return cmoney;
    }

    public void setCmoney(String cmoney) {
        this.cmoney = cmoney;
    }

    public String getReleasedate() {
        return releasedate;
    }

    public void setReleasedate(String releasedate) {
        this.releasedate = releasedate;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    @Override
    public String toString() {
        return "PayCard{" + "payid=" + payid + ", fullname=" + fullname + ", numcard=" + numcard + ", cmoney=" + cmoney + ", releasedate=" + releasedate + ", pincode=" + pincode + '}';
    }
    
    
}
