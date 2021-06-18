<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">


$(function(){

$("#reWrite-btn").click(function(){
	 var v= $('#content').val();

	alert(v);
	
	
	});



});


</script>


<title>Insert title here</title>


</head>
<body>
	<%String id = (String)session.getAttribute("id");%>
	
	
	
	<form method="post">
	<table border="1">
		<thead>
			<th colspan="4">댓글을 작성해보세요.</th>
		</thead>
		<tbody>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="id" id="id" class= "form-control"></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><textarea rows="5" cols="100" name ="content" id ="content" class= "form-control"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="댓글쓰기" id="reWrite-btn"></td>
			</tr>
		</tbody>
	</table>
	</form>
</body>
</html>