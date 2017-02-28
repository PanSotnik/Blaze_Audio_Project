<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign up to get started</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/newuser.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>
<div class="background"></div>

<div class="content">
    <div class ="logo">
        <img src="${pageContext.request.contextPath}/resources/Logo.png"  alt="BLAZEAUDIO">
    </div>

    <div
            class="header" style="height:60px;border:none;">
    </div>

    <div id="filler" style=border:none;> <a href="/help"><img src="${pageContext.request.contextPath}/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

    <div class="window-register" style="height: 400px; width: 500px;">

        <c:url value="/newuser" var="regUrl"/>
        <form action="${regUrl}" method="post">
            <div id="content-row-1">
                <p>Welcome to the service. Please fill out your profile. Username/Password and email are required.</p>
                <div class="login-group">
                    <input class="login" id="login" name="login" type="text" maxlength="15" required>
                    <label class="labellog" for="login">Username</label>
                </div>
                <div class="pass-group">
                    <input class="pass" id="pass" name="password" type="password" minlength="5" maxlength="15" required>
                    <label class="labelpass" for="pass">Password</label>
                </div>
                <div class="music-group">
                    <input class="music" id="favoriteMusic" name="favoriteMusic" type="text">
                    <label class="labelmusic" for="favoriteMusic">Preferred genre</label>
                </div>
            </div>
            <div id="content-row-2">
                <div class="age-group">
                    <select class="age" id="age" name="age"></select>
                    <label class="labelage" for="age">Age</label>
                </div>
                <div class="email-group">
                    <input class="email" id="email" name="email" type="email" required>
                    <label class="labelemail" for="email">Email address</label>
                </div>
                <div class="gender-group">
                    <select class="gender" id="gender" name="gender">
                        <option value="male">male</option>
                        <option value="female">female</option>
                    </select>
                    <label class="labelgender" for="gender">Gender</label>
                </div>
                <div class="name-group">
                    <input class="name" id="name" name="name" type="text">
                    <label class="labelname" for="name">Your name</label>
                </div>

                <button class="signup" type="submit"><span><img src ="${pageContext.request.contextPath}/resources/flare.png" height="30" width="30">Sign up!</span></button>
            </div>
            <c:if test="${exists ne null}">
                <p id="exists">User already exists or email taken!</p>
            </c:if>
        </form>
    </div>
</div>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script.js"/>"></script>
</body>
</html>