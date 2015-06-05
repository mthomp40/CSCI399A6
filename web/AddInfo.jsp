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
            <c:if test="${not empty loggedin}">
                <div id="loggedin">
                    <h2>Logged in</h2>
                    <p>Currently logged in as <c:out value="${requestScope.loggedin}"/>.&nbsp<a href="LogoutServlet">Logout</a></p></div>
                </c:if>
            <h1 align="center">Add details to show</h1>
            <c:if test="${not empty showid}">
                <p>Records added to <c:out value="${requestScope.showid}"/></p>
            </c:if>
            <form method="POST" action="">
                <fieldset>
                    <legend>Show</legend>
                    Show identifier &nbsp&nbsp<input type="text" id="identifier" name="identifier" value size="32" required="1">
                </fieldset>
                <br><fieldset>
                    <legend>Supplementary Data</legend>
                    <table id="droppertable" border="1">
                        <tr><th>Picture</th><th>Comment</th></tr>
                    </table><br>
                    <input type="button" value="Add data" onclick="addData()"><br>
                </fieldset><br>
                <fieldset>
                    <legend>Action</legend>
                    <input type="submit" name="submit" value="Add details"><br>
                </fieldset><br>
            </form>
        </div>
    </body>
</html>