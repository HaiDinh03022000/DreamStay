<%-- 
    Document   : login
    Created on : May 21, 2023, 11:20:39 AM
    Author     : win
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--<link href="css/login.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/login2.css" rel="stylesheet" type="text/css"/>
        <link href="css/bodycss.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container ${back}" id="container">
            <div class="form-container sign-up-container">
                <form action="SignUpController" method="post">
                    <h1>Create Account</h1>
                    <!--                    <div class="social-container">
                                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                                            <a href="#" class="social" n><i class="fab fa-linkedin-in"></i></a>
                                        </div>
                                        <span>or use your email for registration</span>-->
                    <input required value="${fname}" name="fname" type="text" placeholder="Full Name " />                
                    <input required value="${user}" name="user" type="text" placeholder="Username" />                   
                    <input required value="${pass}" name="pass" type="password" placeholder="Password" />                    
                    <input required value="${cpass}" name="cpass" type="password" placeholder="Confirm Password" />

                    <div class="sign-up-container-group">
                        <input required value="${email}" class="sign-up-container-phone" name="email" type="email" placeholder="Email" />              
                        <input required value="${age}" class="sign-up-container-age" name="age" type="number" placeholder="Year-B" />
                    </div>
                    <c:if test="${sessionScope.otp != null}">
                        <input required name="otp" type="text" placeholder="Enter OTP code in your Email" />
                    </c:if>

                    <div style="color: red ;font-weight: inherit; font-size: 80%">${check}</div>

                    <button type="submit">Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <a href="index"><button class="but-ton" type="button"><i style="color: black" class="bi bi-arrow-left"></i></button></a>
                <form action="LoginCotroller" method="post">
                    <h1>Sign in</h1>
                    <!--                    <div class="social-container">
                                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                                        </div>-->
                    <!--                    <span>or use your account</span>-->
                    <div style="color: ${color} ;font-weight: inherit; font-size: 80%">${mess}</div>
                    <input name="name" value="${user}" type="text" placeholder="Username" />
                    <input name="pass" value="${pass}" type="password" placeholder="Password" />
                    <div class="checkbox-container-group">
                        <input style="width: 15px; height: 15px;" name="rmb" value="" type="checkbox"> 
                        <p class="checkbox-container-font">Remember</p>
                    </div>
                    <a href="forgetpass.jsp">Forgot your password?</a>
                    <button type="submit">Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signIn">Login In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Willing To Serve</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/login.js" type="text/javascript"></script>

    </body>
</html>
