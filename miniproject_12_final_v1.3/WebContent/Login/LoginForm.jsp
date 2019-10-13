<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다나와 로그인화면</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/LoginForm.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
	$('[type="button"]').click(function() {
		var a = $(this).val()
		if(a=="1"){
			$('[name="h_id"]').val("id021")
			$('[name="h_pw"]').val("pw021")
		}else if(a=="2"){
			$('[name="h_id"]').val("id006")
			$('[name="h_pw"]').val("pw006")
		}else if(a=="3"){
			$('[name="h_id"]').val("id001")
			$('[name="h_pw"]').val("pw001")
		}
	})
})
</script>
</head>
<body>
<%@ include file="/module/LoginHeaderjsp.jsp" %>

<div class="login-form">
    <form action="<%= request.getContextPath() %>/Login/LoginPro.jsp" method="post">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="아이디" name="h_id">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="비밀번호" name="h_pw">
        </div>
        <div style="margin:5px;">
	        <button type="button" value="1" class="btn btn-primary btn-block" style="float:left;width:30%;margin:5px;">구매자</button>
	        <button type="button" value="2" class="btn btn-primary btn-block" style="float:left;width:30%;margin:5px;">판매자</button>
	        <button type="button" value="3" class="btn btn-primary btn-block" style="float:left;width:30%;margin:5px;">관리자</button>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-block">로그인</button>
        </div>    
    </form>
	<div class="find_info" class="text-center" style="text-align: center">
		<a target="_blank" id="join" href="<%= request.getContextPath() %>/Hinserth_insert_form.jsp">회원가입</a>
	</div>    
</div>
</body>
</html>
