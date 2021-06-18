<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<link rel="stylesheet" type="text/css" href="../inc/style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">
<head>
<title>자바 메일 보내기 폼</title>
</head>
<body>


<table class="table" style="width: 500px; height: 500px;">
	<form action="mailSend.jsp" method="post">
	<thead class="thead-light">
		<tr>
			<th colspan="2" style="text-align: center; background-color: #336633;" ><p id="font-set" style="color: #fff;">메일로 문의 하기</p></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>보내는 사람</td>
			<td><input type="text" name="sender" class="form-control"></td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<td><input type="text" name="receiver" class="form-control"></td></tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="subject" class="form-control"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content" cols=30 rows=7 class="form-control"></textarea></td>
		</tr>
		<tr>
		<td align=center colspan=2><input type="submit" value="보내기" class="btn btn-success"></td>
		</tr>
	</tbody>
</form>
</table>

</body>
</html>
