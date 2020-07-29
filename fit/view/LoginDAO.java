package vn.edu.nlu.fit.view;


import vn.edu.nlu.fit.DBConnect.DBConnect;
import vn.edu.nlu.fit.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    public static User checkLogin(String username, String password){
        User user;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try{
            String sql = "select * from user where username = ? and pass = ? ";
            pst = DBConnect.connect().getConnection().prepareStatement(sql);
            pst.setString(1,username);

            pst.setString(2,password);

            rs=pst.executeQuery();

            while(rs.next()){
                user = new User();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("pass"));
                user.setAddress(rs.getString("address"));
                user.setImage(rs.getString("img"));
                user.setPhone(rs.getString("phone"));
                user.setId(rs.getInt("id"));
                System.out.println("yes");
                return user;
            }
            return null;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
    }
}
}
