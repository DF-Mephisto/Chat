/**
 *index url
 *
 */

package app.servlets;

import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class mainServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cooks = req.getCookies();
        if (cooks != null)
        {
            for (Cookie name : cooks) {
                if (name.getName().equals("name")) {
                    for (Cookie pwd : cooks) {
                        if (pwd.getName().equals("pwd")) {
                            req.setAttribute("name", name.getValue());
                            req.setAttribute("pwd", pwd.getValue());
                            System.out.println("name: " + name.getValue() + "pwd: " + pwd.getValue());
                        }
                    }
                }
            }
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher("WEB-INF/index.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String password = req.getParameter("pass");
        String error = "";

        Model model = Model.getInstance();
        String pwd = model.getpwd(name);
        if (pwd == null || !pwd.equals(password))
        {
            error = "Wrong login or password!";
            req.setAttribute("error", error);

            doGet(req, resp);
            return;
        }

        Cookie cookn = new Cookie("name", name);
        Cookie cookp = new Cookie("pwd", password);
        cookn.setMaxAge(600);
        cookp.setMaxAge(600);
        resp.addCookie(cookn);
        resp.addCookie(cookp);

        HttpSession session = req.getSession();
        session.setAttribute("name", name);
        session.setAttribute("access", true);
        resp.sendRedirect("/chat");
    }
}
