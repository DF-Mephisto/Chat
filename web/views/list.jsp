<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mephisto
  Date: 04.09.2019
  Time: 12:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users list</title>
    <link rel="stylesheet" href="../css/listStyles.css">
</head>
<body style="background-color: aquamarine">

<div class="center">
    <%
        List<String> names = (List<String>) request.getAttribute("userNames");

        if (names != null && !names.isEmpty()) {
            out.print("<table>");

            for (String str : names)
            {
                out.print("<tr>");
                out.print("<td>" + str + "</td>");
                out.print("</tr>");
            }

            out.print("</table>");
        } else out.println("<div class=\"error\">There are no users yet!</div>");
    %>

    <br />
    <div style="text-align: center; overflow: auto">
        <button onclick="location.href='/'">Back to main</button>
    </div>
</div>

</body>
</html>
