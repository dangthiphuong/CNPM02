package model;

import until.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class QuanLiKhachHang {

    public QuanLiKhachHang() {
    }

    public static boolean themKhachHangMoi(KhachHang k) throws SQLException, ClassNotFoundException {
        //key active
        int number = (int) Math.floor(((Math.random() * 899999) + 100000));
        //cau truy van
        String sql = "Insert into \"user\" values (?,?,?,0)";
        // goi prepareS
        PreparedStatement ps = DBConnection.getPreparedStatement(sql);
        // set cac thuoc tinh
        ps.setString(1, k.email);
        ps.setString(2, k.pass);
        ps.setInt(3, number);
        // thuc thi
        ps.executeUpdate();
        // gui mail
        vn.nlu.cnpm.until.sendMail.sendMailRegister(k.email, number + "");
        return true;
    }

    public static KhachHang checkLogin(String username, String password) {
        KhachHang user = new KhachHang(null, null);
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM [user] WHERE email =? and pass = ? and active='1' ";
            pst = DBConnection.getPreparedStatement(sql);
            pst.setString(1, username);
            pst.setString(2, password);
            rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                return user;
            }
            return user;


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        System.out.println(checkLogin("17130114@st.hcmuaf.edu.vn","Thanhloi1").email);
    }



}
