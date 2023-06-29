/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author win
 */
public class Infouser {
    private int usid;
    private String fullname;
    private String uAddress;
    private String phoneNum;
    private String age, avatar, email;

    public Infouser(int usid, String fullname, String uAddress, String phoneNum, String age, String avatar, String email) {
        this.usid = usid;
        this.fullname = fullname;
        this.uAddress = uAddress;
        this.phoneNum = phoneNum;
        this.age = age;
        this.avatar = avatar;
        this.email = email;
    }

    public Infouser(int usid, String fullname, String uAddress, String phoneNum, String age, String avatar) {
        this.usid = usid;
        this.fullname = fullname;
        this.uAddress = uAddress;
        this.phoneNum = phoneNum;
        this.age = age;
        this.avatar = avatar;
    }  

    public Infouser(String fullname, String uAddress, String phoneNum, String age) {
        this.fullname = fullname;
        this.uAddress = uAddress;
        this.phoneNum = phoneNum;
        this.age = age;
    }

    public Infouser() {
    }

    public int getUsid() {
        return usid;
    }

    public void setUsid(int usid) {
        this.usid = usid;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Infouser{" + "usid=" + usid + ", fullname=" + fullname + ", uAddress=" + uAddress + ", phoneNum=" + phoneNum + ", age=" + age + ", avatar=" + avatar + ", email=" + email + '}';
    }
    
 
}
