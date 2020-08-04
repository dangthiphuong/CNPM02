package vn.edu.nlu.fit.view;


import vn.edu.nlu.fit.DBConnect.DBConnect;
import vn.edu.nlu.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    public static User checkLogin(String username, String password){
        User user = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try{
            String sql = "select * from user ";
            pst = DBConnect.connect().getConnection().prepareStatement(sql);

            rs=pst.executeQuery();

            while(rs.next()){
                user = new User();
                if( username.equals(rs.getString("username"))) {
                    if(!password.equals(rs.getString("pass"))){
                        user.setUsername(rs.getString("username"));
                        user.setPassword(null);
                    } else {
                        user.setUsername(rs.getString("username"));
                        user.setPassword(rs.getString("pass"));
                        user.setAddress(rs.getString("address"));
                        user.setImage(rs.getString("img"));
                        user.setPhone(rs.getString("phone"));
                        user.setId(rs.getInt("id"));
                    }
                } else {
                    user.setUsername(rs.getString("username"));
                }
            }
            System.out.println(user.getUsername());
            System.out.println(user.getPassword());
            return user;


        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
    }
}

    public static void main(String[] args) {
        LoginDAO l = new LoginDAO();
        l.checkLogin("phuong","123");
    }
}
