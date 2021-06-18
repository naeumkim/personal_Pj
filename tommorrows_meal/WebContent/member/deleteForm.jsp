<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--css  -->
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../css2/assets/css/style.min.css">
<link rel="stylesheet" href="../css2/assets/css/modules.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

<!--css  -->
<title>tommorrow's meal login</title>
</head>
<body>

<title>회원 탈퇴</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	<%
	String id = (String)session.getAttribute("id");
	

	if(id==null){
		System.out.println("[info.jsp] 아이디 null > login.jsp ");
		response.sendRedirect("loginForm.jsp");
	}
	%>
	
	
	<section class="MOD_BOXMESSAGE1">
 	<div class="MOD_BOXMESSAGE1_Message" data-theme="_bo1">
    <h4>본인 확인을 위해 비밀번호를 입력해주세요.</h4>
    <p>
    <fieldset>
	<form action="deletePro.jsp" method="post" >
	<input type="hidden" name="id" value="<%=id%>">
	<input type="password" name="pw">
	<input type="submit" value="탈퇴하기" class="btn btn-outline-danger">
	</form>
	</fieldset>
    </p>
  </div>


</section>
	
</body>
</html>