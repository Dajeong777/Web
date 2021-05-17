<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>redirect</title>
</head>
<body>

        <% 
        request.setAttribute("id", "abcde");
        request.setAttribute("pw", "12345");
        
        request.getRequestDispatcher("RequestObj").forward(request, response);
        %>
        

</body>
</html>