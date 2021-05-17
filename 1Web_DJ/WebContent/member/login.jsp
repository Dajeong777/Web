<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if(session.getAttribute("ValidMem") !=null){ %>
	<jsp:forward page="main.jsp"></jsp:forward>
<%} %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery.js"></script>

<script>
function submit_ajax(){
	var queryString=$("#reg_frm").serialize();
	console.log(queryString);
	$.ajax({
		
		url:'loginOk.do',
		type:'POST',
		
		data: queryString,
		dataType: 'text',
		success: function(json){
			console.log(json);
			var result=JSON.parse(json);
			
			if(result.code=="success"){
				
				alert(result.desc)
				window.location.replace("/main.jsp");
			}else{
				alert(result.desc);
			}
		}
	})
}
</script>
</head>
<style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #76b852; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #76b852, #8DC26F);
  background: -moz-linear-gradient(right, #76b852, #8DC26F);
  background: -o-linear-gradient(right, #76b852, #8DC26F);
  background: linear-gradient(to left, #76b852, #8DC26F);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}

</style>

<body>
	<form id="reg_frm">

		아이디 : <input type="text"  id="id" name="id" 
			value="<% if(session.getAttribute("id") !=null)
					out.println(session.getAttribute("id"));%>"><br>
		비밀번호 : <input type="password" id="pw" name="pw" size="10"><br>

	
		<input type="button" value="로그인" onclick="submit_ajax()">&nbsp;&nbsp;
		<input type="button" value="회원가입" onclick="javascript:window.location='/member/join.jsp'"> 		
	</form>

	
	<div class="login-page">
  <div class="form">
    <form class="register-form">
      <input type="text" placeholder="id" id="id" name="id" 
               value="<% if(session.getAttribute("id") !=null)
					out.println(session.getAttribute("id"));%>"><br> 
      <input type="password" placeholder="password"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form">
      <input type="text" placeholder="username"/>
      <input type="password" placeholder="password"/>
      <button onclick="submit_ajax()">login</button> &nbsp;&nbsp;
      <p class="message">Not registered? <a href="#" >Create an account</a></p>
    </form>
  </div>
</div>
	
</body>
</html>