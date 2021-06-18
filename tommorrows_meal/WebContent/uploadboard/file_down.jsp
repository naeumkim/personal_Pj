<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>best_board_download</title>
</head>
	
	
	<%
	
	
	String filename = request.getParameter("filename");
	
	
	String savaPath = "upload";
	
	ServletContext ctx = getServletContext();
	
	String sDownloadPath = ctx.getRealPath(savaPath);
	
	String sFilePath = sDownloadPath + "\\" + filename;
	
	System.out.println("다운로드할 파일 주소 : " + sFilePath);
	
	byte[] b = new byte[4096];
	
	FileInputStream fis = new FileInputStream(sFilePath);
	
	String sMimeType = getServletContext().getMimeType(sFilePath);
	
	System.out.println("sMimeType >> " + sMimeType);
	
	if(sMimeType == null){
		sMimeType = "application/octet-stream";
	}
	
	response.setContentType(sMimeType);
	
	String agent =request.getHeader("User-Agent");
	System.out.println("사용자 정보 : " + agent);
	
	
	boolean ieBrowser = (agent.indexOf("MSIE")>-1 || agent.indexOf("Trident")>-1);
	
	if(ieBrowser){
		filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

	}else{
		filename = new String(filename.getBytes("UTF-8"),"iso-8859-1");
		
	}
	
	
	response.setHeader("Content-Disposition", "attachment; filename= "+ filename);
	
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead;
	
	while((numRead = fis.read(b,0,b.length)) != -1 ){
		out2.write(b,0,numRead);
		
	}
	
	out2.flush();
	out2.close();
	fis.close();
	
	
	%>
	
</body>
</html>