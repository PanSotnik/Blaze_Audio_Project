<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login to BlazeAudio</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/login.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class ="logo"><img src="/resources/Logo.png"  alt="BLAZEAUDIO"></div>

<div class="header" style="height:60px;border:none;"></div>

<div id="filler" style=border:none;> <a href="/help"><img src="/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>


    <div class="window_1" style="height:400px;width:300px";>

        <form action="/signup">
        <button class="signup"><span><img src ="/resources/flare.png" height="30" width="30">Sign up for BlazeAudio!</span></button>
        </form>

        <p>---Or log in to your account---</p>

        <c:url value="/j_spring_security_check" var="loginUrl" />
        <form action="${loginUrl}" method="POST">
        <div class="login-group">
            <label for="login">Login:</label>
            <input class="login" id="login" name="j_login" type="text" required>
        </div>
        <div class="pass-group">
            <label class="labelpass" for="password">Pass:</label>
            <input class="password" id="password" name="j_password" type="password" required>
        </div>
        <div class="imput-group">
            <div id="rememberbox">
                <input type="checkbox" id="rememberme" name="remember-me">
                <label id="checklabel" for="rememberme">Remember me:</label>
            </div>
            <input type="submit" class="submitbtn" style="width:100px;height:30px;" value="Sign in">
        </div>

        <a href="/restore" class="forgot">Restore password</a>

            <c:if test="${param.error ne null or wrong == true}">
                <p class="error">User credentials incorrect!</p>
            </c:if>

            <c:if test="${success == true}">
                <p class="success">You are now ready to log in!</p>
            </c:if>

        </form>
    </div>


<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script.js"/>"></script>
</body>
</html>