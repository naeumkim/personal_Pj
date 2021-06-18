package com.tmeal.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tmeal.member.TmealDAO;

public class replyServlet extends HttpServlet{

	public replyServlet() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("get왔음");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post 호출");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		String repid = request.getParameter("repid");
		String repcontent = request.getParameter("repcontent");
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		String reply_date = request.getParameter("reply_date");
		System.out.println("정보 가져오기성공");
		
		PrintWriter out = response.getWriter();
		
		replyDAO rep = new replyDAO();
		 int result = rep.insertreply(repid,repcontent,board_no,reply_date);
		 
		 
		 out.write(result + " ");
		 out.close();
		 
		
		
	}

	
	
	
}
