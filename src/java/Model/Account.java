/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author win
 */
public class Account {
    private int accId;
    private String user;
    private String pass;
    private int accType;
    private String createDate;
    private String otp;
    private String infoid;
    private String payid;

    public Account(int accId, String user, String pass, int accType, String createDate, String otp,String infoid) {
        this.accId = accId;
        this.user = user;
        this.pass = pass;
        this.accType = accType;
        this.createDate = createDate;
        this.otp = otp;
        this.infoid = infoid;
    }

    public Account(int accId, String user, String pass, int accType, String createDate, String otp, String infoid, String payid) {
        this.accId = accId;
        this.user = user;
        this.pass = pass;
        this.accType = accType;
        this.createDate = createDate;
        this.otp = otp;
        this.infoid = infoid;
        this.payid = payid;
    }

    public Account(int accId, String user, String pass, String infoid) {
        this.accId = accId;
        this.user = user;
        this.pass = pass;
        this.infoid = infoid;
    }

    public Account(int accId, String user, String pass) {
        this.accId = accId;
        this.user = user;
        this.pass = pass;
    }
    
    public Account() {
    }   

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getAccType() {
        return accType;
    }

    public void setAccType(int accType) {
        this.accType = accType;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getOtp() {
        return otp;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    public String getInfoid() {
        return infoid;
    }

    public void setInfoid(String infoid) {
        this.infoid = infoid;
    }

    public String getPayid() {
        return payid;
    }

    public void setPayid(String payid) {
        this.payid = payid;
    }  

    @Override
    public String toString() {
        return "Account{" + "accId=" + accId + ", user=" + user + ", pass=" + pass + ", accType=" + accType + ", createDate=" + createDate + ", otp=" + otp + ", infoid=" + infoid + ", payid=" + payid + '}';
    }
    
}
