<%@page import="com.tmeal.Upload.UploadDAO"%>
<%@page import="com.tmeal.Upload.UploadBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	String realPath = request.getRealPath("/upload");
	System.out.println("실제 저장위치 : " + realPath);
		
	int maxSize = 10 * 1024 * 1024;

	MultipartRequest multi = new MultipartRequest(
			request,
			realPath,
			maxSize,
			"UTF-8",
			new DefaultFileRenamePolicy()
			);

	
	
	
	UploadBean bb = new UploadBean();
	
	bb.setName(multi.getParameter("name"));
	bb.setPass(multi.getParameter("pass"));
	bb.setSubject(multi.getParameter("subject"));
	bb.setContent(multi.getParameter("content"));
	
	bb.setFile(multi.getFilesystemName("filename"));
	bb.setIp(request.getRemoteAddr());
	
	UploadDAO bdao = new UploadDAO();
	bdao.insertboard(bb);
	
	response.sendRedirect("uploadList.jsp");


	%>
</body>
</html>