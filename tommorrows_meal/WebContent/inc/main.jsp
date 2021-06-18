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
<link rel="stylesheet" type="text/css" href="style.css">
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
				</ul>
			</div>
	</div>
</header>

	


	<div class="intro_bg">
		<div class="intro_text">
			<h1>오늘 고르면 내일 도착</h1>
			<h3 class="contents1">내일의 식사를 커스텀 해보세요.</h3>
		</div>
	</div>
	
	<ul class="amount">
		<li>
			<div>
				<div class="contents1">첫 구매시 무료 배송</div>
				<div class="contents2">05.25 ~ 06.21</div>
			</div>
		</li>
		<li>
			<div>
				<div class="contents1">지방 지역 배송 가능</div>
				<div class="contents2">05.25 ~ 06.21</div>
			</div>
		</li>
		<li>
			<div>
				<div class="contents3">회원 가입시 10000원 쿠폰</div>
				<div class="contents2">05.25 ~ 06.21</div>
			</div>
		</li>
		<li>
			<div>
				<div class="contents1">카카오톡 친구 추가</div>
				<div class="contents2">05.25 ~ 06.21</div>
			</div>
		</li>
		
	</ul>
	
	<div class="main_text0">
        <h1>상품 추천</h1>
        <div class="contents1">신선한 식품관</div>
        
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="image/icon2.svg">
            </div>
            <div class="contents2">오늘의 핫딜</div>
            <div class="contents1_bold">
             	충남 서산 김영식 농부님의 옥수수를 만나보세요. 
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="image/icon0.svg">
            </div>
            <div class="contents2">MD추천</div>
            <div class="contents1_bold">
                MD가 추천하는 이번주의 식품
            </div>
            <div class="more">
              MORE
            </div>
          </li>

          <li>
            <div class="icon_img">
              <img src="image/icon1.svg">
            </div>
            <div class="contents2">한번에 쓸어담기</div>
            <div class="contents1_bold">
            	금요일에만 찾아오는 특가 찬스를 잊지 마세요.
            </div>
            <div class="more">
              MORE
            </div>
          </li>
        </ul>
      </div>
	<br><br><br>
	
	<!-- 두번째 mina text -->
	
	<div class="main_text0">
        <ul class="icons">
          <li>
            <div class="icon_img">
              <img src="image/asparagus.jpg" style="width: 250px; height: 180px">
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
              <img src="image/meat.jpg" style="width: 250px; height: 180px">
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
              <img src="image/yogurt.jpg" style="width: 250px; height: 180px">
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
              <img src="image/corn.jpg" style="width: 250px; height: 180px">
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

      <div class="main_text1">
        <h1>ABOUT</h1>
        <div class="contents1">Tommorrow's meal을 소개합니다.</div>
        <div class="service">
          <div class="food_photo">
            <img src='drink.jpg' style="width: 600px; height: 500px;">
          </div>
          <div class="contents2">
              <h2>오늘 고르는 내일의 한끼</h2>
              한끼한끼가 소중한 당신의 시간을 위해 tommorow's meal이 찾아갑니다. <br>
		좋아하는 음식을 고르기만 하세요 <br>
       	신선한 음식을 내일 새벽 집 앞에 배달해 드립니다. <br><br>
              
              식단관리, 유기농, 파티등 원하는 종류를 골라보세요 <br>
              최고의 재료만 엄선하여 보내드립니다.<br>
              우리는 시골농가와 협력하여 상생을 추구합니다. <br>      
              사실 거짓말 입니다. 이건 컨셉이니까요 <br><br>
              
              왜 자꾸 css를 욕심낼까요 <br>
              인간의 욕심은 끝도 없다더니 이럴때 쓰는 말인가 봅니다. <br><br>
        tommorrow's meal과 함께해주세요 <br>       
              
          </div>
        </div>
      </div>

      <div class="main_text2">
        <ul>
          <li>
            <div><h1>CONTACT</h1></div>
            <div>우리에게 파트너십을 신청하거나, 고객이 되어주세요</div>
            <div class="more2">더 알아보기</div>
          </li>
          <li></li>
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