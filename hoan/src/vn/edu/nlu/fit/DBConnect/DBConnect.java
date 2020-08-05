package vn.edu.nlu.fit.DBConnect;

import java.sql.*;

public class DBConnect {
    static Connection con;
    public static Connection getConnection() throws ClassNotFoundException, SQLException  {
        if (con==null||con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useUnicode=true&characterEncoding=utf-8", "root", "");
            return con;
        } else {
            return con;
        }
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        DBConnect db = new DBConnect();
        db.getConnection();
        System.out.println("sussecc");
    }
}
