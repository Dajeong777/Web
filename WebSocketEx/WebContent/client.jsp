<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>채팅 기능</title>
</head>
<body>
<% 
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    
    if (id == null) {
%>
    
    <jsp:forward page="login.jsp" /> 
    
<%
    } else {
    	session.setAttribute("uid", id);
    	System.out.println(id);
    }
%>
    <div>
        사용자 아이디 : <%= id %>
    </div>
    <div>
        <input type="text" id="messageinput" />
    </div>
    <div>
        <button type="button" onclick="openSocket();">Open</button>
        <button type="button" onclick="send();">Send</button>
        <button type="button" onclick="closeSocket();">Close</button>
    </div>
    <!-- Server response get written here -->
    <div id="messages"></div>
    
    <!-- Script to utilise the WebSocket -->
    <script type="text/javascript">
        var webSocket;
        var messages = document.getElementById("messages");
        
        function openSocket() {
        	//alert("aaa");
        	if (webSocket !=undefined && webSocket.readyState != WebSocket.CLOSED) {
        		writeResponse("WebSocket is already opened.")
        		return;
        	}
        	webSocket = new WebSocket ("ws://192.168.0.50:8081/WebSocketEx/websocketendpoint2");
        	//alert("aaa");
        	webSocket.onopen = function(event) {
        		//alert("aaa");
        		if (event.data == undefined)
        			return;
        		writeResponse(event.data);
        	};
        	webSocket.onmessage = function(event) {
        		writeResponse(event.data);
        	};
        	webSocket.onclose = function(event) {
        		writeResponse("Connection closed");
        	};
        }
        
        function send() {
        	var id = "<%= id %>";
        	var text = document.getElementById("messageinput").value;
        	webSocket.send(id + "|" + text);
        }
        
        function closeSocket() {
        	webSocket.close();
        }
        
        function writeResponse(text) {
        	messages.innerHTML += "<br/>" + text;
        }
        
    </script>

</body>
</html>



