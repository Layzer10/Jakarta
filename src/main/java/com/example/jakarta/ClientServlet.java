package com.example.jakarta;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "clientServlet", value = "/client")
public class ClientServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.getRequestDispatcher("client.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String nom       = request.getParameter("nom");
        String prenom    = request.getParameter("prenom");
        String email     = request.getParameter("email");
        String telephone = request.getParameter("telephone");

        if (nom == null || prenom == null) {
            request.setAttribute("erreur", "Le nom et le prénom sont obligatoires.");
            request.getRequestDispatcher("client.jsp").forward(request, response);
            return;
        }

        Client client = new Client(nom, prenom, email, telephone);
        request.setAttribute("client", client);
        request.getRequestDispatcher("client.jsp").forward(request, response);
    }
}