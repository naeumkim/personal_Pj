<%@page import="com.tmeal.Upload.UploadDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("utf-8"); 
	String pageNum = request.getParameter("pageNum");
	String id = request.getParameter("id");
	%>
	
	<jsp:useBean id="bb" class ="com.tmeal.Upload.UploadBean"></jsp:useBean>
	<jsp:setProperty property="*" name="bb"/>

	<%
	

	
	
	System.out.println("수정 정보" + bb);
	
	UploadDAO bdao = new UploadDAO();
	int check = bdao.updateBoard(bb,id);
	
	if(check == 1){
			%>
			
			<script type="text/javascript">
			alert("글 수정이 완료되었습니다.")
			location.href = "uploadList.jsp?pageNum=<%=pageNum%>";
			</script>
			
			<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
		alert("작성자만 수정이 가능합니다.")
		location.href = "uploadList.jsp?pageNum=<%=pageNum%>";
		</script>
		<%
	}
	
		
	%>

</body>
</html>