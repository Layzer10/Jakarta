
<form action="TP2.jsp" method="post">

    <%!
        String enVert(String texte) {
            return "<span style='color: green;'>" + texte + "</span>";
        }

        String enRouge(String texte) {
            return "<span style='color: red;'>" + texte + "</span>";
        }
    %>
    <input type="text" name="text">
    <input type="submit" name="valider" value="valider">
</form>

<%String a= request.getParameter("text");
    System.out.println(a);
    if (a != null && !a.isEmpty()) {
%>
<p>Le contenu du champ input est :
    <%
    if (a.equals("servlet")) {%>
    <%=enVert(a)%>
    }
    <% } else { %>
        <%=enRouge(a)%>
    <%}}
%></p>
