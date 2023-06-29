package Model;

public class Review {

    private int rvid;
    private String rvimg, dateup;
    private double rscore;
    private String comment, accid, mid,username, avatar;

    public Review(int rvid, String rvimg, String dateup, double rscore, String comment, String accid, String mid, String username, String avatar) {
        this.rvid = rvid;
        this.rvimg = rvimg;
        this.dateup = dateup;
        this.rscore = rscore;
        this.comment = comment;
        this.accid = accid;
        this.mid = mid;
        this.username = username;
        this.avatar = avatar;
    }

    public int getRvid() {
        return rvid;
    }

    public void setRvid(int rvid) {
        this.rvid = rvid;
    }

    public String getRvimg() {
        return rvimg;
    }

    public void setRvimg(String rvimg) {
        this.rvimg = rvimg;
    }

    public String getDateup() {
        return dateup;
    }

    public void setDateup(String dateup) {
        this.dateup = dateup;
    }

    public double getRscore() {
        return rscore;
    }

    public void setRscore(double rscore) {
        this.rscore = rscore;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getAccid() {
        return accid;
    }

    public void setAccid(String accid) {
        this.accid = accid;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
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

    @Override
    public String toString() {
        return "Review{" + "rvid=" + rvid + ", rvimg=" + rvimg + ", dateup=" + dateup + ", rscore=" + rscore + ", comment=" + comment + ", accid=" + accid + ", mid=" + mid + ", username=" + username + ", avatar=" + avatar + '}';
    }

    
}
