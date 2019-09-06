package app.servlets.filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainFilter implements Filter
{
    public void init (FilterConfig config) throws ServletException
    {

    }

    public void doFilter (ServletRequest request, ServletResponse response,
                          FilterChain chain) throws IOException, ServletException
    {
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        if (session != null && session.getAttribute("access") != null)
        {
            resp.sendRedirect("/chat");
            return;
        }
        chain.doFilter(request, response);
    }

    public void destroy()
    {

    }
}
