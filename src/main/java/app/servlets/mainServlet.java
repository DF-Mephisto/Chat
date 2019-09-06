package app.servlets;

import app.entities.User;
import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class mainServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        HttpSession session = req.getSession();
        session.setAttribute("name", name);
        session.setAttribute("access", true);
        resp.sendRedirect("/chat");
    }
}
