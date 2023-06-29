<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link href="css/login2.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<div class="container ${back}" id="container">
    <div class="form-container sign-up-container">
        <form action="RePassController" method="post">
            <h1>New Password</h1>
            <div style="color: red ;font-weight: inherit; font-size: 80%">${mes}</div>
            <input type="password" name="pass" value="${pass}" placeholder="New Password" />
            <input type="password" name="cpass" value="${cpass}" placeholder="Confirm Password" />
            <input type="text" name="otp" value="" placeholder="OTP code" />
            <button type="submit">Change</button>
        </form>
    </div>
    <div class="form-container sign-in-container">
        <form action="RePassController">
            <h1 class="re-pass">Recover Password</h1>
            <div style="color: red ;font-weight: inherit; font-size: 80%">${mess}</div>
            <input type="text" name="user" value="${user}" placeholder="Enter your Username" />
            <input type="email" name="email" value="${email}" placeholder="Enter your Email" />
            <button type="submit">Check</button>
        </form>
    </div>
    <div class="overlay-container">
        <div class="overlay">
            <div class="overlay-panel overlay-left">
                <h1>Nearly Done!</h1>
                <p>Just a few more simple steps</p>
                <a href="forgetpass.jsp"><button class="ghost" id="signIn">Back</button></a>
            </div>
            <div class="overlay-panel overlay-right">
                <h1 style="font-size: 150%" >Forget password?</h1>
                <p style="font-size: 100%">We here for help</p>
                <a href="login.jsp"><button class="ghost" id="signIn">Return Login</button></a>
            </div>
        </div>
    </div>
</div>

<script src="js/login.js" type="text/javascript"></script>

</body>
</html>
