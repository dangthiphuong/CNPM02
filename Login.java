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


@WebServlet("/Login")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String username = request.getParameter("usernames").trim();
            System.out.println(username);
            String password = request.getParameter("passwords").trim();
            System.out.println(password);
            String query = "SELECT * from user";
            PreparedStatement ps = (PreparedStatement) DBConnect.connect().executeQuery(query);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String user = rs.getString("username");
            System.out.println(user);
            String passs = rs.getString("pass");
            System.out.println(passs);
            if (username.equals(user) && password.equals(passs)) {
                System.out.println("yes");
                response.sendRedirect("project/index.jsp");
            } else {
                System.out.println("no");
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