<%@ page import="java.util.Map" %>
<%@ page import="app.entities.Msg" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mephisto
  Date: 06.09.2019
  Time: 8:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chat</title>
    <link rel="stylesheet" href="../css/chatStyles.css">
    <script src="../js/chatScript.js"></script>
</head>
<body style="background-image:url('${pageContext.request.contextPath}/Pictures/Planet.jpg'); background-attachment: fixed;">

<div class="chat wordwrap" id="chatID">
    <%
        List<Msg> messages = (List<Msg>)request.getAttribute("messages");

        for (Msg message : messages)
        {
            out.println(message.getName() + ": " + message.getMessage());
            out.println("<br />");
        }
    %>
    <script>
        scrollDown();
    </script>
</div>

<br />

<form method="post">
    <fieldset class="fieldsetStyle">

        <textarea name="msg" maxlength="255" style="width: 100%; height: 70%;"></textarea>
        <br />
        <br />

        <div style="text-align: center;">
            <input type="submit" value="Send message">
            <input type="button" value="Refresh" onclick="location.href='/chat'" style="margin-left: 50px;">
            <input type="button" value="Logout" onclick="location.href='/logout'" style="margin-left: 50px;">
            <input type="button" value="List users" onclick="location.href='/list'" style="margin-left: 50px;">
        </div>
    </fieldset>
</form>

</body>
</html>
