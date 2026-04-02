package com.example.jakarta;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

@jakarta.servlet.annotation.WebFilter(urlPatterns = "/*")
public class WebFilter implements Filter {

    int compt;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
        compt = 0;
        System.out.println("Filtre initialisé");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        compt++;

        HttpServletRequest httpRequest   = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String uri = httpRequest.getRequestURI();
        System.out.println("Passage n°" + compt + " dans le filtre → " + uri);

        // Pages accessibles SANS être connecté
        boolean estPagePublique = uri.contains("login")
                || uri.contains("index.jsp")
                || uri.endsWith(".css")
                || uri.endsWith(".js")
                || uri.endsWith(".ico");

        if (!estPagePublique) {
            // Vérification de la session pour les pages protégées
            HttpSession session = httpRequest.getSession(false);
            boolean estConnecte = (session != null && session.getAttribute("username") != null);

            if (!estConnecte) {
                System.out.println(" Accès refusé à " + uri + " → redirection vers login");
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
                return; // On arrête la chaîne de filtres
            }
        }

        // Tout est OK, on laisse passer la requête
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("Filtre détruit après " + compt + " passages");
        Filter.super.destroy();
    }
}