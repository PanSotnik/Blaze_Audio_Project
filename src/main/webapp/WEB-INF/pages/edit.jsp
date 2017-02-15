<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User profile</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/edit.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class ="logo"><img src="resources/Logo.png"  alt="BLAZEAUDIO"></div>

<div class="header" style="height:60px;border:none;"><a href="/play"><img src="/resources/play.png" height="50" width="50" id="play"></a><a href="/upload"><img src="/resources/upload.png" height="50" width="50" id="up"></a>

    <div class="dropdown">
        <label onclick="dropdown()" class="hello">Hello, ${login}</label>
        <div id="myDropdown" class="dropdown-content">
            <a href="/">My profile</a>
            <a href="/logout_control">Logout</a>
        </div>
    </div>

</div>

<div id="filler" style=border:none;> <a href="/help"><img src="/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

<div class="window" style="height:700px;width:500px";>

    <c:url value="/update" var="updateUrl" />
    <form action="${updateUrl}" method="POST">

        <h1 id="h1">Name:</h1>
        <input class="name" id="name" name="name" type="text" value="${name}">

        <h5 id="h5">Email:</h5>
        <input class="email" id="email" name="email" type="email" value="${email}">

        <h2 id="h2">Age:</h2>
        <input class="age" id="age" name="age" type="text" value="${age}">

        <h3 id="h3">Gender:</h3>
        <select class="gender" id="gender" name="gender">
            <option value="male">male</option>
            <option value="female">female</option>
        </select>

        <h4 id="h4">Your favorite genre:</h4>
        <input class="genre" id="genre" name="genre" type="text" value="${music}">

        <input type="submit" class="edit" value="Update">

    </form>


</div>





<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script_2.js"/>"></script>
</body>
</html>