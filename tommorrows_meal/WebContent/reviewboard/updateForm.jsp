<%@page import="com.tmeal.board.BoardBean"%>
<%@page import="com.tmeal.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!--css  -->
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">
<!--css  -->


<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	<%
	
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String id = (String)session.getAttribute("id");
	BoardDAO bdao = new BoardDAO();
	
	BoardBean bb = bdao.getBoard(num);
	
	%>
	
	
	<div class="main-div">
		<div class="main-left" style="padding-right: 550px;">
		</div>
		<div class="main-center" style="text-align: center; width: 800px;">
			<table class="table" style="width: 800px;" >
				<thead class="thead-dark">
					<tr>
						<th colspan="2" style="text-align: center;">글 수정하기</th>
					</tr>
				</thead>
					<form action="updatePro.jsp?pageNum=<%=pageNum%>" method="post">
						<input type="hidden" name="num" value="<%=bb.getNum()%>">
						<input type="hidden" name="id" value="<%=id%>">
						<tr>
						<td>글쓴이</td>
						<td><input type="text" name="id" value="<%=bb.getId() %>"  class="form-control" readonly></td>
						</tr>
						<tr>
						<td>제목</td>
						<td><input type="text" name="subject" value="<%=bb.getSubject() %>"  class="form-control"> <br></td>
						</tr>
						<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" name="content" class="form-control"><%=bb.getContent() %></textarea></td>
						</tr>
						<tr>
						<td colspan="2" style="text-align: center;"><input type="submit" value="수정하기" class="btn btn-info"></td>
						</tr>
				</form>
			</table>
						
						
	 	</div>
		<div class="main-right" >
	 	</div>
	</div>
	
	
</body>
</html>