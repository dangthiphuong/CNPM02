package model;

public class KhachHang {
    int id;
    String email;
    String pass;

    public KhachHang() {

    }

    public KhachHang(String email, String pass) {
        this.email = email;
        this.pass = pass;
    }

public void setEmail(String email){
        this.email = email;
}
    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
