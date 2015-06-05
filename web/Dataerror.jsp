<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <title>Entertainment Centre</title>
        <script type="text/javascript" src="js/a6.js"></script>
        <link href="css/mystyles.css" media="screen" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="headdiv">
            <a href="index.html"><img src="siteimages/logo.png"></a>
            <div id="ident">
                <p>Entertainment Centre</p>
            </div>
        </div>
        <div id="content">
            <h1>Oooops! Looks like an error occurred!</h1>
            <p><c:out value="${requestScope.error}"/></p>
        </div>
    </body>
</html>
