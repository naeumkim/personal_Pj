<%@page import="sun.nio.cs.HistoricallyNamedCharset"%>
<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<% 
	String id =(String)session.getAttribute("id");
	
	if(id == null){
		System.out.println("[UpdatePro.jsp] :  아이디 없음 > 로그인 페이지로 이동");
		response.sendRedirect("loginForm.jsp");
	}
	
	request.setCharacterEncoding("utf-8");
	
	
	
	%>
	
	<jsp:useBean id="mb" class="com.tmeal.member.tmmemberbean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
		TmealDAO tmdo = new TmealDAO();
		
	int result = tmdo.updateForm(mb);
	
	if(result == 1){%>
		<script type="text/javascript">
		alert("회원번호 수정이 완료 되었습니다.");
		</script>
		<%response.sendRedirect("main.jsp");
	}else if(result == -1){%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");		
	history.back();
	</script>
	<%}else if(result == -2){%>
	<script type="text/javascript">
		alert("새비밀번호가 일치하지 않습니다");
		history.back();
	</script>
	<%}else if(result == 2){%>
	<script type="text/javascript">
		alert("회원번호 수정이 완료 되었습니다.");
	</script>
	<%} %>
	
	
</body>
</html>