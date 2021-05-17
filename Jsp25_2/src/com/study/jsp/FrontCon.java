package com.study.jsp;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class FrontCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public FrontCon() {
        super();   
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		System.out.println("doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) 
    	throws ServletException, IOException 
    {
		System.out.println("actionDo");
		
		String uri= request.getRequestURI();
		System.out.println("uri :" + uri);
		String conPath = request.getContextPath();
		System.out.println("conPath :" + conPath);
		String command = uri.substring(conPath.length());
		System.out.println("command :" + command);
		
		if (command.equals("/loginOk.do")) {
			loginOk(request, response);
		} else if (command.equals("/modifyOk.do")) {
			modifynOk(request, response);
		} else if (command.equals("/joinOk.do")) {
			joinOk(request, response);
		} else if (command.equals("/logoutOk.do")) {
			logoutOk(request, response);
		} 
	}
	
    
	public void loginOk(HttpServletRequest request, HttpServletResponse response) 
	    throws ServletException, IOException {
		
		System.out.println("loginOk");
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        
        response.setContentType("text/html; charset=UTF-8");
	    PrintWriter writer = response.getWriter();
        
        MemberDao dao = MemberDao.getInstance();
        int checkNum = dao.userCheck(id, pw);
        if(checkNum == -1) {
        	//html 출력
        	writer.println("<html><head></head><body>");
	    	writer.println("<script language=\"javascript\">");
	    	writer.println("    alert(\"아이디가 존재하지 않습니다.\");");
	    	writer.println("    history.go(-1);");
	    	writer.println("</script>");
	    	writer.println("</body></html>");
	    	writer.close();
	    	
        } else if(checkNum == 0) {
        	//html 출력
        	writer.println("<html><head></head><body>");
	    	writer.println("<script language=\"javascript\">");
	    	writer.println("    alert(\"비밀번호가 틀립니다.\");");
	    	writer.println("    history.go(-1);");
	    	writer.println("</script>");
	    	writer.println("</body></html>");
	    	writer.close();
	    	
        } else if(checkNum == 1) {
           MemberDto dto =dao.getMember(id);
        	
			String name = dto.getName();
        	HttpSession session = request.getSession();
        	
        	session.setAttribute("id", id);
        	session.setAttribute("name", name);
        	session.setAttribute("ValidMem", "yes");
        	response.sendRedirect("main.jsp");
        }
	}
	
	public void modifynOk(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		System.out.println("modifynOk");
		
		request.setCharacterEncoding("UTF-8");
		String pw= request.getParameter("pw");
		String eMail= request.getParameter("eMail");
		String address= request.getParameter("address");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
	    
		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setPw(pw);
		dto.seteMail(eMail);
		dto.setAddress(address);
		
		MemberDao dao = MemberDao.getInstance();
	    int ri = dao.updateMember(dto);
	    
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter writer = response.getWriter();	    
	    
	    if(ri == 1) {
	    	//html 출력
        	writer.println("<html><head></head><body>");
	    	writer.println("<script language=\"javascript\">");
	    	writer.println("    alert(\"정보가 수정되었습니다.\");");
	    	writer.println("    history.back();");
	    	writer.println("</script>");
	    	writer.println("</body></html>");
	    	writer.close();
	    	
	    } else   {
		    	//html 출력
	        	writer.println("<html><head></head><body>");
		    	writer.println("<script language=\"javascript\">");
		    	writer.println("    alert(\"정보수정에 실패했습니다.\");");
		    	writer.println("    history.go(-1);");
		    	writer.println("</script>");
		    	writer.println("</body></html>");
		    	writer.close();
	    }
	}
	
	public void joinOk(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
				
			System.out.println("joinOk");
				
			request.setCharacterEncoding("UTF-8");
			String id= request.getParameter("id");
		    String pw= request.getParameter("pw");
		    String name= request.getParameter("name");
		    String eMail= request.getParameter("eMail");
		    String address= request.getParameter("address");	
				
		    MemberDto dto = new MemberDto();
		    dto.setId(id);
		    dto.setPw(pw);
		    dto.setName(name);
		    dto.seteMail(eMail);
		    dto.setAddress(address);
		    dto.setrDate(new Timestamp(System.currentTimeMillis()));
		    
		    response.setContentType("text/html; charset=UTF-8");
		    PrintWriter writer = response.getWriter();
		    
		    MemberDao dao = MemberDao.getInstance();
		    if (dao.confirmId(dto.getId()) == MemberDao.MEMBER_EXISTENT) {
		    	//html 출력
		    	
		    	writer.println("<html><head></head><body>");
		    	writer.println("<script language=\"javascript\">");
		    	writer.println("    alert(\"아이디가 이미 존재 합니다.\");");
		    	writer.println("    history.back();");
		    	writer.println("</script>");
		    	writer.println("</body></html>");
		    	writer.close();
		    } else {
		    	int ri = dao.insertMember(dto);
		    	if (ri== MemberDao.MEMBER_JOIN_SUCCESS) {
		    		HttpSession session = request.getSession();
		    		session.setAttribute("id", dto.getId());
		    		//html 출력
		    		
		    		writer.println("<html><head></head><body>");
			    	writer.println("<script language=\"javascript\">");
			    	writer.println("    alert(\"회원가입을 축하 합니다.\");");
			    	writer.println("    history.back();");
			    	writer.println("</script>");
			    	writer.println("</body></html>");
			    	writer.close();
			    	
		    	} else {
		    		//html 출력
		    		writer.println("<html><head></head><body>");
			    	writer.println("<script language=\"javascript\">");
			    	writer.println("    alert(\"회원가입에 실패했습니다.\");");
			    	writer.println("    history.back();");
			    	writer.println("</script>");
			    	writer.println("</body></html>");
			    	writer.close();
		    	}
		    }
		}
	
	public void logoutOk(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		System.out.println("logout");
		
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	
}









