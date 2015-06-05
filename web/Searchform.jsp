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
            <form method="POST" onsubmit="return doCheckDates()">
                <fieldset>
                    <legend>Search for shows</legend>
                    Type &nbsp&nbsp
                    <select name="type" id="type">
                        <option value="All" label="All">All</option>
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
                    Venue &nbsp&nbsp
                    <select name="venue" id="venue">
                        <option value="Any" label="Any">Any</option>
                        <option value="Opera" label="Opera">Opera</option>
                        <option value="Concert" label="Concert">Concert</option>
                        <option value="Playhouse" label="Playhouse">Playhouse</option>
                        <option value="Studio" label="Studio">Studio</option>
                    </select><br>
                    From date &nbsp&nbsp
                    <input type="date" name="fromdate" id="fromdate" value=""><br>
                    To date &nbsp&nbsp
                    <input type="date" name="todate" id="todate" value=""><br><br>
                    <input type="submit" name="submit" id="submit" value="Search">
                </fieldset>
            </form>
        </div>
    </body>
</html>