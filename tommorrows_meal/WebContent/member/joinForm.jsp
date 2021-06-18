<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name = "viewport" content="width=divice-width,initial">

<!-- css -->
<!--header  -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">
<!--header  -->

<link rel="stylesheet" type="text/css" href="../inc/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<!-- css -->

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">


function idcheckFunction(){
	  var id = $('#id').val();
	  $.ajax({
		  type: 'post',
		  url: '../idcheckServlet',
		  data: {id : id},
		  success: function(result){
			  console.log(result);
			  
			  if(result == 1){
				$('#idckMessage').html('&nbsp;&nbsp;사용할 수 있는 아이디 입니다.');
				$('#idckMessage').css('color','green');

				
		  	}else if(result == 0){
		  		$('#idckMessage').html('&nbsp;&nbsp;사용할 수 없는 아이디 입니다.');
		  		
		  		}
		  }		  	
	  });
	  
}
	  
	 

 function pwckFunction(){
	  var pw = $('#pw').val();
	  var pwck = $('#pwck').val();
			  if(pw != pwck){
				$('#pwckMessage').html('비밀번호가 일치하지 않습니다.');
				
				
		  	}else{
				$('#pwckMessage').html('비밀번호가 일치합니다.');
				$('#pwckMessage').css('color','green');

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



<title>tommorrow's meal 가입페이지</title>

</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	
	<div class="main-div" style="padding: 50px 0 50px 0;">
		<div class="main-left">
		</div>
			<div class="main-center">
				<Form action="joinPro.jsp" method="post" > 
					<table class= "table table-borderless" style="text-align: center;">
						<thead>
							<tr>
								<th colspan="3"><p style="font-size: 20px;">회원가입</p></th>
							</tr>
							<tr>
								<th colspan="3" style="text-align: left; padding-left: 280px;"><b style="color: red;">*</b>은 필수 입력 항목 입니다.</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								<td style="width: 300px; text-align: right;"><h5>아이디<b style="color: red;">*</b></h5></td>
								<td>
								<input type="text" id="id" name ="id" maxlength="20" class="form-control" required>
								</td>
								<td style=" text-align: left;"><button style= "text-align: left;"type="button" class="btn btn-primary" onclick="idcheckFunction();">중복체크</button>
								<b style="color: red; text-align: center; width: 100px;" id="idckMessage"></b>
								</td>
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>비밀번호<b style="color: red;">*</b></h5></td>
								<td><input  type="password" id="pw" name ="pw" onkeyup="pwckFunction();" maxlength="20" class="form-control" required></td>
								<td></td>
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>비밀번호 확인<b style="color: red;">*</b></h5></td>
								<td><input type="password" id="pwck" name ="pwck" maxlength="20" onkeyup="pwckFunction();" class="form-control" required>
								</td>
								<td style="width: 300px;"><b style="color: red;" id="pwckMessage"></b></input></td>	
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>이름<b style="color: red;">*</b></h5></td>
								<td><input type="text" id="name" name ="name" maxlength="20" class="form-control" required></td>
								<td></td>
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>연락처<b style="color: red;">*</b></h5></td>
								<td><input type="tel" id="phoneNumber" name ="phoneNumber" maxlength="20" class="form-control" required></td>
								<td></td>
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>이메일<b style="color: red;">*</b></h5></td>
								<td><input type="email" id="email" name ="email" maxlength="50" class="form-control" required></td>
								<td></td>
							</tr>
							<tr colspan = "3">
								<td style="width: 300px; text-align: right;"><h5>주소<b style="color: red;">*</b></h5></td>
									<td style="width: 500px;">
										<table>
											<tr>
												<td><input type="text" id="postcode" name="postcode" placeholder="우편번호" class="form-control"></td>
												<td><span id="guide" style="color:#999;display:none"></span></td>
											</tr>
											<tr>
												<td><input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" class="form-control"></td>
												<td><input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" class="form-control"></td>
											</tr>
											<tr>
											<td><input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" class="form-control" required="required"></td>
											<td><input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" class="form-control"></td>
											</tr>
											<tr>
											<td><input type="hidden" id="address" name="address" style="width: 300px; height: 50px;"></td>
											</tr>
							
										
										</table>	
									</td>
		
								<td style="width: 400px; text-align: left;"><button style= "text-align: left;"type="button" class="btn btn-primary" onclick="execDaumPostcode();">주소검색</button>
							
							
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>성별</h5></td>
								<td>
									<div class="form-group" style="text-align: center; margin: 0 auto;"> 
										<div class="btn-group btn-group-toggle" data-toggle="buttons">
												<input type="radio" name ="gender" autocomplete="off" value="남" checked> 남
												<input type="radio" name ="gender" autocomplete="off" value="여"> 여
									 	</div>
									 </div>
								 </td>		
								 <td></td>			
							</tr>
							<tr>
								<td style="width: 300px; text-align: right;"><h5>생년월일</h5></td>
								<td><input type="date" id="birth" name ="birth" maxlength="20" class="form-control"></td>
								<td></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="3"><input type="submit" class="btn btn-primary pull-right" value="가입하기"></td>
							</tr>
						</tbody>
					</table>
				</Form>
			 </div>
		 	
			<div class="main-right" >
	 		</div>
		</div>


<jsp:include page="../inc/footer.jsp"/>

</body>
</html>