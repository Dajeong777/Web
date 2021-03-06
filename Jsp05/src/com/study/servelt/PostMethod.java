package com.study.servelt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostMethod")
public class PostMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException 
	{
		System.out.println("doGet");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>Get 방식입니다. <br>따라서 get 메서드가 호출되었습니다.</h1>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException 
	{
		System.out.println("doPost");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>Post 방식입니다. <br>따라서 doPost 메서드가 호출되었습니다.</h1>");
		out.print("</body>");
		out.print("</html>");
		
		out.close();
	}
	
}
