package com.example.jakarta;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    // Identifiants codés en dur pour l'exemple
    private static final String VALID_USERNAME = "admin";
    private static final String VALID_PASSWORD = "1234";

    /**
     * GET /login → redirige vers la page de login
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // Si déjà connecté, rediriger vers le dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("username") != null) {
            response.sendRedirect("dashboard.jsp");
            return;
        }
        // Sinon afficher le formulaire
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    /**
     * POST /login → vérifie les identifiants et crée la session
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("Tentative de connexion : " + username);

        if (VALID_USERNAME.equals(username) && VALID_PASSWORD.equals(password)) {
            // ✅ Identifiants corrects : création de la session
            HttpSession session = request.getSession();          // crée une nouvelle session
            session.setAttribute("username", username);          // stocke l'utilisateur
            session.setAttribute("loginTime", System.currentTimeMillis()); // stocke l'heure

            System.out.println("Connexion réussie pour : " + username + " | Session ID : " + session.getId());

            // Redirection vers le tableau de bord
            response.sendRedirect("dashboard.jsp");

        } else {
            // ❌ Identifiants incorrects : message d'erreur + retour au formulaire
            System.out.println("Échec de connexion pour : " + username);
            request.setAttribute("erreur", "Identifiant ou mot de passe incorrect.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
