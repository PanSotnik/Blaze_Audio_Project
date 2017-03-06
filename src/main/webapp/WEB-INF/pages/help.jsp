<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/help.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class ="logo"><a href="/"><img src="${pageContext.request.contextPath}/resources/Logo.png" alt="BLAZEAUDIO"></a></div>

<div class="header" style="height:60px;border:none;"></div>

<div id="filler" style=border:none;> <a href="/help"><img src="${pageContext.request.contextPath}/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

<div class="window" style="height:400px;width:800px";>

    <h1>Welcome to the quick and easy music storage!</h1>

    <p id="info">BlazeAudio is a library dedicated to music and social functionality. The service currently supports MP3 audio files,
        grouping by genre as well as basic feedback. Uploaded tracks can be made private as well as downloaded if shared by
        other users. Click the button below to create your account!</p>


    <form action="/signup">
        <c:choose>
            <c:when test="${empty login}">
                <button class="signup"><span><img src ="${pageContext.request.contextPath}/resources/flare.png" height="30" width="30">Sign up for BlazeAudio!</span></button>
            </c:when>
            <c:otherwise>
            <p id="thanks">Thank you for already having signed up, ${login}!</p>
            </c:otherwise>
        </c:choose>
    </form>





</div>
</body>
</html>
