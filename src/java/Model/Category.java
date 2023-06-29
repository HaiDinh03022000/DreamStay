/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author hatha
 */
public class Category {
    private int cateid;
    private String catename;

    public Category() {
    }

    public Category(int cateid, String catename) {
        this.cateid = cateid;
        this.catename = catename;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    @Override
    public String toString() {
        return "Category{" + "cateid=" + cateid + ", catename=" + catename + '}';
    }  
}
