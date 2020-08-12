import model.KhachHang;
import until.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/active")
public class active extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //lay email va key
        String email = request.getParameter("email");
        String key = request.getParameter("key");
        KhachHang k = new KhachHang(email, null);
        //cap nhat active
        String avtive = "UPDATE [user] SET active='1' WHERE email=? and [key]=?";
        try {
            PreparedStatement ps = DBConnection.getPreparedStatement(avtive);
            ps.setString(1, email);
            ps.setString(2, key);
            ps.executeUpdate();
            k = new KhachHang(email, null);
            // dang nhap
            request.setAttribute("user", k);
            response.sendRedirect("index.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            // chuyen dia chi den index
//            response.sendRedirect("index.jsp");
//            response.getWriter().println(email+" - "+key);
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}