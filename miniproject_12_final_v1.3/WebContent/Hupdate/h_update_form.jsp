<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="kr.or.ksmart.dto.Human"%>
<%@page import="kr.or.ksmart.dao.Hdao"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리 - 다나와</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Hupdate.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>  
<body>
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>
<%
	Human h = null;
	String h_id = request.getParameter("h_id");
	System.out.print(h_id+"<asdasda");
	Hdao hdao = new Hdao();
	h=hdao.hSearchForUpdate(h_id);
	String db_id = h.getH_id();
	String db_pw = h.getH_pw();
	String db_name = h.getH_name();
	String db_phone = h.getH_phone();
	String db_addr = h.getH_addr();
	String db_email = h.getH_email();
	String db_nick = h.getH_nick();
	String db_birth = h.getH_birth();
	String db_jday = h.getH_jday();
	String db_gender = h.getH_gender();
%>
<script type="text/javascript">
	$(document).ready(function() {
		<%if(db_id.equals(S_ID)){%>
			$('[name="h_pw"]').attr('readonly', false)
			$('[name="h_pw_check"]').change(function () {
				if($('[name="h_pw"]').val()!=$('[name="h_pw_check"]').val()){
					alert('비밀번호를 다시 확인해주시기 바랍니다.')
					$('[type="submit"]').attr('disabled', true)
				}
				if($('[name="h_pw"]').val()==$('[name="h_pw_check"]').val()){
					$('[type="submit"]').attr('disabled', false)
				}
			})
		<%}%>
	})
</script>

<div class="Hupdate-form">
	<form action="<%=request.getContextPath()%>/Hupdate/h_update_pro.jsp"
		method="post">
		<div class="form-group">
			<label for="h_id"><b>아이디</b></label> 
			<input type="text" name="h_id"value="<%=db_id%>" class="form-control" readonly>
		</div>
		<div class="form-group">
			<label for="h_pw"><b>비밀번호</b></label> 
			<input type="password" name="h_pw" value="<%=db_pw%>" class="form-control" readonly placeholder="비밀번호를 입력해주세요.">
		</div>
		<%if(db_id.equals(S_ID)){%>
			<div class="form-group">
			<label for="h_pw"><b>비밀번호 확인</b></label> 
			<input type="password" name="h_pw_check" value="<%=db_pw%>" class="form-control" placeholder="비밀번호확인을 입력해주세요.">
		</div>
		<%}%>
		<div class="form-group">
			<label for="h_name"><b>이름</b></label> 
			<input type="text" name="h_name" value="<%=db_name%>" class="form-control" placeholder="이름을 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="h_phone"><b>핸드폰번호</b></label> 
			<input type="text"	name="h_phone" value="<%=db_phone%>" class="form-control" placeholder="전화번호를 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="h_addr"><b>주소</b></label> 
			<input type="text" name="h_addr" value="<%=db_addr%>" class="form-control" placeholder="주소를 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="h_email"><b>이메일</b></label> 
			<input type="text"	name="h_email" value="<%=db_email%>" class="form-control" placeholder="Email을 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="h_nick"><b>닉네임</b></label> 
			<input type="text" name="h_nick" value="<%=db_nick%>" class="form-control" placeholder="닉네임을 입력해주세요.">
		</div>
		<div class="form-group">
			<label for="h_birth"><b>생년월일</b></label> 
			<input type="text"	name="h_birth" value="<%=db_birth%>" class="form-control" readonly="readonly"disabled="disabled">
		</div>
		<div class="form-group">
			<label for="h_jday"><b>가입일</b></label> 
			<input type="text" name="h_jday" value="<%=db_jday%>" class="form-control" readonly="readonly" disabled="disabled">
		</div>
		<div class="form-group">
			<label for="h_gender"><b>성별</b></label> 
			<input type="text" name="h_gender" value="<%=db_gender%>" class="form-control" readonly="readonly"disabled="disabled">
		</div>
		<div class="form-group" style="margin-top: 30px">
			<input type="submit" value="수정버튼" class="btn btn-primary btn-block">
		</div>
	</form>
</div>

	<%@ include file="/module/MainFooter.jsp" %>
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>