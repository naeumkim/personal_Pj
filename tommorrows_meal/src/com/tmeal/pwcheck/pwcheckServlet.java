package com.tmeal.pwcheck;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmeal.member.TmealDAO;

public class pwcheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("get 호출");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post호출 완료");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		PrintWriter out = response.getWriter();
		TmealDAO tmao= new TmealDAO(); 
		 int result =tmao.pwcheck(id, pw);
		 System.out.println("result 값 전달 " + result);
		 out.write(result + " ");
		 out.close();
		
		
	}
	
	
	
}
