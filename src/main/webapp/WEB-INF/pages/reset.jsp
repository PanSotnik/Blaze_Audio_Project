<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/reset.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class ="logo"><a href="/"><img src="${pageContext.request.contextPath}/resources/Logo.png" alt="BLAZEAUDIO"></a></div>

<div class="header" style="height:60px;border:none;"></div>

<div id="filler" style=border:none;> <a href="/help"><img src="${pageContext.request.contextPath}/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

<div class="window-reset" style="height: 300px; width: 500px">

    <c:url value="/finalizerestore" var="finalize" />
    <form action="${finalize}" method="POST">

    <label class="greeting">Please enter your new credentials below.</label>

    <div class="elements">
        <input class="pass" id="pass" name="password" type="password" minlength="5" maxlength="15" required>
        <input class="pass" id="confirm" name="newPassword" type="password" minlength="5" maxlength="15" required>

        <label class="passlabel" for="pass">Password:</label>
        <label class="passlabel" for="confirm">Confirm Password:</label>
    </div>

        <div id="divCheckPasswordMatch"></div>

    <button id="send" type="submit">Send</button>

    </form>

</div>

<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script.js"/>"></script>
</body>
</html>