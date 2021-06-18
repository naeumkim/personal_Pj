<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!--css -->
<!--style css  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">
<link rel="stylesheet" type="text/css" href="../inc/main.css">
<!--style css  -->


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="allstyle.css" rel="stylesheet">
<script src="../js/bootstrap.js"></script>

<!--css -->
<title>tommorrow's meal</title>
</head>
<body>
	
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
					<li><a href="#">고객문의</a></li>
					<li><a href="../aboutboard/about.jsp">ABOUT</a></li>
				</ul>
			</div>
	</div>
</header>

	
<hr>
	<div style="text-align: center; padding-top: 80px;">
    <h1><b>BEST</b></h1>
    <div class="contents1">이 달의 베스트</div>
    </div>    
	
	

	<br><br><br>
	
	<!-- 두번째 mina text -->
	
	<div class="main_text_best" style="padding-top: 100px;">
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="../inc/image/asparagus.jpg" style="width: 250px; height: 180px">
            </div>
            <b><div class="contents1_bold">아스파라거스 샐러드</div></b>
            <div>
             	11% 할인  8590원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../inc/image/meat.jpg" style="width: 250px; height: 180px">
            </div>
            <b><div class="contents1_bold">티본 스테이크</div></b>
            <div>
             	25% 할인  21900원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../inc/image/yogurt.jpg" style="width: 250px; height: 180px">
            </div>
            <b><div class="contents1_bold">그릭 요거트</div></b>
            <div>
             	50% 6200원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../inc/image/corn.jpg" style="width: 250px; height: 180px">
            </div>
          	<b><div class="contents1_bold">초당옥수수</div></b>
            <div>
             	8% 할인  14800원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>
        </ul>
      </div>
      
      
	<!-- 세번째 mina text -->
	
	<div class="main_text_best" style="padding-top: 100px;">
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="../inc/image/asparagus.jpg" style="width: 250px; height: 180px">
            </div>
            <b><div class="contents1_bold">아스파라거스 샐러드</div></b>
            <div>
             	11% 할인  8590원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../inc/image/meat.jpg" style="width: 250px; height: 180px">
            </div>
            <b><div class="contents1_bold">티본 스테이크</div></b>
            <div>
             	25% 할인  21900원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../inc/image/yogurt.jpg" style="width: 250px; height: 180px">
            </div>
            <b><div class="contents1_bold">그릭 요거트</div></b>
            <div>
             	50% 6200원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="../inc/image/corn.jpg" style="width: 250px; height: 180px">
            </div>
          	<b><div class="contents1_bold">초당옥수수</div></b>
            <div>
             	8% 할인  14800원 
            </div>
            <div class="more">
              MORE
            </div>
          </li>
        </ul>
      </div>

  


      <div class="footer">
        <div>LOGO</div>
        <div>
          CEO. 타모디자인 <br>
          Addr. 서울특별시 금천구 가산1로 280-3 우림하이엔드타워 6차 14F 고객상담실 Fax/Tel. <br>
          02 - 223 -2912~5 <br>
          COPYRIGHT 2019. TAMO. ALL RIGHT RESERVED.
        </div>
      </div>

</body>
</html>