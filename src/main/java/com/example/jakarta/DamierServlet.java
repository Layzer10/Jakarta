package com.example.jakarta;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "damierServlet", value = "/damier")
public class DamierServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.getRequestDispatcher("TP3.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String mot     = request.getParameter("mot");
        String couleur = request.getParameter("couleur");
        if (mot     == null) mot     = "";
        if (couleur == null) couleur = "#000000";
        request.setAttribute("mot", mot);
        request.setAttribute("couleur", couleur);
        request.getRequestDispatcher("TP3.jsp").forward(request, response);
    }
}