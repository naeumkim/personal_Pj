<%@page import="java.sql.Timestamp"%>
<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	request.setCharacterEncoding("UTF-8");

	
	%>
	
	<jsp:useBean id="mb" class="com.tmeal.member.tmmemberbean"></jsp:useBean>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	
	mb.setRegdate(new Timestamp(System.currentTimeMillis()));
		
	TmealDAO tmdo = new TmealDAO();
	
	 int result = tmdo.join(mb);
	 
	 if(mb.getPw().equals(mb.getPwck())){
	 
	 
			 if(result == 0){%>
				<script type="text/javascript">
					alert("이미 가입되어있는 회원입니다.");
					history.back();	
					
					</script>
				 
				 
			 <%}else if(result== 1){%>	
			
			<script type="text/javascript">
			alert("회원가입 성공");
			location.href = "loginForm.jsp";
			
			</script>
			
			<%} 
	 }else{%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();	
		</script>
	<%}%>
	
	
	
	
</body>
</html>