/**
 *chat url
 *
 */

package app.servlets;

import app.entities.Msg;
import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class ChatServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Model model = Model.getInstance();
        List<Msg> messages = model.getMessages();

        req.setAttribute("messages", messages);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("views/chat.jsp");
        requestDispatcher.forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String name = (String)session.getAttribute("name");
        String message = req.getParameter("msg");

        Model model = Model.getInstance();
        model.addMessage(name, message);

        doGet(req, resp);
    }
}
