package com.study.jsp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/Service")
public interface Service  { 
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException;
	
}

