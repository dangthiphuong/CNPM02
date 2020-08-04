package vn.edu.nlu.fit.controller;


import vn.edu.nlu.fit.model.User;
import vn.edu.nlu.fit.view.LoginDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Random;

@WebServlet("/LoginU")
public class LoginU extends HttpServlet {
    int count = 0;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("usernames");
        String password = request.getParameter("passwords");
        String action = request.getParameter("action");
        String captcha = request.getParameter("captcha");
        String recaptcha = request.getParameter("re-captcha");
        User user;
        HttpSession ss = request.getSession();
        String err = null;
        Random rd = new Random();
        if(action.equals("login")){
            user = LoginDAO.checkLogin(username, password);
            System.out.println(recaptcha);
            if (user.getUsername()!=null && user.getPassword()!=null){
                if(recaptcha == null){
                    ss.setAttribute("user", user);
                    response.sendRedirect("project/index.jsp");
                } else  if(captcha.equals(recaptcha)) {
                    ss.setAttribute("user", user);
                    response.sendRedirect("project/index.jsp");
                } else if(!captcha.equals(recaptcha)) {
                    err = ""+ rd.nextInt(100000);
                    ss.setAttribute("err", err);
                    response.sendRedirect("project/dang-nhap.jsp");
                }
            }else {
                count++;
                System.out.println(count);
                if(count<3){
                    err = "Tên đăng nhập sai hoặc mật khẩu không đúng";
                    ss.setAttribute("err", err);
                } else  {
                    err = ""+ rd.nextInt(100000);
                    ss.setAttribute("err", err);
                }
                response.sendRedirect("project/dang-nhap.jsp");
            }
        } else if(action.equals("logout")) {
            HttpSession hs = request.getSession();
            hs.removeAttribute("user");
            hs.removeAttribute("err");
            response.sendRedirect("project/index.jsp");
        }
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doPost(request,response);
    }
}
