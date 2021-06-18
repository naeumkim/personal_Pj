<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!--css  -->
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">
<!--css  -->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>

	<%String id = (String)session.getAttribute("id");
	if(id==null || !id.equals("admin")){%>
	<script type="text/javascript">
			var check = confirm("접근 가능한 상태가 아닙니다.");
			if(check){
				location.href="../member/main.jsp"
			}else{
				location.href="fWriteForm.jsp"
			}
	</script>
	<%} %>	
	

	<div class="main-div">
		<div class="main-left" style="padding-right: 550px;">
		</div>
		<div class="main-center" style="text-align: center; width: 800px;">
			<table class="table" style="width: 800px;">
				<thead class="thead-dark">
					<tr>
						<th colspan="2" style="text-align: center; background-color: #336633;">글 작성하기</th>
					</tr>
				</thead>
					<form action="fWritePro.jsp" method="post" enctype="multipart/form-data">
						<tbody>
						<tr>
						<td>글쓴이</td>
						<td><input type="text" name="name" class= "form-control"></td>
						</tr>
						<tr>
						<td>비밀번호</td>
						<td><input type="text" name="pass" class= "form-control"></td>
						</tr>
						<tr>
						<td>제목</td>
						<td><input type="text" name = "subject" class= "form-control"></td>
						</tr>
						<tr>
						<td>파일</td>
						<td><input type="file" name="filename" class= "form-control"></td>
						</tr>
						<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="30" name ="content" class= "form-control"></textarea></td>
						</tr>
						<tr>
						<td style="text-align: left;"><button type="button" onclick="location.href='uploadList.jsp'" class="btn btn-info">목록으로</button></td>
						<td style="text-align: right;"><input type="submit" value="글쓰기"  class="btn btn-success"></td>
						</tr>
						</tbody>
				</form>
			</table>
						
						
	 	</div>
		<div class="main-right" >
	 	</div>
	</div>
	
<jsp:include page="../inc/footer.jsp"/>
</body>
</html>