package vn.edu.nlu.fit.DBConnect;

import java.sql.*;

public class DBConnect {
    static Connection con;
    public static Statement connect() throws  ClassNotFoundException, SQLException {
        if (con==null|| con.isClosed()){
            Class.forName("com.mysql.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=utf-8","root","");
            System.out.println("success");
            return con.createStatement();
        } else{
            System.out.println("fail");
            return con.createStatement();
        }
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        DBConnect db = new DBConnect();
        db.connect();
    }
}
