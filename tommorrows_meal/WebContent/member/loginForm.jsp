<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!--css  -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="../css2/assets/css/style.min.css">
<link rel="stylesheet" href="../css2/assets/css/modules.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../inc/style.css">
<link rel="stylesheet" type="text/css" href="../inc/main.css">

<!--css  -->
<title>tommorrow's meal login</title>
</head>
<body>
<jsp:include page="../inc/header.jsp"/>


<section class="MOD_BOXMESSAGE1" style="background-color : white;">
 <div class="MOD_BOXMESSAGE1_Message" data-theme="_bo1">
    <h2>LOGIN</h2>
    <p>
    <fieldset>
	<form action="loginPro.jsp" method="post" >
	아이디 <input type="text" name="id" class= "form-control" > <br>
	비밀번호 <input type="password" name ="pw" class= "form-control"> <br><br>
	<input type="submit" value="로그인"  class="btn btn-outline-success">
	<input type="button" value="회원가입"  onclick="location.href='joinForm.jsp';"  class="btn btn-outline-success">
	</form>
	</fieldset>
    </p>
  </div>
</section>

    <div class="footer-fixed">
        <div>LOGO
        </div>
        <div>
          CEO. KNE<br>
          Addr. 부산광역시 부산 진구 골든게이트 빌딩 Fax/Tel.<br>
          051 - 223 -2912~5 <br>
        </div>
      </div>

</body>
</html>