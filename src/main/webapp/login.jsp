<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center;
            align-items: center; height: 100vh; margin: 0; background-color: #f0f2f5; }
        .login-box { background: white; padding: 40px; border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1); width: 320px; }
        h2 { text-align: center; margin-bottom: 24px; color: #333; }
        input[type=text], input[type=password] { width: 100%; padding: 10px; margin: 8px 0 16px 0;
            border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        input[type=submit] { width: 100%; padding: 10px; background-color: #4CAF50;
            color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; }
        .error { color: red; text-align: center; margin-bottom: 12px; font-size: 14px; }
        label { font-weight: bold; color: #555; font-size: 14px; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>🔐 Connexion</h2>

    <% String erreur = (String) request.getAttribute("erreur"); %>
    <% if (erreur != null) { %>
    <p class="error"><%= erreur %></p>
    <% } %>

    <form action="login" method="post">
        <label>Nom d'utilisateur :</label>
        <input type="text" name="username" placeholder="Entrez votre identifiant" required />
        <label>Mot de passe :</label>
        <input type="password" name="password" placeholder="Entrez votre mot de passe" required />
        <input type="submit" value="Se connecter" />
    </form>
</div>
</body>
</html>