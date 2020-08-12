import model.KhachHang;
import model.QuanLiKhachHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/login")
public class login extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        // dang nhap bang facebook
        if (action.equals("fb")) {

            request.getSession().setAttribute("user", new KhachHang(email, pass));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
//            response.sendRedirect("index.jsp");
        // dang nhap bang gg
        if (action.equals("gg")) {

            request.getSession().setAttribute("user", new KhachHang(email, pass));
            request.getRequestDispatcher("index.jsp").forward(request, response);
//            response.sendRedirect("index.jsp");
        }
        if (action.equals("login")) {
            KhachHang user = QuanLiKhachHang.checkLogin(email, pass);
            if (user.getEmail() != null) {
                request.getSession().setAttribute("user", user);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("thongbao", "Email hoặc mật khẩu không chính xác!");
                request.getRequestDispatcher("dangnhap.jsp").forward(request, response);
            }

        }
        if (action.equals("logout")) {
            request.getSession().setAttribute("user", new KhachHang(null, null));
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}