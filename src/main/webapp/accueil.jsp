<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("username") == null) {
        response.sendRedirect("login.jsp"); return;
    }
%>
<!DOCTYPE html>
<html>
<head><title>Accueil</title>
<style>
    body { font-family:Arial,sans-serif; margin:0; background:#f0f2f5; display:flex; flex-direction:column; min-height:100vh; }
    .content { flex:1; display:flex; justify-content:center; align-items:center; padding:40px; }
    .card { background:white; border-radius:8px; padding:50px 60px; box-shadow:0 2px 10px rgba(0,0,0,0.1); text-align:center; }
    .links { display:flex; gap:16px; margin-top:30px; justify-content:center; }
    .btn { padding:12px 24px; border-radius:6px; text-decoration:none; color:white; font-size:15px; }
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="content">
    <div class="card">
        <h1>Bienvenue, <%= sess.getAttribute("username") %> 👋</h1>
        <p>Choisissez une fonctionnalité dans la barre de navigation.</p>
        <div class="links">
            <a href="damier" class="btn" style="background:#8e44ad;">♟ Damier</a>
            <a href="horner" class="btn" style="background:#27ae60;">📐 Horner</a>
            <a href="client" class="btn" style="background:#e67e22;">👤 Client</a>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>