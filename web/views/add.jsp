<%--
  Created by IntelliJ IDEA.
  User: Mephisto
  Date: 04.09.2019
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add new user</title>
    <link rel="stylesheet" href="../css/addStyles.css">
</head>
<body style="background-image:url('${pageContext.request.contextPath}/Pictures/Planet.jpg'); background-attachment: fixed;">
<form method="post">
    <fieldset class="fieldsetStyle">
        <legend class="fieldsetLegendStyle">Add User:</legend>

        <div style="color: white; padding-left: 100px">
            <label>Name:
                <input type="text" name="name" style="position: absolute; right: 100px;"><br />
            </label>
            <br />
            <label>Password:
                <input type="password" name="pass" style="position: absolute; right: 100px;"><br />
            </label>
        </div>

        <br />
        <%
            if (request.getAttribute("userName") != null)
            {
                out.print("<div style=\"text-align: center; color: green;\">");
                out.print(request.getAttribute("userName") + " added!");
                out.print("</div>");
            }
            else if (request.getAttribute("error") != null)
            {
                String er = (String)request.getAttribute("error");
                if (!er.equals(""))
                {
                    out.print("<div style=\"text-align: center; color: red;\">");
                    out.println(er);
                    out.print("</div>");
                }
            }
            else
            {
                out.println("<br />");
            }
        %>
        <br />

        <div style="text-align: center;">
            <input class="btn" type="submit" value="Register">
            <input class="btn" type="button" value="Back" onclick="location.href='/'" style="margin-left: 50px;">
        </div>
    </fieldset>
</form>

</body>
</html>
