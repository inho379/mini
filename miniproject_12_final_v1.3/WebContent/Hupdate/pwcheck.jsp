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
	Hdao hdao = new Hdao();
	h=hdao.hSearchForUpdate(S_ID);
	String db_id = h.getH_id();
	String db_pw = h.getH_pw();
	System.out.print(db_id+"ASdasda");
	System.out.print(db_pw);
%>
<script type="text/javascript">
	var pw ='<%=db_pw%>'
	console.log(pw)
	$(document).ready(function() {
		$(document).on('click','[type="submit"]',(function() {
			if(pw!=$('[name="h_pw"]').val()){
				alert('본인 확인이 실패하였습니다.')
				return false
			}else if(pw==$('[name="h_pw"]').val()){
				alert('본인 확인 되었습니다.')
				return true
			}
		}))
	})
</script>

<div class="Hupdate-form">
	<form action="<%=request.getContextPath()%>/Hupdate/h_update_form.jsp" method="post">
		<div class="form-group">
			<label for="h_id"><b>아이디</b></label> 
			<input type="text" name="h_id" value="<%=S_ID%>" class="form-control" readonly>
		</div>
		<div class="form-group">
			<label for="h_pw"><b>비밀번호</b></label> 
			<input type="password" name="h_pw" class="form-control" placeholder="비밀번호를 입력해주세요.">
		</div>
		<div class="form-group" style="margin-top: 30px">
			<input type="submit" value="본인확인버튼" class="btn btn-primary btn-block">
		</div>
	</form>
</div>

	<%@ include file="/module/MainFooter.jsp" %>
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>