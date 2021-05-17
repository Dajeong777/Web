<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>scriptlet</title>
</head>
<body>
<table border=1>
<%
   int i=0; 
   while(true){
	   i++;
	   //out.println("2 * "+ i + " = " + (2 * i) +  "<br>");
%>
<tr>
   <td>
   2 * <%= i %> = <%= 2 * 1 %> <br>
   =========== 
   </td>
</tr>   
<%
    if(i >= 9) break;
   }
%>

</table>
</body>
</html>