<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <title>Login V18</title>
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
    <!--======================================A=========================================================-->
    <%--    api google--%>
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id"
          content="611003985226-a2mst0e4afqhqqikfb1s9ln1h8v9718q.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
</head>
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
        window.location.href = 'login?action=gg&email=' + profile.getEmail() + '&pass=' + profile.getId();
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);

    }
</script>

<%--Thiêt lập SDK facebook--%>
<script>

    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        } else {                                 // Not logged into your webpage or we are unable to tell.
        }
    }


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
<body style="background-color: #666666;">

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form action="/login" class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						Đăng nhập
					</span>
                <%--    thong bao--%>
                <%
                    String thongbao = "";
                    if (request.getAttribute("thongbao") != null) {
                        thongbao = (String) request.getAttribute("thongbao");
                    }
                %>
                <input type="text" id="thongbao" style="float: right;width: 100%" disabled
                       value="<%=thongbao%>">
                <input type="text" name="action" value="login" style="display: none">
                <div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
                    <input class="input100" type="text" name="email">
                    <span class="focus-input100"></span>
                    <span class="label-input100">Email</span>
                </div>


                <div class="wrap-input100 validate-input" data-validate="Password is required">
                    <input class="input100" type="password" name="pass">
                    <span class="focus-input100"></span>
                    <span class="label-input100">Mật Khẩu</span>
                </div>

                <div class="flex-sb-m w-full p-t-3 p-b-32">
                    <div>
                        <a href="dangky.jsp" class="txt1">
                            Đăng ký
                        </a>
                    </div>

                    <div>
                        <a href="quenmatkhau.jsp" class="txt1">
                            Quên mật khẩu?
                        </a>
                    </div>
                </div>

                <div class="container-login100-form-btn">
                    <button id="submit" type="submit" class="login100-form-btn">
                        Đăng nhập
                    </button>
                </div>

                <div class="text-center p-t-46 p-b-20">
						<span class="txt2">
							hoặc
						</span>
                </div>

                <div class="login100-form-social flex-c-m">
                    <div>
                        <fb:login-button
                                scope="public_profile,email"
                                onlogin="checkLoginState();"></div>
                    </fb:login-button>
                    <div class="g-signin2" data-onsuccess="onSignIn" onclick="" data-theme="dark"></div>
                </div>
            </form>

            <div class="login100-more" style="background-image: url('images/bg-01.jpg');">
            </div>
        </div>
    </div>
</div>


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