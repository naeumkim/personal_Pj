package com.tmeal.idcheck;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmeal.member.TmealDAO;


public class idcheckServlet extends HttpServlet{
	
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get왔음");
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 post 호출 완료");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		String id = request.getParameter("id");
		PrintWriter out = response.getWriter();
		TmealDAO tmao= new TmealDAO(); 
		 int check =tmao.idcheck(id);
		 
		 out.write(check + " ");
		 out.close();
		 
		 
	}

	
	
	
	
}
