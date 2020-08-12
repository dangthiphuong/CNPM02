<%@ page import="model.KhachHang" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%
// lay user
    KhachHang k = new KhachHang(null,null);
    //neu user khac null
    if (request.getSession().getAttribute("user") != null) {
        k = (KhachHang) request.getSession().getAttribute("user");
    }
%>

<head>
    <title>Trang Chủ</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            background-image: url("images/bg_1.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Thế Giới Rau Sạch</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span
                    class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">Page 1-1</a></li>
                    <li><a href="#">Page 1-2</a></li>
                    <li><a href="#">Page 1-3</a></li>
                </ul>
            </li>
            <li><a href="#">Page 2</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <%--            Lay email cua tai khoan--%>
            <li><a href="<%=(k.getEmail()==null)?"dangky.jsp":""%>" id="dangky"><span
                    class="glyphicon glyphicon-user"></span><%=(k.getEmail() == null) ? "Đăng ký" : k.getEmail()%>
            </a></li>
            <%--    chuyen thanh nut dang xuat--%>
            <li><a href="<%=(k.getEmail()==null)?"dangnhap.jsp":"login?action=logout"%>" id="dangnhap"><span
                    class="glyphicon glyphicon-log-in"></span><%=(k.getEmail() == null) ? " Đăng nhập" : " Đăng xuất"%>
            </a></li>
        </ul>
    </div>
</nav>

<div class="container">
    <h3>Right Aligned Navbar</h3>
    <p>The .navbar-right class is used to right-align navigation bar buttons.</p>
</div>

</body>
</html>
