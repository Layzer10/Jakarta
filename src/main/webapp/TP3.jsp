<%@ page import="java.awt.*" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .damier {
            display: grid;
            grid-template-columns: repeat(8, 50px);
            grid-template-rows: repeat(8, 50px);
        }
        .case { width: 50px; height: 50px; }
        .noir { background: black; }
        .blanc { background: white; }
    </style>
</head>
<body>
<form action="TP3.jsp" method="post">
    <input type="text" name="text">
    <input type="color" name="color">
    <input type="submit" name="valider">
</form>
<% String mot= request.getParameter("text");%>
<% String couleur= request.getParameter("color");%>
<% if(mot == null) mot = "";
    if(couleur == null) couleur = "#000000";%>
<div class="damier">
    <%
        for(int i = 0; i < 8; i++) {
            for(int j = 0; j < 8; j++) {
                if((i + j) % 2 == 0) {
    %>
    <div class="case blanc"><h1><%=mot%></h1> </div>

    <%
    } else {
    %>
    <div class="case noir" style="background-color:<%=couleur%>"><h1><%=mot%></h1> </div>

    <%
                }
            }
        }
    %>
</div>

</body>
</html>
