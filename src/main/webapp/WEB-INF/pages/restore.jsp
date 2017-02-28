<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Restore Password</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
    <link href="<c:url value="/resources/CSS/restore.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/favicon.png"/>" rel="shortcut icon" type="image/png">
</head>
<body>

<div class="background"></div>

<div class="content">

    <div class ="logo">
        <img src="${pageContext.request.contextPath}/resources/Logo.png"  alt="BLAZEAUDIO">
    </div>

    <div class="header" style="height:60px;border:none;"></div>

    <div id="filler" style=border:none;> <a href="/help"><img src="${pageContext.request.contextPath}/resources/Help.png" class="helpicon" width="50" height="50" alt="Help"></a></div>

    <div class="window-restore" style="height: 130px; width: 500px">

        <c:url value="/resetpassword" var="reset" />
        <form action="${reset}" method="POST">

        <a id="label">Enter your account email below. Please allow a few minutes and check spam/bulk folders.</a>
        <input class="email" name="email" type="email" required>

        <button class="send" type="submit">Send</button>

            <c:if test="${success == true}">
                <p id="success">Message sent!</p>
            </c:if>
            <c:if test="${success == false}">
                <p id="failure">Indicated address not found!</p>
            </c:if>

        </form>

    </div>
</div>


</body>
</html>
