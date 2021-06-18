<%@page import="com.tmeal.board.BoardDAO"%>
<%@page import="com.tmeal.board.BoardBean"%>
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
request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="tb" class="com.tmeal.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="tb"/>

<%System.out.println(tb);


tb.setIp(request.getRemoteAddr());

BoardDAO tbao = new BoardDAO();

tbao.insertboard(tb);

response.sendRedirect("reviewList.jsp");


%>



</body>
</html>