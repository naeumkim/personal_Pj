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
	<%String id = (String)session.getAttribute("id");
	if(id==null){%>
	<script type="text/javascript">
			var check = confirm("로그인이 필요합니다. 로그인 하시겠습니까?");
			if(check){
				location.href="../member/loginForm.jsp"
			}else{
				location.href="reviewList.jsp"
			}
	</script>
	<%} %>		

	<div class="main-div">
		<div class="main-left" style="padding-right: 550px;">
		</div>
		<div class="main-center" style="text-align: center; width: 800px;">
			<table class="table" style="width: 800px;" >
				<thead>
					<tr>
						<th colspan="2" style="text-align: center; background-color: #336633; color: #fff;">글 작성하기</th>
					</tr>
				</thead>
						<form action="writePro.jsp" method="post">
						<tbody>
						<tr>
						<td>글쓴이</td>
						<td><input type ="text" name = "id" value="<%=id%>" class= "form-control" readonly></td>
						</tr>
						<tr>
						<td>비밀번호</td>
						<td><input type ="text" name = "pass" class= "form-control"></td>
						</tr>
						<tr>
						<td>제목</td>
						<td><input type="text" name = "subject" class= "form-control"></td>
						</tr>
						<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" name ="content" class= "form-control"></textarea></td>
						</tr>
						<tr>
						<td style="text-align: left;"><button type="button" onclick="location.href='reviewList.jsp'" class="btn btn-info">목록으로</button></td>
						<td style="text-align: right;"><input type="submit" value="글쓰기"  class="btn btn-success"></td>
						</tr>
						</tbody>
				</form>
				
			</table>
	
						
						
	 	</div>
		<div class="main-right" >
	 	</div>
	</div>
	
		
		
		

<jsp:include page="../inc/footer-fixed.jsp"/>
</body>
</html>