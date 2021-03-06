package com.study.servelt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Hello")  //어노테이션
public class Hello extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		    throws ServletException, IOException 
	{
		System.out.println("Hello World~~");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
		out.print("<head>");
		out.print("<body>");
		out.print("<h1>Hello World~~</h1>");
		out.print("</body>");
		out.print("</head>");
		out.print("</html>");
		
		out.close();
	}
	
}

