<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% if(session.getAttribute("ValidMem") == null) { %>    
    <jsp:forward page="/main.jsp" />
<%
}
    String name = (String)session.getAttribute("name");
    String id = (String)session.getAttribute("id");
%>   
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <script src="http://code.jquery.com/jquery.js"></script>
    
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <meta name="google-signin-client_id" content="707310972169-nokdn805o5fh60dceb7v8j4asbqbjg85.apps.googleusercontent.com">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	 crossorigin="anonymous">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	 crossorigin="anonymous">
    <style type="text/css">
	.header,body{padding-bottom:20px}.header,.jumbotron{border-bottom:1px solid #e5e5e5}body{padding-top:20px}.footer,.header,.marketing{padding-right:15px;padding-left:15px}.header h3{margin-top:0;margin-bottom:0;line-height:40px}.footer{padding-top:19px;color:#777;border-top:1px solid #e5e5e5}@media (min-width:768px){.container{max-width:730px}}.container-narrow>hr{margin:30px 0}.jumbotron{text-align:center}.jumbotron .btn{padding:14px 24px;font-size:21px}.marketing{margin:40px 0}.marketing p+h4{margin-top:28px}@media screen and (min-width:768px){.footer,.header,.marketing{padding-right:0;padding-left:0}.header{margin-bottom:30px}.jumbotron{border-bottom:0}}
	</style>
	
	<!-- css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    
	<style>
    @import url('https://fonts.googleapis.com/css2?family=Architects+Daughter&display=swap');
    p{
        font-size : 1em;
        font-family: 'Architects Daughter', cursive;
    }
    </style>
 
    <style>   
     .container {
        text-align: right; 
    }
    
    @media (max-width: 980px) {
     .title {
        font-size: 20px;
        }
    }
    .img.left { 
        position: left;
    }
    </style>
	
    <script>
    function form_check() {
	    if($('#id').val().length == 0) {
		alert("아이디는 필수 사항 입니다.");
		$('#id').focus();
		return;
	}
	
	if($('#id').val().length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		$('#id').focus();
		return;
	}
	
	
	if($('#pw').val().length == 0) {
		alert("비밀번호는 필수 사항 입니다.");
		$('#pw').focus();
		return;
	}
	
	if($('#pw').val() !=$('#pw_check').val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$('#pw').focus();
		return;
	}
	
	if($('#name').val().length == 0) {
		alert("이름은 필수 사항 입니다.");
		$('#name').focus();
		return;
	}
	
	if($('#eMail').val().length == 0) {
		alert("메일은 필수 사항 입니다.");
		$('#eMail').focus();
		return;
	}
	//alert("1111")
	submit_ajax();
	
}
  
    function submit_ajax() {
    	var queryString = $("#reg_frm").serialize();
    	$.ajax ({
    		url: '/joinOk.do',
    		type: 'POST',
    		data: queryString,
    		dataType: 'text',
    		success: function(json) {
    			console.log(json);
    			var result = JSON.parse(json);
    			if (result.code=="success") {
    				alert(result.desc)
    				window.location.replace("/main.jsp");
    			} else {
    				alert(result.desc);
    			}   			
    		}
    	});
    	
    }
</script>

<script>
    function onSignIn(googleUser) {
    	var profile = googleUser.getBasicProfile();
		$('#my-signin2').css('display', 'none');
    	$('#logout').css('display', 'block');
    	$('#upic').attr('src', profile.getImageUrl());
    	$('#uname').html('[ ' +profile.getName() + ' ]');
    }
    function onFailure(error) {
    }
	function signOut() {
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	    	$('#my-signin2').css('display', 'block');
	    	$('#logout').css('display', 'none');
	    	$('#upic').attr('src', '');
	    	$('#uname').html('');
	    });
	}
    function renderButton() {
        gapi.signin2.render('my-signin2', {
	        'scope': 'profile email',
	        'width': 240,
	        'height': 50,
	        'longtitle': true,
	        'theme': 'dark',
	        'onsuccess': onSignIn,
	        'onfailure': onFailure
        });

    }
    $(document).ready(function() {
    	
    });
	</script>
</head>
<body>

    <form id="reg_frm">
        아이디 : <input type="text" id="id"  name="id" size="20"><br>
        비밀번호 : <input type="password" id="pw" name="pw" size="20"><br>
        비밀번호 확인 : <input type="password" id="pw_check"  name="pw_check" size="20"><br>
        이름 : <input type="text" id="name"  name="name" size="20"><br> 
        메일 : <input type="text" id="eMail" name="eMail" size="20"><br>
        주소 : <input type="text" id="address" name="address" size="50"><br><p>
        <input type="button" value="회원가입" onclick="form_check()"> &nbsp;&nbsp;&nbsp; 
        <input type="reset" value="로그인" onclick="javascript:window.location='login.jsp'">
    </form> 
    
    
<!-- 카카오 -->
<div id="login" style="display: block">
    <a id="custom-login-btn" href="javascript:loginWithKakao()">
    <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300"/>
    </a>
</div>


<script type='text/javascript'>
    Kakao.init('90b59e434c81604b37acc0d9032a9bc4');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          //alert(JSON.stringify(authObj));
          signIn(authObj);
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };

    function signIn(authObj) {
        //console.log(authObj);
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                //console.log(res);
                console.log(res.id);
                $('#login').css('display', 'none');
               	$('#logout').css('display', 'block');
                $('#upic').attr('src', res.properties.thumbnail_image );
               	$('#uname').html('[ ' + res.properties.nickname + ' ]');
             }
         })
	}

    function signOut() {
	    Kakao.Auth.logout(function () {
	    	$('#login').css('display', 'block');
	    	$('#logout').css('display', 'none');
	    	$('#upic').attr('src', '');
	    	$('#uname').html('');
	    });
	}
    
    
</script>
<!-- 구글  -->
   <div id="my-signin2"></div>


    <div id="logout" style="display: none;">
    <input type="button" onclick="signOut();" value="로그아웃" /><br>

    <img id="upic" src=""><br>
    <span id="uname"></span>
    </div>
  
    <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
    <!-- 네이버 -->
    
	<div class="container">
		<div class="header clearfix">
			<nav>
				<ul class="nav nav-pills pull-right">
					<li role="presentation" class="active"><a href="#">Home</a></li>
					<li role="presentation"><a id="gnbLogin" href="#">Login</a></li>
				</ul>
			</nav>
			<h3 class="text-muted">Login With NaverID Javascript SDK</h3>
		</div>

			<div id="naverIdLogin">
			<a id="naverIdLogin_loginButton" href="#" role="button"><img src="https://static.nid.naver.com/oauth/big_g.PNG" width=320></a>
			</div>

	</div>


	<!-- /container -->
	
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- (2) LoginWithNaverId Javscript SDK -->
	<script src="naveridlogin_js_sdk_2.0.2.js"></script> 

	<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "xYFengHhmO3oXsJI0fGs",
				callbackUrl: "http://localhost:8081/ANaverLogin/member/login.jsp", 
				isPopup: false,
				loginButton: {color: "green", type: 3, height: 30}
			}
		);
		/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		/* (4-1) 임의의 링크를 설정해줄 필요가 있는 경우 */
		$("#gnbLogin").attr("href", naverLogin.generateAuthorizeUrl());

		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고
					   사용자 정보를 출력합니다. */
					setLoginStatus();
				}
			});
		});

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고
		   사용자 정보를 출력합니다. */
		function setLoginStatus() {
			console.log(naverLogin.user);
			var uid = naverLogin.user.getId();
			var profileImage = naverLogin.user.getProfileImage();
			var uName = naverLogin.user.getName();
			var nickName = naverLogin.user.getNickName();
			var eMail = naverLogin.user.getEmail();
			$("#naverIdLogin_loginButton").html(
					'<br><br><img src="' + profileImage + 
					'" height=50 /> <p>' + uid + "-" + uName + '님 반갑습니다.</p>');
			$("#gnbLogin").html("Logout");
			$("#gnbLogin").attr("href", "#");
			/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
			$("#gnbLogin").click(function () {
				naverLogin.logout();
				location.reload();
			});
		}
	</script>
    
</body>
</html>