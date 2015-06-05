<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entertainment Centre</title>
        <script type="text/javascript" src="js/a6.js"></script>
        <link href="css/mystyles.css" media="screen" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="headdiv">
            <a href="index.html"><img src="siteimages/logo.png" alt="logo"></a>
            <div id="ident">
                <p>Entertainment Centre</p>
            </div>
        </div>
        <div id="content">
            <h1><c:out value="${requestScope.prezzo.title}"/></h1>
            <h2><c:out value="${requestScope.prezzo.company}"/></h2>
            <p>On at <c:out value="${requestScope.prezzo.venue}"/></p>
            <p>from <c:out value="${requestScope.prezzo.startseason}"/> to <c:out value="${requestScope.prezzo.endseason}"/></p>
            <br><p><c:out value="${requestScope.prezzo.shortdescription}"/></p>
            <h3>Scheduled Performances</h3>
            <ul>
                <c:forEach var="performance" items="${requestScope.performances}">
                    <fmt:formatDate value="${performance.showdate}" pattern="yyyy-MM-dd" var="datestr"/>
                    <li><p><c:out value="${datestr}"/> : <c:out value="${performance.showtime}"/></p></li>
                    </c:forEach>
            </ul>
            <table>
                <c:forEach var="info" items="${requestScope.infos}">
                    <tr><td><img width="200" src="${info.picy}"/></td><td><c:out value="${info.details}"/></td></tr><br><br>
                        </c:forEach>
            </table>
        </div>
    </body>
</html>
