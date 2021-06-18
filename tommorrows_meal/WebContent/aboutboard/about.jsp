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
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">

<script src="../js/bootstrap.js"></script>
<!-- css -->


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dc31959c987a70e6f7cc4a042f7788f"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					    mapOption = {
					        center: new kakao.maps.LatLng(35.15843280614342, 129.0620322176392), // 지도의 중심좌표
					        level: 3, 
					        mapTypeId : kakao.maps.MapTypeId.ROADMAP 
					    }; 
			
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			
					var mapTypeControl = new kakao.maps.MapTypeControl();
			
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	
			
					var zoomControl = new kakao.maps.ZoomControl();
			
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
					kakao.maps.event.addListener(map, 'center_changed', function () {
						console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
					});
			
					kakao.maps.event.addListener(map, 'zoom_changed', function () {
						console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
					});
			
					var marker = new kakao.maps.Marker({
					    position: new kakao.maps.LatLng(35.15843280614342, 129.0620322176392), // 마커의 좌표
					    map: map // 마커를 표시할 지도 객체
					});
					
					var infowindow = new kakao.maps.InfoWindow({
					    content : '<div style="padding:5px; ">tommorows meal</div>' // 인포윈도우에 표시할 내용
					});
			
					infowindow.open(map, marker);
			
				
					
				</script>


<title>ABOUT</title>
</head>
<body>

<jsp:include page="../inc/header.jsp"/>
	<p style="padding:0 0 70px 0; "></p>
	<div class="main-div" style="height: 500px;">
		<div class="main-left">
		</div>
				<div class="main-center " style="display: flex;">
						
						<div id="map" style="width:500px; height:400px;"></div>
						
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dc31959c987a70e6f7cc4a042f7788f"></script>
						<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new kakao.maps.LatLng(35.15843280614342, 129.0620322176392), // 지도의 중심좌표
							        level: 3, 
							        mapTypeId : kakao.maps.MapTypeId.ROADMAP 
							    }; 
					
							var map = new kakao.maps.Map(mapContainer, mapOption); 
					
							var mapTypeControl = new kakao.maps.MapTypeControl();
					
							map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	
					
							var zoomControl = new kakao.maps.ZoomControl();
					
							map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					
							kakao.maps.event.addListener(map, 'center_changed', function () {
								console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
							});
					
							kakao.maps.event.addListener(map, 'zoom_changed', function () {
								console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
							});
					
							var marker = new kakao.maps.Marker({
							    position: new kakao.maps.LatLng(35.15843280614342, 129.0620322176392), // 마커의 좌표
							    map: map // 마커를 표시할 지도 객체
							});
							
							var infowindow = new kakao.maps.InfoWindow({
							    content : '<div style="padding:5px; ">tommorows meal</div>' // 인포윈도우에 표시할 내용
							});
					
							infowindow.open(map, marker);
							
						</script>
			 	
			 	<div style="padding-left: 400px;">
			 		<jsp:include page="mailForm.jsp"/>
			 	</div>
			 	
			</div>
			 	
			 	
			 	
		<div class="main-right" >
	 	</div>
	</div>
	<div>
	
	<jsp:include page="../inc/footer-fixed.jsp"/>
	</div>
</body>
</html>