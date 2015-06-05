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
            <h2>New record added</h2>
            <ul>
                <li><a href="">Schedule another event</a></li>
                <li><a href="AddInfoServlet">Add information to event record</a></li>
            </ul>
        </div>
    </body>
</html>
