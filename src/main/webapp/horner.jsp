<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null || sess.getAttribute("username") == null) { response.sendRedirect("login.jsp"); return; }
    String resultat = (String) request.getAttribute("resultat");
    String a = request.getAttribute("a") != null ? (String)request.getAttribute("a") : "";
    String b = request.getAttribute("b") != null ? (String)request.getAttribute("b") : "";
    String c = request.getAttribute("c") != null ? (String)request.getAttribute("c") : "";
%>
<!DOCTYPE html>
<html>
<head><title>Horner</title>
<style>
    body { font-family:Arial,sans-serif; margin:0; background:#f0f2f5; display:flex; flex-direction:column; min-height:100vh; }
    .content { flex:1; padding:30px; display:flex; flex-direction:column; align-items:center; }
    .card { background:white; padding:30px 40px; border-radius:8px; box-shadow:0 2px 8px rgba(0,0,0,0.1); width:400px; }
    .eq { text-align:center; font-size:20px; color:#8e44ad; font-weight:bold; margin-bottom:20px; }
    .row { display:flex; align-items:center; gap:10px; margin-bottom:14px; }
    label { font-weight:bold; min-width:30px; }
    input[type=number] { flex:1; padding:9px; border:1px solid #ccc; border-radius:4px; }
    input[type=submit] { width:100%; padding:11px; background:#27ae60; color:white; border:none; border-radius:4px; cursor:pointer; font-size:15px; margin-top:6px; }
    .result { margin-top:20px; padding:14px; background:#eafaf1; border:1px solid #a9dfbf; border-radius:6px; color:#1e8449; line-height:1.8; }
</style>
</head>
<body>
<%@ include file="navbar.jsp" %>
<div class="content">
    <h2>📐 Résolution ax² + bx + c = 0</h2>
    <div class="card">
        <div class="eq">ax² + bx + c = 0</div>
        <form action="horner" method="post">
            <div class="row"><label>a :</label><input type="number" name="a" step="any" value="<%= a %>" required /></div>
            <div class="row"><label>b :</label><input type="number" name="b" step="any" value="<%= b %>" required /></div>
            <div class="row"><label>c :</label><input type="number" name="c" step="any" value="<%= c %>" required /></div>
            <input type="submit" value="Résoudre" />
        </form>
        <% if (resultat != null) { %>
        <div class="result"><strong>Résultat :</strong><br><%= resultat %></div>
        <% } %>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>