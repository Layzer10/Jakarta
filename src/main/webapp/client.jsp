<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.jakarta.Client" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
    Client client = (Client) request.getAttribute("client");
    String erreur  = (String) request.getAttribute("erreur");
%>
<!DOCTYPE html>
<html>
<head><title>Client</title>
<style>
    body { font-family:Arial,sans-serif; margin:0; background:#f0f2f5; display:flex; flex-direction:column; min-height:100vh; }
    .content { flex:1; padding:30px; display:flex; flex-direction:column; align-items:center; }
    .card { background:white; padding:30px 40px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.1); width:400px; }
    label { font-size:13px; font-weight:bold; color:#555; display:block; margin-bottom:4px; }
    input[type=text], input[type=email], input[type=tel] { width:100%; padding:9px; border:1px solid #ccc; border-radius:4px; margin-bottom:14px; }
    input[type=submit] { width:100%; padding:11px; background:#e67e22; color:white; border:none; border-radius:4px; cursor:pointer; font-size:15px; }
    .error  { color:#e74c3c; background:#fdecea; border:1px solid #f5c6cb; padding:10px; border-radius:4px; margin-bottom:14px; }
    .success { margin-top:20px; padding:14px; background:#eafaf1; border:1px solid #a9dfbf; border-radius:6px; color:#1e8449; }
    .success table { width:100%; border-collapse:collapse; margin-top:8px; }
    .success td { padding:6px 10px; border-bottom:1px solid #d5f5e3; font-size:14px; }
    .success td:first-child { font-weight:bold; width:110px; }
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="content">
    <h2>👤 Ajouter un client</h2>
    <div class="card">
        <% if (erreur != null) { %><div class="error"><%= erreur %></div><% } %>
        <form action="client" method="post">
            <label>Nom *</label>
            <input type="text" name="nom" required />
            <label>Prénom *</label>
            <input type="text" name="prenom" required />
            <label>Email</label>
            <input type="email" name="email" />
            <label>Téléphone</label>
            <input type="tel" name="telephone" />
            <input type="submit" value="Ajouter" />
        </form>
        <% if (client != null) { %>
        <div class="success">
            <strong>Client ajouté</strong>
            <table>
                <tr><td>Nom</td><td><%= client.getNom() %></td></tr>
                <tr><td>Prénom</td><td><%= client.getPrenom() %></td></tr>
                <tr><td>Email</td><td><%= client.getEmail() %></td></tr>
                <tr><td>Téléphone</td><td><%= client.getTelephone() %></td></tr>
            </table>
        </div>
        <% } %>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>