
<%@page import="com.tmeal.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tmeal.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- css -->

<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">

<script src="../js/bootstrap.js"></script>
<!-- css -->
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	
	
	<%
	String id = (String)session.getAttribute("id");
	
	BoardDAO bdao = new BoardDAO();
	
	int cnt = bdao.getBoardCount();
			
	int pageSize = 5;
	
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	int endRow = currentPage*pageSize;
	
	//ArrayList boardList = bdao.getBoardList();
	ArrayList boardList = bdao.getBoardList(startRow,pageSize);
	%>

	<div class="main-div">
		<div class="main-left">
		</div>
			
			<div class="main-center">
			
				<div class="msg">
					<ul>
						<li>
							<h5 id="font-set" style="padding: 50px 0 10px 0;">총 <b style="color: #2F9D27"><%=cnt %></b>개의 리뷰가 있습니다.</h5>
							</li>
							<li>
							<%if(id != null){ %>
						
							<h5 id="font-set"><b style="color: #2F9D27"><%=id %></b>님의 리뷰를 남겨보세요.</h5>
								
							<%}else{%>
							
							<h5 id="font-set">로그인 하시고 리뷰를 남겨보세요</h5>
							<%}%>
						</li>			
					</ul>	
				</div>
				
			
				
				<table class ="table table-hover">
					<thead style="background-color: #F6F6F6;">
					<tr>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					</tr>
					</thead>
					<tbody>
					<%
					for(int i=0;i<boardList.size();i++){
						BoardBean bb = (BoardBean)boardList.get(i);
					%>
					<tr>
					<td>
					<a href="contents.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>">
					<%=bb.getSubject() %> 
					</td>
					<td><%=bb.getId() %></td>
					<td><%=bb.getDate() %></td>
					<td><%=bb.getReadcount() %></td>
					</tr>		
					<%} %>	
					</tbody>
				</table>
				<br>
				
				<div class="number_button" style="display: flex;">
					
					<div class="numbers"  style="font-size: 20px; text-align: left; width: 50%;">
						
						  <ul class="pagination">
								    	<%
								if(cnt != 0 ){
									
									int pageCount = cnt / pageSize + (cnt  % pageSize == 0? 0:1);
									
									int pageBlock = 2;
									
									int startPage = ((currentPage-1)/pageBlock) * pageBlock +1;
									
									int endPage = startPage + pageBlock-1;
									
									if(endPage > pageCount){
										endPage = pageCount;
									}
								
									if(startPage > pageBlock){
										%>
										<li class="page-item"><a class="page-link" href="reviewList.jsp?pageNum=<%=startPage-pageBlock%>">Previous</a></li>
										<%
									}
									
									//숫자 1....5
									for(int i=startPage;i<=endPage;i++){
										%>
										<li class="page-item"><a class="page-link" href="reviewList.jsp?pageNum=<%=i%>"><%=i %></a></li>
										<%
									}
									
									//다음 (기존의 페이지 블럭보다 페이지의 수가 많을때)
									if(endPage < pageCount){
										%>
										<li class="page-item"><a class="page-link" href="reviewList.jsp?pageNum=<%=startPage+pageBlock%>">Next</a></li>
										<%
									}
								}
								%>
						    
						  </ul>
							
					</div>
					<div class="writebutton" style="text-align: right; width: 50%; ">
						<button type="button" class="btn btn-info"  onclick="location.href='writeForm.jsp'">글쓰기</button>
					</div>
				
		 			</div>
		 	
			<div class="main-right" >
	 		</div>
		</div>
	</div>
		
		
		
<jsp:include page="../inc/footer-fixed.jsp"/>
</body>
</html>