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
<body style="background-image:url('${pageContext.request.contextPath}/Pictures/Planet.jpg'); background-attachment: fixed;">
<form method="post" action="/index">
    <fieldset class="fieldsetStyle">
        <legend class="fieldsetLegendStyle">Main menu</legend>

        <div style="padding-left: 100px; color: white;">
            <label>Name:
                <%
                    if (request.getAttribute("name") != null)
                        out.println("<input type=\"text\" name=\"name\" required placeholder=\"login\" value=\"" + request.getAttribute("name") + "\"style=\"position: absolute; right: 100px;\"><br />");
                    else
                        out.println("<input type=\"text\" name=\"name\" required placeholder=\"login\" style=\"position: absolute; right: 100px;\"><br />");
                %>
                <!--<input type="text" name="name" required placeholder="login" style="position: absolute; right: 100px;"><br />-->
            </label>
            <br />
            <label>Password:
                <%
                    if (request.getAttribute("pwd") != null)
                        out.println("<input type=\"password\" name=\"pass\" required placeholder=\"password\" value=\"" + request.getAttribute("pwd") + "\"style=\"position: absolute; right: 100px;\"><br />");
                        else
                        out.println("<input type=\"password\" name=\"pass\" required placeholder=\"password\" style=\"position: absolute; right: 100px;\"><br />");
                %>
                <!--<input type="password" name="pass" required placeholder="password" style="position: absolute; right: 100px;"><br />-->
            </label>
        </div>

        <br />
        <%
            if (request.getAttribute("error") != null)
            {
                String er = (String)request.getAttribute("error");
                if (!er.equals(""))
                {
                    out.println("<div style=\"text-align: center; color: red;\">");
                    out.println(er);
                    out.println("</div>");
                }
            }
            else
            {
                out.println("<br />");
            }
        %>
        <br />

        <div style="text-align: center;">
            <input class="btn" type="submit" value="Login">
            <input class="btn" type="button" value="Register" onclick="location.href='/add'" style="margin-left: 50px;">
            <input class="btn" type="button" value="List users" onclick="location.href='/list'" style="margin-left: 50px;">
        </div>
    </fieldset>
</form>

</body>
</html>
