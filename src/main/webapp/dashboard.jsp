<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f0f2f5; }
        .navbar { background-color: #333; color: white; padding: 14px 24px;
            display: flex; justify-content: space-between; align-items: center; }
        .navbar a { color: white; text-decoration: none; background-color: #e74c3c;
            padding: 8px 16px; border-radius: 4px; font-size: 14px; }
        .content { padding: 40px; text-align: center; }
        .card { background: white; border-radius: 8px; padding: 40px; display: inline-block;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
<%
    HttpSession sess = request.getSession(false);
    String username = null;
    if (sess != null) {
        username = (String) sess.getAttribute("username");
    }
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div class="navbar">
    <span>Tableau de bord</span>
    <a href="logout">Se déconnecter</a>
</div>
<div class="content">
    <div class="card">
        <h1>Bienvenue, <%= username %> ! 👋</h1>
        <p>Vous êtes connecté. Session ID : <code><%= sess.getId() %></code></p>
        <p>Connecté depuis : <code><%= new java.util.Date(sess.getCreationTime()) %></code></p>
        <br/>
        <a href="index.jsp">← Retour à l'accueil</a>
    </div>
</div>
</body>
</html>