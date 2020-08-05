package vn.edu.nlu.fit.controller;

import vn.edu.nlu.fit.DBConnect.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//import com.mysql.jdbc.PreparedStatement;

@WebServlet("/Login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String username = request.getParameter("username").trim();
            String password = request.getParameter("password").trim();
            String query = "SELECT * from user";
            PreparedStatement ps = DBConnect.getConnection().prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String user = rs.getString("userName");
            String pass = rs.getString("pass");

            if (username.equals(user) && password.equals(pass)) {
                response.sendRedirect("project/index.jsp");
            } else {
                response.sendRedirect("project/dang-nhap.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        protected void doGet (HttpServletRequest request, HttpServletResponse response) throws
        ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            doPost(request, response);

        }
    }