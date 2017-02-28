<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User profile</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/cabinet.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class ="logo"><img src="${pageContext.request.contextPath}/resources/Logo.png"  alt="BLAZEAUDIO"></div>

<div class="header" style="height:60px;border:none;"><a href="/play"><img src="${pageContext.request.contextPath}/resources/play.png" height="50" width="50" id="play"></a><a href="/upload"><img src="${pageContext.request.contextPath}/resources/upload.png" height="50" width="50" id="up"></a>

    <div class="dropdown">
        <label onclick="dropdown()" class="hello">Hello, ${login}</label>
        <div id="myDropdown" class="dropdown-content">
            <a href="/">My profile</a>
            <a href="/logout_control">Logout</a>
        </div>
    </div>

</div>


<div id="filler" style=border:none;> <a href="/help"><img src="${pageContext.request.contextPath}/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

<div class="window_1" style="height:600px;width:500px";>

    <a id="user">${login}</a>

    <h1 id="h1">Name:</h1>
    <div class="name" id="name">${name}</div>

    <h5 id="h5">Email:</h5>
    <div class="email" id="email">${email}</div>

    <h2 id="h2">Age:</h2>
    <div class="age" id="age">${age}</div>

    <h3 id="h3">Gender:</h3>
    <div class="gender" id="gender">${gender}</div>

    <h4 id="h4">Your favorite genre:</h4>
    <div class="genre" id="genre">${music}</div>

    <form action="/edit">
        <button class="edit" name="edit">Edit</button>
    </form>


</div>


<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script_2.js"/>"></script>
</body>
</html>