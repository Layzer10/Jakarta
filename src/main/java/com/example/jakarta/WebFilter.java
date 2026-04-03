package com.example.jakarta;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@jakarta.servlet.annotation.WebFilter(urlPatterns = "/*")
public class WebFilter implements Filter {
    int compt;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        compt = 0;
        System.out.println("Filtre initialisé");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        compt++;
        HttpServletRequest  httpReq  = (HttpServletRequest)  request;
        HttpServletResponse httpResp = (HttpServletResponse) response;
        String uri = httpReq.getRequestURI();
        System.out.println("Filtre passage n°" + compt + " → " + uri);

        boolean estPublique = uri.contains("/login")
                || uri.endsWith("login.jsp")
                || uri.endsWith(".css")
                || uri.endsWith(".js")
                || uri.endsWith(".ico");

        if (!estPublique) {
            HttpSession session = httpReq.getSession(false);
            if (session == null || session.getAttribute("username") == null) {
                httpResp.sendRedirect(httpReq.getContextPath() + "/login.jsp");
                return;
            }
        }
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("Filtre détruit après " + compt + " passages");
    }
}