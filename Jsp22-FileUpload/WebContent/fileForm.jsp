<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fileForm</title>
</head>
<body>
    <form action="fileFormOk.jsp" method="post" enctype="multipart/form-data" >
    이름 : <input type="text" name="bName" value=""><br />
    파일 : <input type="file" name="filename"><br />
    <input type="submit" value="File Upload">
    
    </form>

</body>
</html>