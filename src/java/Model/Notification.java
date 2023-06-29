
package Model;


public class Notification {
    private String nftid, imgagecheck, textarea, dateup;   
    private double pmoney;
    private int astatus; 
    private int idsend, roomid, idget;
    private String username, avatar;
    private int seen;
    

    public Notification() {
    }

    public Notification(String nftid, String imgagecheck, String textarea, String dateup, double pmoney, int checkAD, int idsend, int mid, int idget, String username, String avatar) {
        this.nftid = nftid;
        this.imgagecheck = imgagecheck;
        this.textarea = textarea;
        this.dateup = dateup;
        this.pmoney = pmoney;
        this.astatus = checkAD;
        this.idsend = idsend;
        this.roomid = mid;
        this.idget = idget;
        this.username = username;
        this.avatar = avatar;
    }

    public Notification(String nftid, String imgagecheck, String textarea, String dateup, double pmoney, int Astatus, int idsend, int mid, int idget, int seen) {
        this.nftid = nftid;
        this.imgagecheck = imgagecheck;
        this.textarea = textarea;
        this.dateup = dateup;
        this.pmoney = pmoney;
        this.astatus = Astatus;
        this.idsend = idsend;
        this.roomid = mid;
        this.idget = idget;
        this.seen = seen;
    }

    

    public Notification(String nftid, String imgagecheck, String textarea, String dateup, double pmoney, int Astatus, int idsend, int mid, int idget, String username, String avatar, int seen) {
        this.nftid = nftid;
        this.imgagecheck = imgagecheck;
        this.textarea = textarea;
        this.dateup = dateup;
        this.pmoney = pmoney;
        this.astatus = Astatus;
        this.idsend = idsend;
        this.roomid = mid;
        this.idget = idget;
        this.username = username;
        this.avatar = avatar;
        this.seen = seen;
    }

    public String getNftid() {
        return nftid;
    }

    public void setNftid(String nftid) {
        this.nftid = nftid;
    }

    public String getImgagecheck() {
        return imgagecheck;
    }

    public void setImgagecheck(String imgagecheck) {
        this.imgagecheck = imgagecheck;
    }

    public String getTextarea() {
        return textarea;
    }

    public void setTextarea(String textarea) {
        this.textarea = textarea;
    }

    public String getDateup() {
        return dateup;
    }

    public void setDateup(String dateup) {
        this.dateup = dateup;
    }

    public double getPmoney() {
        return pmoney;
    }

    public void setPmoney(double pmoney) {
        this.pmoney = pmoney;
    }

    public int getAstatus() {
        return astatus;
    }

    public void setAstatus(int astatus) {
        this.astatus = astatus;
    }

    public int getIdsend() {
        return idsend;
    }

    public void setIdsend(int idsend) {
        this.idsend = idsend;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public int getIdget() {
        return idget;
    }

    public void setIdget(int idget) {
        this.idget = idget;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getSeen() {
        return seen;
    }

    public void setSeen(int seen) {
        this.seen = seen;
    }

    

    @Override
    public String toString() {
        return "nftid=" + nftid + ", imgagecheck=" + imgagecheck + ", textarea=" + textarea + ", dateup=" + dateup + ", pmoney=" + pmoney + ", Astatus=" + astatus + ", idsend=" + idsend + ", mid=" + roomid + ", idget=" + idget + ", username=" + username + ", avatar=" + avatar + ", seen=" + seen + "\n";
    }
    
    

    

    
    
}
