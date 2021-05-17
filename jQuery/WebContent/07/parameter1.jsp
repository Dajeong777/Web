<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println(“<?xml version=\"1.0\" encoding=\"UTF-8\"?>                ");
out.println(“<root>                                                    ");
out.println(“  <datas>                                                 ");
out.println(“    <data>                                                ");
out.println(“        <name>사과</name>                                 ");
out.println(“        <price>1,000</price>                              ");
out.println(“	 </data>                                               ");
out.println(“    <data>                                                ");
out.println(“        <name>바나나</name>                               ");
out.println(“        <price>1,200</price>                              ");
out.println(“	</data>                                                ");
out.println(“  </datas>                                                ");
out.println(“</root>                                                   ");
%>


</body>
</html>