<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!--css  -->
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">
<!--css  -->

<style>
thead {background-color: dark-gray;}
thead {color: white;}
</style>
</head>
<body>



<jsp:include page="../inc/header.jsp"/>
	<%

	request.setCharacterEncoding("utf-8");
	
	
	String id = (String)session.getAttribute("id");
	
	if(id==null){
		System.out.println("[info.jsp] 아이디 null > login.jsp ");
		response.sendRedirect("loginForm.jsp");
	}
	
	%>
	
	<jsp:useBean id="mb" class="com.tmeal.member.tmmemberbean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	
	TmealDAO tmdo = new TmealDAO();
	
	tmdo.tmember_info(mb,id);
	
	%>
	
	

	<div class="main-div">
		<div class="main-left">
		</div>
			<div class="main-center">	
				<table class="table">
				  <thead class="thead-light">
				    <tr>
				      <th scope="col" colspan="2">나의 회원 정보</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">아이디</th>
				      <td><%=id %></td>
				    
				    </tr>
				    <tr>
				      <th scope="row">이름</th>
				      <td><%=mb.getName() %></td>
				    </tr>
				    <tr>
				      <th scope="row">전화번호</th>
				      <td><%=mb.getPhoneNumber() %></td>
				    </tr>
				    <tr>
				      <th scope="row">이메일</th>
				      <td><%=mb.getEmail() %></td>
				    </tr>
				    <tr>
				      <th scope="row">주소</th>
				      <td><%=mb.getAddress() %></td>
				    </tr>
				    <tr>
				    <%if(mb.getBirth() !=null){ %>
				      <th scope="row">성별</th>
				      <td><%=mb.getGender() %></td>
				     	<%}else{
				   		System.out.println("입력되지 않음");
				   	} %>
				    </tr>
				    <tr>
				      <th scope="row">생년월일</th>
						<%if(mb.getBirth() !=null){ %>
				      <td><%=mb.getBirth()%></td>
				   	<%}else{
				   		System.out.println("입력되지 않음");
				   	} %>
				    </tr>
				  </tbody>
				</table>
				<br>
				
				<button type="button" class="btn btn-outline-info" onclick="location.href='updateForm.jsp'">회원정보 수정</button>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='deleteForm.jsp'">회원 탈퇴</button>	
				
				<% if(id.equals("admin")){ %>
				<button type="button" class="btn btn-outline-warning" onclick="location.href='list.jsp'">회원 관리</button>	
				<% } %>
				
				 </div>
		 	
			<div class="main-right" >
	 		</div>
		</div>
		
</body>
</html>