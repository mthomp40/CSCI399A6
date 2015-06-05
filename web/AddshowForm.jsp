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
        <c:if test="${not empty loggedin}">
            <div id="loggedin">
                <h2>Logged in</h2>
                <p>Currently logged in as <c:out value="${requestScope.loggedin}"/>.&nbsp<a href="LogoutServlet">Logout</a></p></div>
            </c:if>
        <div id="content">
            <h1 align="center">Create new show record</h1>
            <form method="POST" action="">
                <fieldset>
                    <legend>Add a show</legend>
                    Show identifier <br>&nbsp&nbsp&nbsp&nbsp
                    <input type="text" id="identifier" name="identifier" value size="32" required="1">
                    <br>Title <br>&nbsp&nbsp&nbsp&nbsp
                    <input type="text" id="title" name="title" value size="50" required="1">
                    <br>Type <br>&nbsp&nbsp&nbsp&nbsp
                    <select name="type" id="type">
                        <option value="Drama" label="Drama">Drama</option>
                        <option value="Film" label="Film">Film</option>
                        <option value="Opera" label="Opera">Opera</option>
                        <option value="Jazz" label="Jazz">Jazz</option>
                        <option value="World Music" label="World Music">World Music</option>
                        <option value="Ballet" label="Ballet">Ballet</option>
                        <option value="Recital" label="Recital">Recital</option>
                        <option value="Concert" label="Concert">Concert</option>
                        <option value="Choral" label="Choral">Choral</option>
                        <option value="Contemporary Dance" label="Contemporary Dance">Contemporary Dance</option>
                        <option value="Comedy" label="Comedy">Comedy</option>
                        <option value="Children" label="Children">Children</option>
                    </select><br>
                    Venue <br>&nbsp&nbsp&nbsp&nbsp
                    <select name="venue" id="venue">
                        <option value="Opera" label="Opera">Opera</option>
                        <option value="Concert" label="Concert">Concert</option>
                        <option value="Playhouse" label="Playhouse">Playhouse</option>
                        <option value="Studio" label="Studio">Studio</option>
                    </select><br>
                    From date <br>&nbsp&nbsp&nbsp&nbsp
                    <input type="date" name="fromdate" id="fromdate" value=""><br>
                    To date <br>&nbsp&nbsp&nbsp&nbsp
                    <input type="date" name="todate" id="todate" value=""><br>
                    Company <br>&nbsp&nbsp&nbsp&nbsp
                    <input type="text" id="company" name="company" value size="50" required="1">
                    <br>Description <br>&nbsp&nbsp&nbsp&nbsp
                    <textarea id="description" name="description" cols="80" rows="4" required="1"></textarea>
                    <br>Performances <br>&nbsp&nbsp&nbsp&nbsp
                    <textarea id="performances" name="performances" cols="80" rows="4" readonly="readonly"></textarea><br><br>&nbsp&nbsp&nbsp&nbsp
                    <input type="submit" name="submit" id="submit" value="Add event">
                </fieldset>
            </form>
            <br><fieldset>
                <legend>Enter performance details</legend>
                Show time <br>
                <select name="showtime" id="showtime">
                    <option value="matinee">matinee</option>
                    <option value="evening">evening</option>
                </select><br>
                Date <br>
                <input type="date" name="performancedate" id="performancedate"><br><br>
                <input type="button" id="addperformance" value="Add performance" onclick="addPerformance()">
            </fieldset>
        </div>
    </body>
</html>