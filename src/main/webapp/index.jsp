<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%! public String enItalic(String message){
    return ("<p style='font-style: italic'>"+message+"</p>");
} %>
<h1><%= "Hello World!" %>
</h1>
<%= enItalic("Bonjour")%>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<a href="TP2.jsp">TP1</a>
<a href="TP3.jsp">TP2</a>
</body>
</html>