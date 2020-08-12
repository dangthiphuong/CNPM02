<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Đăng ký</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
    <%--    api google--%>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="611003985226-a2mst0e4afqhqqikfb1s9ln1h8v9718q.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
<body style="background-color: #666666;">
<%--Thiet lap google--%>
<script>
    function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        var email = profile.getEmail();
        var pass = profile.getId();
        var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
        });
        window.location.href = 'login?action=gg&email=' + email + '&pass=' + pass;
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
    }
</script>
<%--Thiêt lập SDK facebook--%>
<script>
    // kiem tra trang thai cua fb
    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        } else {                                 // Not logged into your webpage or we are unable to tell.
        }
    }

    //kiemtra dang nhap
    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function (response) {   // See the onlogin handler
            statusChangeCallback(response);
            FB.api('/me', {fields: ' name, email'}, function (response) {
                console.log(response);
                window.location.href = 'login?action=fb&email=' + response.email + '&pass=' + response.id;
            });
        });
    }


    window.fbAsyncInit = function () {
        FB.init({
            appId: '308950657084841',
            cookie: true,                     // Enable cookies to allow the server to access the session.
            xfbml: true,                     // Parse social plugins on this webpage.
            version: 'v8.0'           // Use this Graph API version for this call.
        });


        FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.

        });
    };
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

    // test api
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function (response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }
</script>
<%--    end--%>
<div class="limiter">

    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form" action="/register" onsubmit="return validate();">
					<span class="login100-form-title p-b-43">
						Đăng Ký
					</span>
                <%--    thong bao--%>
                <%
                    String thongbao = "";
                    if (request.getSession().getAttribute("thongbao") != null) {
                        thongbao = (String) request.getSession().getAttribute("thongbao");
                    }
                %>
                <input type="text" id="thongbao" style="float: right;width: 100%" disabled
                       value="<%=thongbao%>">

                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="email" name="email" id="email">
                    <span class="focus-input100"></span>
                    <span class="label-input100">Email</span>
                </div>


                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" name="pass" id="pass" value="">
                    <span class="focus-input100"></span>
                    <span class="label-input100">Mật khẩu</span>
                </div>
                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" name="repass" id="repass" value="">
                    <span class="focus-input100"></span>
                    <span class="label-input100">Nhập lại mật khẩu</span>
                </div>

                <div class="flex-sb-m w-full p-t-3 p-b-32">
                    <div class="contact100-form-checkbox">
                        <div>
                            <a href="dangnhap.jsp" class="txt1">
                                Đăng nhập
                            </a>
                        </div>
                    </div>

                    <div>
                        <a href="quenmatkhau.jsp" class="txt1">
                            Quên mật khẩu?
                        </a>
                    </div>
                </div>


                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" type="submit">
                        Đăng ký
                    </button>
                </div>

                <div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							hoặc
						</span>
                </div>

                <div class="login100-form-social flex-c-m">
                    <div><fb:login-button
                            scope="public_profile,email"
                            onlogin="checkLoginState();">
                    </fb:login-button></div>
                    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
                </div>
            </form>

            <div class="login100-more" style="background-image: url('images/bg-01.jpg');">
            </div>
        </div>
    </div>
</div>

<script>
    // kiem tra hop le cua ca truong nhap vao
    function validate() {
        console.log(document.getElementById('pass').value);
        console.log(document.getElementById('repass').value);
        // kiem tra khop mat khau
        if (document.getElementById('pass').value === document.getElementById('repass').value) {
        } else {
            alert("Mật khẩu không khớp");
            return false;
        }
        var regex = /(?=^.{8,16}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/
        // kiem tra mat khau bao gom chu cai, so
        if (document.getElementById('pass').value.match(regex)) {
        } else {
            alert("Mật khẩu từ 8 - 16 kí tự bao gồm chữ hoa, thường, số!");
            return false;
        }
        return true;
    }
</script>
<script>
    // lay thong bao
    // if (document.getElementById("thongbao").value==null) {
    // } else {
    //     alert(document.getElementById("thongbao").value);
    // }
</script>
<!--===============================================================================================-->
<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="js/main.js"></script>

</body>
</html>