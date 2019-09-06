<%--
  Created by IntelliJ IDEA.
  User: Mephisto
  Date: 06.09.2019
  Time: 7:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login screen</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/indexStyles.css"/>
</head>
<body style="background-color: aquamarine">
<form method="post">
    <fieldset class="fieldsetStyle">
        <legend class="fieldsetLegendStyle">Main menu</legend>

        <div style="padding-left: 100px">
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
            if (request.getAttribute("error") != null)
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
            <input type="submit" value="Login">
            <input type="button" value="Register" onclick="location.href='/add'" style="margin-left: 50px;">
            <input type="button" value="List users" onclick="location.href='/list'" style="margin-left: 50px;">
        </div>
    </fieldset>
</form>

</body>
</html>
