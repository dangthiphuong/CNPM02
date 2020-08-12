import model.KhachHang;
import model.QuanLiKhachHang;
import until.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/register")
public class register extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try { // lay email
            String email = request.getParameter("email");
            // lay pass
            String pass = request.getParameter("pass");
            // kiem tra email ton tai chua
            PreparedStatement p = DBConnection.getPreparedStatement("select * from \"user\" where \"user\".email=? ");
            p.setString(1, email);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                //gui lai trang dang ki khi email da ton tai
                request.getSession().setAttribute("thongbao", "Email đã tồn tại!");
                request.getRequestDispatcher("dangky.jsp").forward(request, response);
            } else {
                //tao khách hàng mới
                KhachHang k = new KhachHang(email, pass);
                //them khach hang moi
                if (QuanLiKhachHang.themKhachHangMoi(k)) {
                    //set thong bao
                    String thongbao = "Đã gửi email tới email " + k.getEmail();
                    request.getSession().setAttribute("thongbao", thongbao);
                } else {
                    //set thong bao
                    request.getSession().setAttribute("thongbao", "Đã có lỗi xảy ra!");
                }
                // chuyen ve trang dang ki
                request.getRequestDispatcher("dangky.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}