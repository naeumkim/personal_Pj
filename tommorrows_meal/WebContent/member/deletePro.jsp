<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
		
	
	%>
	
	
	<jsp:useBean id="mb" class="com.tmeal.member.tmmemberbean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	
	TmealDAO tmdo = new TmealDAO();
	
	int result = tmdo.deleteinfo(mb);
		
	if(result == 1){
	session.invalidate();	
	%>
		<script type="text/javascript">
		alert("탈퇴가 완료 되었습니다.");
		location.href = "main.jsp";
		</script>
	<%}else if(result == -3){%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다");
		location.href = "deleteForm.jsp";
		</script>
	<%}else if(result == -1){%>
	<script type="text/javascript">
		alert("존재하지 않는 아이디입니다");
		history.back();
		</script>
	<%}%>
	
	
	
</body>
</html>