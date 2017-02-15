<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload track</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/upload.css"/>" rel="stylesheet">
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

<div id="filler" style=border:none;><a href="/help"><img src="resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

<div class="window_1" style="height:620px;width:500px";>

    <h1>Upload a track to add to the library</h1>

    <c:url value="/newtrack" var="trackUrl"/>
    <form action="${trackUrl}" method="post" enctype="multipart/form-data">
        <div class="titlediv">
            <input class="title" id="title" name="title" type="text" required>
            <label class="titlelabel" for="title">Title:</label>
        </div>

        <div class="artistdiv">
            <input class="artist" id="artist" name="artist" type="text">
            <label class="artistlabel" for="artist">Artist:</label>
        </div>

        <div class="yeardiv">
            <input class="year" id="year" name="year" type="text">
            <label class="yearlabel" for="year">Year:</label>
        </div>

        <div class="selectdiv">
            <select class="genre" id="genre" name="genre" required>
                <option value="blues">Blues</option>
                <option value="classic">Classic</option>
                <option value="country">Country</option>
                <option value="electronic">Electronic</option>
                <option value="hiphop">Hip-Hop</option>
                <option value="jazz">Jazz</option>
                <option value="pop">Pop</option>
                <option value="rap">Rap</option>
                <option value="rock">Rock</option>
                <option value="metal">Metal</option>
            </select>
            <label class="genrelabel" for="genre">Select best applicable genre:</label>
        </div>

        <div class="descriptiondiv">
            <textarea class="description" id="description" name="description" type="text"></textarea>
            <label class="desclabel" for="description">Your short description:</label>
        </div>

        <div class="filediv">
            <input type="file" id="file" class="file" name="multipartFile" required>
            <label class="filelabel" for="file">Your audio file(.mp3)</label>
        </div>

        <div class="checkdiv">
            <input checked type="checkbox" class="private" id="private" name="isPrivate">
            <label class="privatelabel" for="private">Make private?(Only you will have access)</label>
        </div>


        <button class="upload" type="submit"> <img src="resources/flare.png" height="25" width="25" class="flare">Upload</button>

        <c:if test="${exists ne null}">
            <p id="exists">Track already part of the database!</p>
        </c:if>

        <c:if test="${error ne null}">
            <p id="error">An error has occurred during upload. Make sure you have selected an MP3 format file.</p>
        </c:if>

        <c:if test="${success == true}">
            <p id="success">Track uploaded!</p>
        </c:if>

    </form>
</div>

<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script_2.js"/>"></script>
</body>
</html>
