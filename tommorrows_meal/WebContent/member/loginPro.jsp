<%@page import="com.tmeal.member.tmmemberbean"%>
<%@page import="com.tmeal.member.TmealDAO"%>
<%@page import="sun.security.mscapi.CKeyPairGenerator.RSA"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tommorrow's meal login</title>
</head>
<body>
<h1>loginPro</h1>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pw = request.getParameter("pw");

%>
<jsp:useBean id="tm" class="com.tmeal.member.tmmemberbean"></jsp:useBean>
<jsp:setProperty property="*" name="tm"/>


<%

TmealDAO mbdo = new TmealDAO();

int result = mbdo.login(tm);

if(result == 1){
		
		session.setAttribute("id", tm.getId());
		response.sendRedirect("main.jsp");
		
	}else if(result == 0){
		
		%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
		
		<%		
	}else if(result == -1){
	%>
	<script type="text/javascript">
	var result = confirm("비회원입니다. 회원가입 하시겠습니까?");
		if(result){
		location.href ="joinForm.jsp";

		}else{
		history.back();
		}
	</script>
	<%	
}
%>


</body>
</html>