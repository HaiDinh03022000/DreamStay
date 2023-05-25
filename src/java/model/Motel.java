

package model;


public class Motel {
    private int mid;
    private String name, image1,image2,image3,image4,image5;
    private int price;
    private String description,district,address, quantity, dateupload ,coordinates;
    private int cateid;
    private int uid ,rscore;

    public Motel() {
    }

    public Motel(int mid, String name, String image1, int price, String district, String address) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.district = district;
        this.address = address;
    }

    public Motel(int mid, String name, String image1, int price, String description, String district, String address) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.description = description;
        this.district = district;
        this.address = address;
    }

    public Motel(int mid, String name, String image1, int price, String district, String address, int rscore) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.district = district;
        this.address = address;
        this.rscore = rscore;
    }

    
    
    
    
    public Motel(String name, String image1, int price, String district, String address, int rscore) {
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.district = district;
        this.address = address;
        this.rscore = rscore;
    }

    public Motel(int mid, String name, String image1, int price, String description, String district, String address, String quantity, String dateupload, String coordinates, int uid, int cateid) {
        this.mid = mid;
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.description = description;
        this.district = district;
        this.address = address;
        this.quantity = quantity;
        this.dateupload = dateupload;
        this.coordinates = coordinates;
        this.cateid = cateid;
        this.uid = uid;
        
    }

   
    
    

    public Motel(String name, String image1, int price, String district, String address) {
        this.name = name;
        this.image1 = image1;
        this.price = price;
        this.district = district;
        this.address = address;
    }

  
//    @Override
//    public String toString() {
//        StringBuilder sb = new StringBuilder();
//        sb.append("Motel{");
//        sb.append("name=").append(name);
//        sb.append(", image1=").append(image1);
//        sb.append(", price=").append(price);
//        sb.append(", district=").append(district);
//        sb.append(", address=").append(address);
//       
//        sb.append('}');
//        sb.append("\n");
//        return sb.toString();
//    }

//    @Override
//    public String toString() {
//        StringBuilder sb = new StringBuilder();
//        sb.append("Motel{");
//        sb.append("name=").append(name);
//        sb.append(", image1=").append(image1);
//        sb.append(", price=").append(price);
//        sb.append(", district=").append(district);
//        sb.append(", address=").append(address);
//        sb.append(", rscore=").append(rscore);
//        sb.append('}');
//        sb.append("\n");
//        return sb.toString();
//    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Motel{");
        sb.append("name=").append(name);
        sb.append(", image1=").append(image1);
        sb.append(", price=").append(price);
        sb.append(", description=").append(description);
        sb.append(", district=").append(district);
        sb.append(", address=").append(address);
        sb.append(", quantity=").append(quantity);
        sb.append(", dateupload=").append(dateupload);
        sb.append(", coordinates=").append(coordinates);
        sb.append(", cateid=").append(cateid);
        sb.append(", uid=").append(uid);
        sb.append(", rscore=").append(rscore);
        sb.append('}');
        sb.append("\n");
        return sb.toString();
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

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getImage5() {
        return image5;
    }

    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
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

    public int getRscore() {
        return rscore;
    }

    public void setRscore(int rscore) {
        this.rscore = rscore;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

 

   
    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
    
    
}
