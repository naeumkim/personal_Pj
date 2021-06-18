<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


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
<style type="text/css">



</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>

	<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("id");
	%>
	
	
	
		<section class="MOD_BOXMESSAGE1">
	 	<div class="MOD_BOXMESSAGE1_Message" data-theme="_bo1"> 
	    <h5>본인 확인을 위해 비밀번호를 입력해주세요.</h5>
	    <p>
			<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
				<input type="hidden" name="num" value="<%=num %>">	
				<input type="text"name ="pass"><br>
				<hr>
				<input type="submit" value="삭제하기" class="btn btn-outline-danger">
			</form>
	    </p>
	  	</div>
 		</section>
	
<jsp:include page="../inc/footer-fixed.jsp"/>

</body>
</html>