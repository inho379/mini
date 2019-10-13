<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다나와 회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Hinsert.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body>

<!--header 시작 -->
<div id="header" style="text-align: center; margin-top: 50px" >
	<h1>
		<a href="<%= request.getContextPath() %>/index.jsp" style="text-decoration: none;">
			<span class="blind">다나와 노트북</span>				
		</a>
	</h1>
</div>	
<!-- // header 끝 -->


<div class="singup-form">
	<form action="<%=request.getContextPath()%>/Hinsert/h_insert_pro.jsp" method="post">
	 	<div class="form-group">
	 		<label for="h_id"><b>아이디</b></label>
			<input type="text" name="h_id" placeholder="ID를 입력해주세요."  class="form-control" required="required">
        </div>
        <div class="form-group">
        	<label for="h_pw"><b>비밀번호</b></label>			
			<input type="password" name="h_pw" placeholder="비밀번호를 입력해주세요."  class="form-control" required="required">
        </div>
        <div class="form-group">			
        	<label for="h_name"><b>이름</b></label>
			<input type="text" name="h_name" placeholder="이름을 입력해주세요."  class="form-control" required="required">
        </div>
        <label for="h_phone"><b>성별</b></label>
        <div class="form-group">
       	<select name="h_gender" class="level-group">
			<option value="">성별</option>
			<option value="남자" >남자</option>
			<option value="여자">여자</option>
		</select>
		</div>
        <div class="form-group">	
        	<label for="h_phone"><b>전화번호</b></label>
			<input type="text" name="h_phone" placeholder="전화번호를 입력해주세요."  class="form-control" required="required">
		</div>
        <div class="form-group">	
        	<label for="h_addr"><b>주소</b></label>
			<input type="text" name="h_addr" placeholder="주소를 입력해주세요."  class="form-control" required="required">
		</div>
        <div class="form-group">	
        	<label for="h_email"><b>이메일</b></label>
			<input type="text" name="h_email" placeholder="Email을 입력해주세요."  class="form-control" required="required">
		</div>
        <div class="form-group">	
        	<label for="h_nick"><b>닉네임</b></label>
			<input type="text" name="h_nick" placeholder="닉네임을 입력해주세요."  class="form-control" required="required">
		</div>
			<label for="h_year"><b>생년월일</b></label>
		<div class="bir_wrap">
			<div class="bir_yy">
				<span class="ps_box"> <input type="text" id="yy"
					placeholder="년(4자)" aria-label="년(4자)" class="int" maxlength="4" name="h_year">
				</span>
			</div>
			<div class="bir_mm">
				<span class="ps_box"> <select id="mm" class="sel" aria-label="월" name="h_month">
						<option>월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
				</select>
				</span>
			</div>
			<div class=" bir_dd">
				<span class="ps_box"> <input type="text" id="dd"
					placeholder="일" aria-label="일" class="int" maxlength="2" name="h_day"> <label
					for="dd" class="lbl"></label>
				</span>
			</div>
		</div>
		<label for="h_level"><b>회원등급</b></label>
		<div class="level-group">
		<select name="h_level" class="level-group">
			<option value="">회원 등급</option>
			<option value="구매자">구매자</option>
			<option value="판매자">판매자</option>
			<option value="관리자">관리자</option>
		</select>
		</div>
        <div class="form-group" style="margin-top:30px">
<a href="<%= request.getContextPath() %>/index.jsp"><button type="button" class="btn btn-danger btn-block" style="width:150px; float: left; margin-left:30px; margin-right: 50px;">취소</button></a>        
            <button type="submit" class="btn btn-primary btn-block">가입하기</button>
        </div>
	</form>
</div>
</body>
</html>