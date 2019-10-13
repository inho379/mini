<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리 - 다나와</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/Notebook.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
</head>
<body>


<%@ page import = "kr.or.ksmart.dao.Ndao" %>
<%@ page import = "kr.or.ksmart.dto.NoteBook"%>
<%
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");
	System.out.println(code + " <-code 수정 화면에서 넘어온 코드값");
	
	Ndao dao = new Ndao();
	NoteBook n = dao.nUpdateOne(code);
	System.out.println(n + " <-n 한개의 상품 선택 후 수정할 정보");
	
	
%>
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>

<!-- 회원관리 left  column 시작 -->
<%@ include file="/module/LeftSideBar.jsp" %>


<div class="page-header js-affix affix-top" style="width: auto; left: auto;">
    <h2>상품 수정</h2>
</div>

<form method="post" action="<%=request.getContextPath()%>/Nupdate/n_update_pro.jsp" enctype="Multipart/form-data"  >
	<input type="hidden" name="nCode" value="<%=n.getnCode()%>">
	<input type="hidden" name="hId" value="<%=S_ID%>">
	<div class="tbl_frm01">
		<table class="table table-bordered" style="width : 430px;">
			<tbody>
				
				<tr>
					<th scope="row"><label for="nName">상품명<strong
							class="sound_only">필수</strong></label></th>
					<td>
						<div id="autosave_wrapper">
							<input type="text" name="nName" value="<%=n.getnName()%>" style="width:100%;"
								required="" class="frm_input required"
								maxlength="255">
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row">색상</th>
					<td>
						<input type="text" name="nColor" value="<%=n.getnColor()%>" style="width:100%;"
							required="" class="frm_input" 
							maxlength="255">
					</td>
				</tr>
				<tr>
					<th scope="row"><label for="nMade">제조사<strong
							class="sound_only">필수</strong></label></th>
					<td><select name="nMade" id="nMade" required=""
						class="required">
							<option value="">선택하세요</option>
							<option value="Samsung">Samsung</option>
							<option value="Lg">Lg</option>
							<option value="Dell">Dell</option>
							<option value="Lenovo">Lenovo</option>
							<option value="Asus">Asus</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>
				<tr>
					<th scope="row">스펙</th>
					<td>
						<input type="text" name="nNspec" value="<%=n.getnNspec()%>"  style="width:100%;"
							required="" class="frm_input"
							maxlength="255">
					</td>
				</tr>
				<tr>
					<th scope="row">수량</th>
					<td>
						<input type="text" name="nCount" value="<%=n.getnCount()%>" style="width:100%;"
							required="" class="frm_input"
							maxlength="255">
					</td>
				</tr>
				<tr>
					<th scope="row">출시일시</th>
					<td>
						<input type="text" name="nSday" value="<%=n.getnSday()%>" style="width:100%;"
							required="" class="frm_input" 
							maxlength="255">
					</td>
				</tr>
				<tr>
					<th scope="row">가격</th>
					<td>
						<input type="text" name="nPrice" value="<%=n.getnPrice()%>" style="width:100%;"
							required="" class="frm_input" 
							maxlength="255">
					</td>
				</tr>
				<tr>
					<th scope="row">할인률</th>
					<td>
						<input type="text" name="nSale" value="" style="width:100%;"
							required="" class="frm_input"
							maxlength="255">
					</td>
				</tr>
				<tr>
					<th scope="row">사진첨부</th>
					<td>
						<input type="file" name="nImg">
					</td>
				</tr>
				</tbody>
		</table>
		<div style="margin-bottom: 30px; ">
			<a href="<%= request.getContextPath() %>/index.jsp"><button type="button" class="btn btn-danger btn-block" style="width:150px; float: left; margin-left:40px; margin-right: 50px;">취소</button></a>
			<input type="submit" value="상품수정" class="btn btn-primary btn-block" style="width:150px;">
		</div>	
	</div>
</form>

	<%@ include file="/module/MainFooter.jsp" %>
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>





