<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


<header>
	<div class="wrap">
			<div class="header">
				<div class="searchArea">
				</div>
				<ul class="loginvar">
					<li class="login">
						<%
						String id = (String)session.getAttribute("id");
						if(id == null){ %>
						<a href="../member/loginForm.jsp">
						LOGIN
						<%}else{%>
							<a href="../member/inform.jsp"><%=id %>님</a>							
						<li><a href="../member/logout.jsp">로그아웃</a></li>
							
						<%} %>
						</a>
					</li>
					<li><a href="../member/joinForm.jsp">JOIN</a></li>
				</ul>
			</div>
	</div>
	<div class="wrap">
			<div class="header">
				<div class="searchArea">
					<form action="">
					<input type="search" placeholder="Search">
					<span>검색</span>
					</form>
				</div>
				<ul class="nav">
					<li><a href="../member/main.jsp">HOME</a></li>
					<li><a href="../bestboard/BestList.jsp">BEST</a></li>
					<li><a href="../reviewboard/reviewList.jsp">REVIEW</a></li>
					<li><a href="../uploadboard/uploadList.jsp">공지사항</a></li>
					<li><a href="../aboutboard/about.jsp">ABOUT</a></li>
				</ul>
			</div>
	</div>
	<hr>
</header>