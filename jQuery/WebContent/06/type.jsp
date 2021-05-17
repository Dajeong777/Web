<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Jsp</title>
</head>
<body>
<%
    out.println(request.getMethod() + "<br>");
    out.println(request.getRequestURI() + "<br>");
    out.println(request.getQueryString() + "<br>");
    
    String s1 = request.getParameter("name");
    String s2 = request.getParameter("price");
    out.println("name: " + s1 + "<br>");
    out.println("price: " + s2 + "<br>");
%>
</body>
</html>