<%@page import="java.util.Date"%>
<%@page import="com.tmeal.reply.replyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tmeal.reply.replyDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.tmeal.board.BoardBean"%>
<%@page import="com.tmeal.board.BoardDAO"%>
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
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

$(function(){
	
	$("#reWrite-btn").click(function(){
	
	var repid = $('#repid').val();
	var repcontent = $('#repcontent').val();
	var board_no = $('#board_no').val();
	var reply_date = $('#reply_date').val();
	
	
	
		if($('#repid').val().trim() === ""){
		alert("로그인 후 작성하실 수 있습니다.");
		$("#repid").val("").focus();}
		else{

			if($("#repcontent").val().trim() === ""){
				alert("댓글을 입력하세요.");
				$("#repcontent").val("").focus();
				}else{
					
					$.ajax({
						 type: 'post',
						  url: '../replyServlet',
						  data: {repid : repid,
							  	repcontent : repcontent,
							  	board_no : board_no,
							  	reply_date : reply_date
						  },
						  success: function(result){
							  console.log(result);
							 
							  if(result == 1){
								alert('댓글 작성이 완료 되었습니다.');
								location.reload();
						  	}else{alert('댓글 작성에 실패했습니다.');}
						  
						  
						  
						  	}	//success
						});//ajax
				}
			}
		});
	
	

	
	
});//function


</script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>



<div class="main-div">
	<div class="main-left">
		</div>
		<div class="main-center">
			<%
				int num = Integer.parseInt(request.getParameter("num"));
				String pageNum = request.getParameter("pageNum");
				String id = (String)session.getAttribute("id");
				
				BoardDAO bdao = new BoardDAO();
				BoardBean bb = bdao.getBoard(num);
				
				
				bdao.updateReadcount(num);%>
			
			<h4 style="padding: 50px 0 50px 0;">리뷰 게시판</h4>
			
			<table class="table">
				<tr>
				<td>글 번호</td>
				<td><%=bb.getNum() %></td>
				<td>조회수</td>
				<td><%=bb.getReadcount() %></td>
				</tr>
				<tr>
				<td>글쓴이</td>
				<td><%=bb.getId() %></td>
				<td>작성일</td>
				<td><%=bb.getDate() %></td>
				</tr>
				<tr>
				<td>제목</td>
				<td colspan="3"><%=bb.getSubject() %></td>
				</tr>
				<tr>
				<td colspan="3"><%=bb.getContent() %></td>
				</tr>
				<tr>
					<td colspan="4">
					<input type="button" value="목록으로" onclick="location.href='reviewList.jsp?pageNum=<%=pageNum%>';" class="btn btn-outline-primary">
					<%if(id != null && id.equals(bb.getId())){ %>
					<input type="button" value="수정하기" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';" class="btn btn-outline-success">
					<input type="button" value="삭제하기" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>';" class="btn btn-outline-danger">
					<%} %>
					</td>
				</tr>
			</table>
		
		
	<!--댓글창  -->
	
	<script type="text/javascript">
	function replyview(){  
		  
		<%
		
		num = bb.getNum();
		
		replyDAO rdao = new replyDAO();
		rdao.getreplylist(num);
		
		
		ArrayList replylist = rdao.getreplylist(num);
		
		System.out.println("댓글리스트 가져오기 완료");
		
		%>
	
	};
	
	
	</script>
	
	<table class="table">
		<thead class="thead-light">
			<tr>
				<th colspan="2" >댓글</th>
			</tr>
		</thead>
		<%
					for(int i=0;i<replylist.size();i++){
						 replyDTO rp = (replyDTO)replylist.get(i);
					%>
		<tbody>
			<tr>
				<td><%=rp.getRepid() %></td>
				<td><%=rp.getReply_date() %> </td>
			</tr>		
			<tr>
				<td colspan="2"><%=rp.getRepcontent() %> </td>
			</tr>	
			<%} %>	
		</tbody>
	</table>		
	<!--댓글창  -->
	

	
	
			
			
				
	<!--댓글 작성창  -->
	<table style="padding-bottom: 80px;" class="table">
		<form  method="post">
			<input type="hidden" name="board_no" id="board_no" value="<%=bb.getNum()%>">
			<input type="hidden" name="reply_date" id="reply_date" value="<%=new Date()%>">
			
			
			<thead class="thead-light">
				<th colspan="4">댓글을 작성해보세요.</th>
			</thead>
			<tbody>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="repid" id="repid" class= "form-control" value="${id}" readonly></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3"><input type="text" name ="repcontent" id ="repcontent"  class= "form-control"></input></td>
				</tr>
				<tr>
					<td colspan="4" style="text-align: right;"><input type="button" value="댓글쓰기" id="reWrite-btn" class="btn btn-primary"></td>
				</tr>
			</tbody>
		</form>
	</table>
	<!--댓글 작성창  -->
			
		
	</div>

	<div class="main-right" ></div>
</div>







<jsp:include page="../inc/footer.jsp"/>


</body>
</html>