<%@page import="com.tmeal.Upload.UploadDAO"%>
<%@page import="com.tmeal.board.BoardDAO"%>
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
	String pageNum = request.getParameter("pageNum");
%>

	<jsp:useBean id="bb" class="com.tmeal.Upload.UploadBean"></jsp:useBean>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	UploadDAO bdao = new UploadDAO();
	
	int check = bdao.deleteBoard(bb);
	
	if(check ==1 ){
		%>
		<script type="text/javascript">
		alert("글이 삭제되었습니다.");
		location.href="uploadList.jsp?pageNum=<%=pageNum%>"
		</script>
		<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.back();
		</script>
	<%}else{%>
		<script type="text/javascript">
		alert("존재하지 않는 글입니다.");
		history.back();
		</script>
	<% }%>
	
</body>
</html>