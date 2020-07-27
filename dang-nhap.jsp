<%@ page import="libs.Util" %>
<!DOCTYPE html>
<html lang="vn">


<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Đăng ký thành viên</title>
    <meta http-equiv="refresh" content="5400"/>
    <meta property=fb:app_id
          content="782914695784473">

    <link href="assets/dist/base_libs.mind28d.css?v=1.8" rel="stylesheet"/>
    <link href="assets/dist/base.min4003.css?v=8.2" rel="stylesheet"/>

    <!-- my file css -->
    <link href="300-up-5019/assets/dist/libs.minf9e3.css?v=1.1" rel="stylesheet"/>
    <link href="300-up-5019/assets/dist/main.min2048.css?v=1.5" rel="stylesheet"/>
</head>

<body>
<%--load các thành phần cần thiết--%>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '617733695546668',
            cookie: true,
            xfbml: true,
            version: 'v7.0'
        });

        FB.AppEvents.logPageView();
        // kiểm tra trạng thái hiện tại
        FB.getLoginStatus(function (response) {
            statusChangeCallback(response);
        });
    };

    function statusChangeCallback(response) {
        if (response.status === 'connected') {
            alert("Bạn đăng nhập thành công!!!!!");
        } else {
            alert("Bạn chưa đăng nhập!!!!!");
        }
    }

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {
            return;
        }
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    function LoginFB() {
        window.location = 'https://www.facebook.com/v7.0/dialog/oauth?app_id=617733695546668&amp;state=83e0b5fc33871fdd9d89e31ed21b11d6&amp;response_type=code&amp;sdk=php-sdk-5.6.0&amp;redirect_uri=https%3A%2F%2Fdemo5019.web30s.vn%2Ffacebook-callback&amp;scope=email" class="btn-facebook"';
    }
</script>
<body>

<div class="cbp-spmenu-push page page-id-6 home-style1">

    <div class="header not_home">
        <div class="container">
            <div class="header-top">
                <%--logo--%>
                <div class="logo">
                    <a href="index.jsp">
                        <img alt='Thế giới rau sạch'
                             class='img_logo'
                             src='datafiles/26447/upload/images/logo33f0.png?t=1566196547'>
                    </a>
                </div>
                <%--end logo--%>
                <%--Menu trên góc phải màn hình--%>

                <div class="search-in">
                    <div class="header-grid">
                        <ul>
                            <li class="in-up">
                                <a href="tel:19009477">
                                    <i class="fa fa-volume-control-phone" aria-hidden="true"></i>
                                    <span class="hidden_mobile"> 19009477</span>
                                </a>
                            </li>
                            <li class="in-up">
                                <a href="mailto:admin@demo5019.web30s.vn">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <span class="hidden_mobile"> admin@demo5019.web30s.vn </span>
                                </a>
                            </li>
                            <li class="account_show">
                                <a href='#' class=''>
                                    <i class="fa fa-user-o" aria-hidden="true"></i>
                                    <span class="hidden_mobile">
                                        Tài khoản của tôi
                                </span>
                                </a>
                                <div class="box_account">
                                    <ul class="account">
                                        <li>
                                            <a href="dang-ky.html">
                                                Đăng ký
                                            </a>
                                        </li>
                                        <li>
                                            <a href="dang-nhap.jsp">
                                                Đăng nhập
                                            </a>
                                        </li>

                                        <li>
                                            <a href="dang-nhap.jsp">
                                                Danh sách yêu thích
                                            </a>
                                        </li>
                                        <li>
                                            <a href="compare.html">
                                                Danh sách so sánh
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="account_show">
                                <a class="border_r_none" href='#' class=''>
                                    <i class="fa fa-language" aria-hidden="true"></i>
                                    <span class="hidden_mobile"> Ngôn ngữ </span>
                                </a>
                                <div class="box_account">
                                    <ul>

                                        <li>
                                            <a href='indexa41a.html?lang=gb'>
                                                English
                                            </a>
                                        </li>
                                        <li>
                                            <a href='indexadee.html?lang=vn'>
                                                Tiếng Việt
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <%--End menu trên--%>
                    <%--tìm kiếm và giỏ hàng--%>
                    <div class="content-cart">
                        <div class="cart">
                            <a href="cart.html" class="cart-in"> </a>
                            <span class="cart-quantity w30s-cart-quantity-mini ">0</span>
                        </div>
                        <div class="search-top">
                            <div class="search-container">
                                <div class="search">
                                    <form action="https://demo5019.web30s.vn/san-pham">
                                        <input type="text"
                                               class="key_timkiem w30w-form-search"
                                               value=""
                                               placeholder="Từ khóa tìm kiếm"
                                               name="keyword" required/>
                                        <input class="" type="submit" value="">
                                    </form>
                                </div>
                                <p class="keyword-empty-error">Chưa nhập từ khóa tìm kiếm</p>
                            </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <%--end--%>
        <%--Menu--%>
        <div class="header-bottom-bottom">
            <div class="container">
                <div class="top-nav menu_desktop" id="menu">
                    <span class="menu"> </span>

                    <div class="w30s__desktop_menu">
                        <ul>
                            <li class=" ">
                                <a href="index.jsp">Trang chủ</a>
                            </li>
                            <li class=" ">
                                <a href="gioi-thieu.html">Giới thiệu</a>
                            </li>
                            <li class=" has_lv1 has_child">
                                <a href="san-pham.html">Sản phẩm</a>
                                <ul class="menu_lv1 menu_child">
                                    <li class="has_lv2 has_child">
                                        <a href="hoa-qua.html">Hoa quả</a>
                                        <ul class="menu_lv2 menu_child">
                                            <li class="">
                                                <a href="hoa-qua-say-kho.html">Hoa quả sấy khô</a>
                                            </li>
                                            <li class="">
                                                <a href="hoa-qua-viet-nam.html">Hoa quả Việt Nam</a>
                                            </li>
                                            <li class="">
                                                <a href="hoa-qua-nhap-khau.html">Hoa quả nhập khẩu</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="">
                                        <a href="nam-sach.html">Nấm sạch</a>
                                    </li>
                                    <li class="has_lv2 has_child">
                                        <a href="rau-sach.html">Rau sạch</a>
                                        <ul class="menu_lv2 menu_child">
                                            <li class="has_lv3 has_child">
                                                <a href="rau-sach-da-lat.html">Rau sạch Đà Lạt</a>
                                                <ul class="menu_lv3 menu_child">
                                                    <li>
                                                        <a href="rau-huu-co.html">Rau hữu cơ</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class=" ">
                                <a href="mo-hinh-xanh.html">Mô hình xanh</a>
                            </li>
                            <li class=" has_lv1 has_child">
                                <a href="tin-tuc.html">Tin tức</a>
                                <ul class="menu_lv1 menu_child">
                                    <li class="">
                                        <a href="chuyen-nha-nong.html">Chuyện nhà nông</a>
                                    </li>
                                    <li class="has_lv2 has_child">
                                        <a href="tin-nong-nghiep.html">Tin nông nghiệp</a>
                                        <ul class="menu_lv2 menu_child">
                                            <li class="">
                                                <a href="kien-thuc-nong-nghiep.html">Kiến thức nông nghiệp</a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li class=" ">
                                <a href="lien-he.html">Liên hệ</a>
                            </li>
                        </ul>
                    </div>

                </div>
                <%--form đăng nhập--%>
                <div class="conten">
                    <article>
                        <section class="content gallery pad1" style="padding:0">
                            <div class="midle_main_idclass fix1200_cus1">
                                <div class="main">
                                    <div class="about-team">
                                        <div class="container">
                                            <ul class="breadcrumb">
                                                <li>
                                                    <a href="index.jsp">Trang chủ</a>
                                                </li>
                                                <li>
                                                    <span>Đăng nhập</span>
                                                </li>
                                            </ul>
                                            <div class="box_register box_login form_container">
                                                <h1 class="title">Đăng nhập</h1>

                                                <form class="form_register" action="<%=Util.fullPath("Login")%>">
                                                    <input name='source' type='hidden' value=''/>
                                                    <input name='sourceid' type='hidden' value=''/>
                                                    <div class="row">
                                                        <div class="col-md-12 col-xs-12">
                                                            <div class="group_input">
                                                                <label class="icon "><i class="fa fa-user-o"
                                                                                        aria-hidden="true"></i></label>
                                                                <input name='usernames'
                                                                       required
                                                                       placeholder="Tên truy cập"
                                                                       onfocus="this.placeholder=''"
                                                                       onblur="this.placeholder='Tên truy cập'"
                                                                       value=''
                                                                       class="input_text"/>
                                                            </div>
                                                            <div class="group_input">
                                                                <label class="icon "><i class="fa fa-unlock-alt "
                                                                                        aria-hidden="true"></i></label>
                                                                <input name="passwords"
                                                                       required
                                                                       placeholder="Mật khẩu"
                                                                       onfocus="this.placeholder=''"
                                                                       onblur="this.placeholder='Mật khẩu'"
                                                                       value='' type='password'
                                                                       class="input_text"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <ul class="ls_btn_submit">
                                                        <li><input type="submit" name="" value="Đăng nhập"></li>
                                                        <li><a href="member/lost-password.html">Quên mật khẩu</a></li>
                                                    </ul>
                                                </form>

                                                <p class="orther"></p>
                                                <ul class="login-fb">
                                                    <li class="link-login-fb">
                                                        <i class="fa fa-facebook icon-lg-fb"></i>
                                                        <a onclick="LoginFB()">
                                                            Facebook
                                                        </a>
                                                    </li>

                                                    <li class="link-login-gg">
                                                        <i class="fa fa-google icon-lg-gg"></i>
                                                        <a href="https://accounts.google.com/o/oauth2/auth?response_type=code&amp;access_type=online&amp;client_id=api-demo-google-asdadasdasd1213adasads&amp;redirect_uri=https%3A%2F%2Fdemo5019.web30s.vn%2Fgoogle-callback&amp;state&amp;scope=profile%20email%20openid%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fplus.me%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive.metadata.readonly&amp;approval_prompt=auto"
                                                           class="btn-google">
                                                            Google
                                                        </a>
                                                    </li>

                                                    <li class="link-login-zalo">
                                                        <i class="zalo_login">Z </i>
                                                        <a href="https://oauth.zaloapp.com/v3/auth?app_id=279362962217881061&amp;redirect_uri=https%3A%2F%2Fdemo5019.web30s.vn%2Fzalo-callback"
                                                           class="btn-zalo">
                                                            Zalo
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="clearfix"></div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </article>
                </div>
                <%--footer--%>
                <div class="footer-copy">
                    <div class="container">
                        <div class="footer-copy-grids">


                            <div class="row w30s__row four w30s__footer">
                                <div class="col">
                                    <div class="w30s-footer-title  w30s-title-left ">
                                        <h3>THẾ GIỚI RAU SẠCH</h3>
                                    </div>

                                    <div class="w30s-footer-block  w30s-content-left " style='margin-bottom: 0px'>
                                        <div class="w30s-footer-text">
                                            <p>H&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để nhận được những tư
                                                vấn.</p>

                                            <p>Địa chỉ: <span style="color:#f39c12;">196</span><span
                                                    style="color:#ff9900;">&nbsp;Nguyễn Đ&igrave;nh Chiểu , Phường 6, Quận 3, Tp. Hồ Ch&iacute; Minh, Việt Nam</span>
                                            </p>

                                            <p>Điện thoại: <span style="color:#ff9900;">028 62563737</span></p>

                                            <p>Email: web@pavietnam.vn</p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="w30s-footer-title  w30s-title-left ">
                                        <h3>THÔNG TIN THÊM</h3>
                                    </div>

                                    <div class="w30s-footer-block  w30s-content-left " style='margin-bottom: 0px'>
                                        <div class="w30s-footer-list">
                                            <ul>
                                                <li>
                                                    <a href="tuyen-dung.html"
                                                    >Tuyển dụng</a>
                                                </li>
                                                <li>
                                                    <a href="lien-he.html"
                                                    >Liên hệ</a>
                                                </li>
                                                <li>
                                                    <a href="mo-hinh-xanh.html"
                                                    >Mô hình xanh</a>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                    <div class="w30s-footer-block  w30s-content-left " style='margin-bottom: 0px'>
                                        <div class="w30s-footer-list">
                                            <ul>
                                                <li>

                                                    <a href="kien-thuc-nong-nghiep.html"
                                                    >Kiến thức nông nghiệp</a>
                                                </li>
                                            </ul>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="w30s-footer-title  w30s-title-left ">
                                        <h3>FANPAGE</h3>
                                    </div>

                                    <div class="w30s-footer-block  w30s-content-left " style='margin-bottom: 0px'>
                                        <div class="w30s-footer-text">
                                            <p><a href="https://www.facebook.com/pavietnam.com.vn/" target="_blank"><img
                                                    alt=""
                                                    src="datafiles/26447/upload/images/fanpage.png"
                                                    style="width: 255px; height: 218px;"/></a>
                                            </p>

                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="w30s-footer-title  w30s-title-left ">
                                        <h3>ĐĂNG KÝ NHẬN TIN</h3>
                                    </div>

                                    <div class="w30s-footer-block  w30s-content-left " style='margin-bottom: 0px'>
                                        <p>
                                            Đăng ký email để nhận thông tin khuyến mãi mới nhất từ chúng tôi!
                                        </p>
                                        <form method="post" class="newsletter">
                                            <input class="w30s__newsletter-email email" name="email" type="email"
                                                   placeholder="Nhập email" required>
                                            <button class="btn1 w30s__newsletter-btn">Đăng ký</button>
                                        </form>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--footer-->
                <div class="footer">
                    <div class="container">


                        <section class="w30s__row two w30s__footer w30s-end-footer">
                            <div class="col">
                                <div class="w30s-footer-title  w30s-title-center ">
                                    <h3 class="follow">Lượt truy cập</h3>
                                </div>
                                <div class="w30s-footer-block  w30s-content-center " style='margin-bottom: 0px'>
                                    <div class="w30s-footer-statistic">
                                        <ul>
                                            <li class="all_date"><span>Tổng truy cập</span>
                                                <span>9,912</span></li>
                                            <li class="in_month"><span>Tháng qua</span>
                                                <span>73</span></li>
                                            <li class="on_week"><span>Tuần qua</span>
                                                <span>73</span></li>
                                            <li class="on_date"><span>Hôm nay</span>
                                                <span>28</span></li>
                                            <li class="count"><span>Đang online</span>
                                                <span>5</span></li>
                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>

                                </div>
                            </div>
                            <div class="col">
                                <div class="w30s-footer-block  w30s-content-right " style='margin-bottom: 0px'>
                                    <div class="w30s-footer-social-link">
                                        <div class="footer-social fix">
                                            <a href="https://www.facebook.com/pavietnam.com.vn/" target="_blank">
                                                <i class="fa fa-facebook-f"></i>
                                            </a>
                                            <a href="index.jsp" target="_blank">
                                                <i class="fa fa-zalo"></i>
                                            </a>
                                            <a href="https://www.youtube.com/c/PAVietNamLtd" target="_blank">
                                                <i class="fa fa-youtube-play"></i>
                                            </a>
                                            <a href="https://twitter.com/wwwpavietnamcom" target="_blank">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                            <a href="index.jsp" target="_blank">
                                                <i class="fa fa-pinterest-p"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="w30s-footer-coppy-right">
                                    <a class="coppy-right-pa" target="_blank" href="https://web30s.vn/"
                                       title="Thiết Kế Website bởi P.A Việt Nam">
                                        Thiết Kế Website bởi P.A Việt Nam
                                        <img src="assets/images/logo_web30s_footer.png" alt="Web30s.vn"/>
                                    </a>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
                <%--end footer--%>
                <%--icon hotline--%>
                <div class="w30s__icon-hotline">
                    <a href="tel:0939981635"
                       class="w30s-mobile-phone "
                       title="Hotline: 0939981635">
                        <div class="w30s-circle"></div>
                        <div class="w30s-circle-fill"></div>
                        <div class="w30s-icon-circle"></div>
                    </a>
                </div>
                <style type="text/css">
                    .w30s__icon-hotline .w30s-mobile-phone .w30s-icon-circle,
                    .w30s__icon-hotline .w30s-mobile-phone .w30s-circle-fill {
                        background-color: #ff5500;
                    }

                    .w30s__icon-hotline .w30s-mobile-phone .w30s-circle {
                        border-color: #ff5500
                    }

                    .w30s__icon-hotline .w30s-mobile-phone:hover .w30s-icon-circle,
                    .w30s__icon-hotline .w30s-mobile-phone:hover .w30s-circle-fill {
                        background-color: #00ff22;
                    }

                    .w30s__icon-hotline .w30s-mobile-phone:hover .w30s-circle {
                        border-color: #00ff22
                    }
                </style>
</body>

</html>
