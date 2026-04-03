package com.example.jakarta;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "hornerServlet", value = "/horner")
public class HornerServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        request.getRequestDispatcher("horner.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String resultat;
        try {
            double a = Double.parseDouble(request.getParameter("a"));
            double b = Double.parseDouble(request.getParameter("b"));
            double c = Double.parseDouble(request.getParameter("c"));
            double delta = b * b - 4 * a * c;

            if (a == 0) {
                if (b == 0) {
                    resultat = (c == 0) ? "Infinité de solutions" : "Aucune solution";
                } else {
                    resultat = "Équation linéaire — x = " + format(-c / b);
                }
            } else if (delta > 0) {
                double x1 = (-b - Math.sqrt(delta)) / (2 * a);
                double x2 = (-b + Math.sqrt(delta)) / (2 * a);
                resultat = "Δ = " + format(delta) + " > 0 — Deux solutions réelles :<br>"
                        + "x₁ = " + format(x1) + "<br>x₂ = " + format(x2);
            } else if (delta == 0) {
                resultat = "Δ = 0 — Solution double :<br>x₀ = " + format(-b / (2 * a));
            } else {
                double re = -b / (2 * a);
                double im = Math.sqrt(-delta) / (2 * a);
                resultat = "Δ = " + format(delta) + " < 0 — Deux solutions complexes :<br>"
                        + "z₁ = " + format(re) + " - " + format(im) + "i<br>"
                        + "z₂ = " + format(re) + " + " + format(im) + "i";
            }
        } catch (NumberFormatException e) {
            resultat = "Veuillez entrer des nombres valides.";
        }

        request.setAttribute("resultat", resultat);
        request.setAttribute("a", request.getParameter("a"));
        request.setAttribute("b", request.getParameter("b"));
        request.setAttribute("c", request.getParameter("c"));
        request.getRequestDispatcher("horner.jsp").forward(request, response);
    }

    private String format(double d) {
        if (d == Math.floor(d) && !Double.isInfinite(d)) return String.valueOf((long) d);
        return String.format("%.4f", d).replaceAll("0+$", "").replaceAll("\\.$", "");
    }
}