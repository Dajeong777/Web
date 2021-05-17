<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<% if(session.getAttribute("ValidMem") == null) { %>    
    <jsp:forward page="/member/login.jsp" />
<%
}
    String name = (String)session.getAttribute("name");
    String id = (String)session.getAttribute("id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel= "stylesheet" href="/main.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    
<style>
    @import url('https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap');
    header{
        font-size : 1em;
        font-family: 'Architects Daughter', cursive;
    }
</style>
 
<style>   
    .container {
        text-align: right; 
        font-size: 10;
       
    }
   
    @media (max-width: 980px) {
     .title {
        font-size: 20px;
        }
    }
    .img.left { 
        position: left;
    }
    
    .content {
        position: absolute;
    }
   .footer {
	position: absolute;
	left:0;
	bottom:0;
	width: 100%;
	float: both;
	background-color: #CFDBE5;
	background-position: 10% 100px;
	color: white;
	padding: 15px 0;
	text-align:center
}
</style>

<body>
        
        
        <header>
        <h1>
            <img src="./snumoon.jpg" alt="logo" width="400" height="200"> 
            <span style="margin-top:20px;" ><a href="main.css">  Korean Way </a></span>
        </h1>
       </header> 
       
        <div class="container">
            <div class="row">
            <div class="btn btn-secondary btn-sm">
                HOME
            </div>
            <div class="btn btn-secondary btn-sm">
                NOTICE
            </div>
            <div class="btn btn-secondary btn-sm">
                LOGIN
            </div>
            <div class="btn btn-primary btn-sm">
                JOIN
            </div>
            
            </div>
       </div>  
    
        <div class="container" >
        <h1>Hello <%= name %><br></h1>
        <form id="reg_frm" action="logout.do" method="post">
            <input type="submit" value="로그아웃" class="btn btn-outline-secondary" 
                    onclick="javascript:window.location='/member/main.jsp'"> &nbsp;&nbsp;&nbsp;
            <input type="button" value="정보수정" class="btn btn-outline-secondary"
                   onclick="javascript:window.location='/member/modify.jsp'">
        </form>
        </div>
    
    <hr>
        <nav>
            
            <a href="main.jsp"><button type="button" class="btn btn-outline-secondary">  COMPANY  </button></a>
            <a href="main.jsp"><button type="button" class="btn btn-outline-success">  BOARD  </button></a>
            <a href="main.jsp"><button type="button" class="btn btn-outline-danger">  RESERVATION  </button></a>
            <a href="main.jsp"><button type="button" class="btn btn-outline-info">  LOCATION  </button></a>
            
        </nav>
        
    <br>
    
    <article id="content">
        <section>
            <div class="text-center">
                <a href="#"><img src="./kingsejong.jpg"  class="rounded" alt="banner"></a>
            <br>
            </div>
        </section>
    </article>
    
    
    <footer>
        <tr rowspan="3">
        <td colspan="3">
        <div style="text-align:center">회사 소개  |  제휴 제안  |  이용약관  |  개인정보처리방침 </div>
        </td>
        </tr>
        <div class="text-center"> Copyright(c)2021 Dajeong Kim  All rights reserved. </div>
    </footer>
   
 
  
    
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        
        
        
</body>
</html>