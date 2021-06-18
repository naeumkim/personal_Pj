
<%@page import="com.tmeal.member.TmealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


<!--css  -->
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../inc/main.css">
<!--css  -->

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
function pwcheckFunction(){
	
	  var pw = $('#pw').val();
	  var id = $('#id').val();
	  $.ajax({
		  type: 'post',
		  url: '../pwcheckServlet',
		  data: {id : id,
			  	pw : pw},
		  success: function(result){
			  console.log(result);
			  
			  if(result == 1){
				$('#pwckMessage').html('&nbsp;&nbsp;비밀번호가 일치합니다.');
				$('#pwckMessage').css('color','green');
		  		}else if(result == -1){
		  		$('#pwckMessage').html('&nbsp;&nbsp;비밀번호가 일치하지 않습니다.');
				$('#pwckMessage').css('color','red');
		  		
		  		}
		  
		  
		  }		  	
	  });
	  
}


function newpwckFunction(){
	  var newpw = $('#newpw').val();
	  var newpwck = $('#newpwck').val();
			  if(newpw != newpwck){
				$('#newpwckMessage').html('변경할 비밀번호가 서로 일치하지 않습니다.');
				$('#newpwckMessage').css('color','red');
				
		  	}else{
		  		$('#newpwckMessage').html('비밀번호가 서로 일치합니다.');
				$('#newpwckMessage').css('color','green');
		  		}
}

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }
			           
            
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        
        }
    }).open();
}


$(document).ready(function(){
	 
	 $( "#detailAddress" ).keyup(function() {
		 var post = $("#postcode").val() + " ";
		 var rda = $("#roadAddress").val() + " ";
		 var jibun = $("#jibunAddress").val() + " ";
		 var extra = $("#extraAddress").val() + " ";
		 var detail = $("#detailAddress").val();
		
		
		 
		 $("#address").val(post + rda + jibun + extra + detail);
		 
		});
});





</script>

<title>회원정보수정</title>
</head>
<body>

<jsp:include page="../inc/header.jsp"/>


<%
 String id = (String)session.getAttribute("id");

request.setCharacterEncoding("utf-8");

if(id==null){
	System.out.println("[info.jsp] 아이디 null > login.jsp ");
	response.sendRedirect("loginForm.jsp");
}
%>


<jsp:useBean id="mb" class="com.tmeal.member.tmmemberbean"></jsp:useBean>
<jsp:setProperty property="*" name="mb"/>

<%
 TmealDAO tmdo = new TmealDAO();

	tmdo.tmember_info(mb,id);
%>
<div class="main-div">
	<div class="main-left" style="padding-right: 550px;">
		</div>
			
		<div class="main-center">
		
			<table class="table table-borderless" style="text-align: center; width: 800px;'">
			<form action="updatePro.jsp" method="post">
				
				<thead>
					<tr>
						<th colspan="4"><p style="font-size: 20px; text-align: center;">회원정보 수정</p></th>
					</tr>
				</thead>
				
				<tbody>
				<tr>
				<td>아이디</td>
				<td colspan="2"><input type="text" name = "id" id="id" value="<%=mb.getId() %>" readonly class="form-control"></td>
				</tr>
				<tr>
				<td>현재	비밀번호</td>
				<td><input type="password" name = "pw" id="pw" class="form-control" onkeyup="pwcheckFunction();" required></td>
				<td style=" text-align: center; width: 256px;"><b style="color: red; text-align: center; width: 100px;" id="pwckMessage"></b></td>
				</tr>
				
				<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name = "newpw" class="form-control" id="newpw"></td>
				</tr>
				<tr>
				<td>새 비밀번호 확인 </td>
				<td><input type="password" name = "newpwck" class="form-control" id="newpwck" onkeyup="newpwckFunction();"></td>
				<td style="width: 320px;"><b style="color: red;" id="newpwckMessage"></b></input></td>	
				
				</tr>
				<tr>
				<td>이름</td>
				<td colspan="2"><input type="text" name = "name" value="<%=mb.getName()%>" class="form-control"></td>
				</tr>
				<tr>
				<td>핸드폰 번호</td>
				<td colspan="2"><input type="tel" name = "phoneNumber" value="<%=mb.getPhoneNumber()%>" class="form-control"></td>
				</tr>
				<tr>
				<td>이메일</td>
				<td colspan="2"><input type="email" name= "email" value="<%=mb.getEmail()%>" class="form-control"></td>
				</tr>
				<tr>
				<td>주소</td>
				<td colspan="2"><input type="text" name="address" value="<%=mb.getAddress()%>" class="form-control"> <br> 
				</td>
				</tr>
				<tr>
				<td>성별</td>
				<td colspan="3">
				<%if(mb.getGender().equals("남")) {%>
				 <input type="radio" name ="gender" value="남" checked> 남
				 <input type="radio" name ="gender" value="여"> 여<br>
				<%}else{ %>
				<input type="radio" name ="gender" value="남"> 남
				<input type="radio" name ="gender" value="여" checked> 여<br>
				<%} %>
				</td>
				</tr>
				<tr>
				<td>생년월일</td>
				<td colspan="3"><input type="Date" name="birth" value="<%=mb.getBirth()%>" class="form-control"></td>
				</tr>
				<tr>
				<td colspan="3"><input type="submit"  class="btn btn-outline-info" value="수정하기"></td>
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