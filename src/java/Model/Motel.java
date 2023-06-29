

package Model;


public class Motel {
    private int mid;
    private String name, image1;
    private double price;
    private String description,address;
    private String dateupload ,coordinates;
    private int accid;
    private double rscore;

    public Motel(int mid, String name, String image1, double price, String address, double rscore) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.address = address;
        this.rscore = rscore;
    }


    public Motel(int mid, String name, String image1, String description, String address, String dateupload, String coordinates, int accid) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.description = description;
        this.address = address;
        this.dateupload = dateupload;
        this.coordinates = coordinates;
        this.accid = accid;
    }

    public Motel(int mid, String name, String image1, String description, String address, String dateupload, String coordinates, int accid, double rscore) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.description = description;
        this.address = address;
        this.dateupload = dateupload;
        this.coordinates = coordinates;
        this.accid = accid;
        this.rscore = rscore;
    }
    
    

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDateupload() {
        return dateupload;
    }

    public void setDateupload(String dateupload) {
        this.dateupload = dateupload;
    }

    public String getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(String coordinates) {
        this.coordinates = coordinates;
    }

    public int getAccid() {
        return accid;
    }

    public void setAccid(int accid) {
        this.accid = accid;
    }

    public double getRscore() {
        return rscore;
    }

    public void setRscore(double rscore) {
        this.rscore = rscore;
    }

    @Override
    public String toString() {
        return "mid=" + mid + ", name=" + name + ", image1=" + image1 + ", price=" + price + ", description=" + description + ", address=" + address + ", dateupload=" + dateupload + ", coordinates=" + coordinates + ", accid=" + accid + ", rscore=" + rscore + "\n";
    }
    
}
