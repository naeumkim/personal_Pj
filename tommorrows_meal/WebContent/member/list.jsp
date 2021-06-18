<%@page import="java.util.ArrayList"%>
<%@page import="com.tmeal.member.tmmemberbean"%>
<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">
<title>관리자 창</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	<%
		String id = (String)session.getAttribute("id");
		
	if(id==null || !id.equals("admin")){
		System.out.println("[info.jsp] 아이디 null > login.jsp ");
		response.sendRedirect("loginForm.jsp");
	}
	%>
	

	<%
	TmealDAO tmdo = new TmealDAO();
	ArrayList viewlist = tmdo.viewlist();
 	%>
	
	<table class="table">
	 <thead class="thead-dark">
   <tr>
     <th scope="col">아이디</th>
     <th scope="col">비밀번호</th>
     <th scope="col">이름</th>
     <th scope="col">연락처</th>
     <th scope="col">이메일</th>
     <th scope="col">주소</th>
     <th scope="col">성별</th>
     <th scope="col">생년월일</th>
     <th scope="col">가입일자</th>
   </tr>
 </thead>
 
  <tbody>	
	<%
	for(int i=0;i<viewlist.size();i++){
	tmmemberbean mb = (tmmemberbean)viewlist.get(i);
	%>
	
    <tr>
	<td><%=mb.getId() %></td>
	<td><%=mb.getPw() %></td>
	<td><%=mb.getName() %></td>
	<td><%=mb.getPhoneNumber() %></td>
	<td><%=mb.getEmail() %></td>
	<td><%=mb.getAddress() %></td>
	<td><%=mb.getGender() %></td>
	<td><%=mb.getBirth() %></td>
	<td><%=mb.getRegdate() %></td>
    </tr>
	<%}%>
  </tbody>
</table>
	
	<input type="button" class="btn btn-outline-info" onclick="location.href='inform.jsp'" value="돌아가기">
	

	
	
</body>
</html>