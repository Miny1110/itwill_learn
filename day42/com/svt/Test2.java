package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//get방식으로 데이터를 보낼 때 처리할 코딩을 작성
		
		
/*		//1. ServletConfig 인터페이스 
		ServletConfig config = getServletConfig();
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		//2. ServletContext 인터페이스
		ServletContext context = getServletContext();
		String gender = context.getInitParameter("gender");
		
		
		resp.setContentType("text/html;charset=utf-8");
		//이 코드를 작성하지 않으면 받는 파일이 어떤 파일인지 모른다.		
		
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("name: " + name + "<br/>");
		out.print("age: " + age + "<br/>");
		out.print("gender: " + gender + "<br/>");
		out.print("</body></html>");*/
		
		doPost(req, resp);
		//코딩은 한 곳에 하고 한쪽에는 다른 쪽으로 넘어가게 토스해주는 코딩을 적어준다.
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//post방식으로 데이터를 보낼 때 처리할 코딩을 작성
		
		
		//1. ServletConfig 인터페이스 
		ServletConfig config = getServletConfig();
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		//2. ServletContext 인터페이스
		ServletContext context = getServletContext();
		String gender = context.getInitParameter("gender");
		
		
		resp.setContentType("text/html;charset=utf-8");
		//이 코드를 작성하지 않으면 받는 파일이 어떤 파일인지 모른다.		
		
		PrintWriter out = resp.getWriter();
		
		out.print("<html><body>");
		out.print("name: " + name + "<br/>");
		out.print("age: " + age + "<br/>");
		out.print("gender: " + gender + "<br/>");
		out.print("</body></html>");
		
	}
	
	
}
