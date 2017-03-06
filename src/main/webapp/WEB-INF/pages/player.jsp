<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tracks - BlazeAudio</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/player.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class ="logo"><a href="/"><img src="${pageContext.request.contextPath}/resources/Logo.png" alt="BLAZEAUDIO"></a></div>

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

<div class="window" style="height:40em;width:70em">


    <ul class="tab">
        <li><a href="javascript:void(0)" id="blues-genre" name="blues" class="tablinks" onclick="openGenre(event, 'Blues')">Blues</a></li>
        <li><a href="javascript:void(0)" id="classic-genre" name="classic" class="tablinks" onclick="openGenre(event, 'Classic')">Classic</a></li>
        <li><a href="javascript:void(0)" id="country-genre" name="country" class="tablinks" onclick="openGenre(event, 'Country')">Country</a></li>
        <li><a href="javascript:void(0)" id="electronic-genre" name="electronic" class="tablinks" onclick="openGenre(event, 'Electronic')">Electronic</a></li>
        <li><a href="javascript:void(0)" id="hiphop-genre" name="hiphop" class="tablinks" onclick="openGenre(event, 'Hiphop')">Hip-hop</a></li>
        <li><a href="javascript:void(0)" id="jazz-genre" name="jazz" class="tablinks" onclick="openGenre(event, 'Jazz')">Jazz</a></li>
        <li><a href="javascript:void(0)" id="pop-genre" name="pop" class="tablinks" onclick="openGenre(event, 'Pop')">Pop</a></li>
        <li><a href="javascript:void(0)" id="rap-genre" name="rap" class="tablinks" onclick="openGenre(event, 'Rap')">Rap</a></li>
        <li><a href="javascript:void(0)" id="rock-genre" name="rock" class="tablinks" onclick="openGenre(event, 'Rock')">Rock</a></li>
        <li><a href="javascript:void(0)" id="metal-genre" name="metal" class="tablinks" onclick="openGenre(event, 'Metal')">Metal</a></li>
    </ul>


    <div id="Blues" class="tabcontent">
        <h3>Blues</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${blues}" var="blues">

            <%--The logic below hides tracks marked as private by others from the current user. At the same time, a user's
            own private tracks are displayed.--%>

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${blues.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${blues.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/blues/${blues.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${blues.artist} - ${blues.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${blues.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${blues.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${blues.year} &#13;&#10; User's info: ${blues.description}</textarea>
                        <label class="by">By: ${blues.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Classic" class="tabcontent">
        <h3>Classic</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${classic}" var="classic">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${classic.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${classic.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/classic/${classic.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${classic.artist} - ${classic.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${classic.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${classic.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${classic.year} &#13;&#10; User's info: ${classic.description}</textarea>
                        <label class="by">By: ${classic.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Country" class="tabcontent">
        <h3>Country</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${country}" var="country">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${country.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${country.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/country/${country.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${country.artist} - ${country.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${country.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${country.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${country.year} &#13;&#10; User's info: ${country.description}</textarea>
                        <label class="by">By: ${country.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Electronic" class="tabcontent">
        <h3>Electronic</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${electronic}" var="electronic">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${electronic.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${electronic.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>


                    <audio controls id="tracks"> <source src="/electronic/${electronic.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${electronic.artist} - ${electronic.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${electronic.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${electronic.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${electronic.year} &#13;&#10; User's info: ${electronic.description}</textarea>
                        <label class="by">By: ${electronic.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Hiphop" class="tabcontent">
        <h3>Hip-hop</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${hiphop}" var="hiphop">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${hiphop.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${hiphop.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/hiphop/${hiphop.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${hiphop.artist} - ${hiphop.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${hiphop.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${hiphop.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${hiphop.year} &#13;&#10; User's info: ${hiphop.description}</textarea>
                        <label class="by">By: ${hiphop.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Jazz" class="tabcontent">
        <h3>Jazz</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${jazz}" var="jazz">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${jazz.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${jazz.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/jazz/${jazz.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${jazz.artist} - ${jazz.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${jazz.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${jazz.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${jazz.year} &#13;&#10; User's info: ${jazz.description}</textarea>
                        <label class="by">By: ${jazz.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Pop" class="tabcontent">
        <h3>Pop</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${pop}" var="pop">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${pop.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${pop.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/pop/${pop.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${pop.artist} - ${pop.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${pop.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${pop.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${pop.year} &#13;&#10; User's info: ${pop.description}</textarea>
                        <label class="by">By: ${pop.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Rap" class="tabcontent">
        <h3>Rap</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${rap}" var="rap">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${rap.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${rap.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/rap/${rap.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${rap.artist} - ${rap.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${rap.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${rap.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${rap.year} &#13;&#10; User's info: ${rap.description}</textarea>
                        <label class="by">By: ${rap.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

    <div id="Rock" class="tabcontent">
        <h3>Rock</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${rock}" var="rock">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${rock.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${rock.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/rock/${rock.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${rock.artist} - ${rock.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${rock.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${rock.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${rock.year} &#13;&#10; User's info: ${rock.description}</textarea>
                        <label class="by">By: ${rock.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>

    </div>

    <div id="Metal" class="tabcontent">
        <h3>Metal</h3>
        <form action="/play">
            <button class="view" type="submit" name="makePrivate" value="yes">Private</button>
            <button class="view" type="submit" name="makePrivate" value="no">All</button>
        </form>
        <label class="buttonlabel">View by:</label>
        <img src="${pageContext.request.contextPath}/resources/repeat.png" class="repeat" onclick="loop()">
        <img src="${pageContext.request.contextPath}/resources/shuffle.png" class="shuffle" id="shuffle" onclick="random()">
        <label class="shufflelabel" for="shuffle">(Random from library)</label>
        <img src="${pageContext.request.contextPath}/resources/stop.png" class="stop" onclick="masterPause()">

        <c:forEach items="${metal}" var="metal">

            <c:set var="privateCheck" value="true"></c:set>
            <c:set var="appUser" value="${metal.userString}"></c:set>
            <c:set var="login" value="${login}"></c:set>

            <c:choose>
                <c:when test="${appUser == login}">
                    <c:set var="isPrivate" value="false"></c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="isPrivate" value="true"></c:set>
                </c:otherwise>
            </c:choose>

            <c:choose>
                <c:when test="${metal.privateString == isPrivate and isPrivate == privateCheck}">

                </c:when>
                <c:otherwise>

                    <audio controls id="tracks"> <source src="/metal/${metal.filename}" type="audio/mp3"> </audio>

                    <div class="elements">
                        <label class="trackinfo">${metal.artist} - ${metal.title}</label>
                        <form action="/increment">
                            <button class="like" type="submit" name="trackName" value="${metal.filename}"><img src="${pageContext.request.contextPath}/resources/like.png">${metal.likes}</button>
                        </form>
                        <button class="desc" onclick="toggleDescription()"><img src="${pageContext.request.contextPath}/resources/diary.png"></button>
                        <textarea class="description" readonly> Year: ${metal.year} &#13;&#10; User's info: ${metal.description}</textarea>
                        <label class="by">By: ${metal.userString}</label>
                    </div>
                </c:otherwise>
            </c:choose>

        </c:forEach>
    </div>

</div>
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<script src="<c:url value="/resources/JS/Script_2.js"/>"></script>
</body>
</html>