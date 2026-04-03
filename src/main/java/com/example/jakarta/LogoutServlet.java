package com.example.jakarta;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "logoutServlet", value = "/logout")
public class LogoutServlet extends HttpServlet {

    /**
     * GET /logout → invalide la session et redirige vers le login
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        // Récupère la session existante SANS en créer une nouvelle (false)
        HttpSession session = request.getSession(false);

        if (session != null) {
            String username = (String) session.getAttribute("username");
            System.out.println("Déconnexion de : " + username);

            session.invalidate();
        }

        // Redirection vers la page de connexion
        response.sendRedirect("login.jsp");
    }
}
