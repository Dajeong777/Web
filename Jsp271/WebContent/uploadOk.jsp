<%@page import="java.util.Enumeration" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="org.json.simple.JSONArray" %>
<%@page import="org.json.simple.JSONObject" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
    String path = request.getRealPath("fileFolder");
    //out.println(path);
    
    int size = 1024 * 1024 * 10; //10m
    String file= "";
    String oriFile= "";
    
    try {
    	MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
    	
    	Enumeration files = multi.getFileNames();
    	String str = (String)files.nextElement();
    	
    	file = multi.getFilesystemName(str);
    	oriFile = multi.getOriginalFileName(str);
    } catch  (Exception e) {
        e.printStackTrace();
    }
    
    JSONObject obj = new JSONObject();
    obj.put("sucess", new Integer(1));
    obj.put("desc", "성공");
    
    out.println(obj.toJSONString());
 %>
    