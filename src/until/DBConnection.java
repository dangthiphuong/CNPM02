package until;

import java.sql.*;

public class DBConnection {
    static Connection con;

    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
        if (con == null || con.isClosed()) {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection("jdbc:sqlserver://team02.database.windows.net:1433;database=team;user=nguyenloi@team02;password=Thanhloi140399;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30");
        }
        return con.prepareStatement(sql);
    }


    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        PreparedStatement p = DBConnection.getPreparedStatement("select * from \"user\" where email=? ");
        p.setString(1, "vip.thanhloi@gmail.com");
        ResultSet rs = p.executeQuery();
        while (rs.next()){
            System.out.println(rs.getString(2));
        }
    }
}
