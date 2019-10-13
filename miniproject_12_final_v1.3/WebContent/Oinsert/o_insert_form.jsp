<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="kr.or.ksmart.dao.Odao"%>
<%@page import="kr.or.ksmart.dao.Ndao"%>
<%@page import=" kr.or.ksmart.dto.NoteBook"%>


<!DOCTYPE html >

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>다나와 회원리스트</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
</head>
<style>
.table-header {
    overflow: hidden;
    border-top: 1px solid #888888;
}
.table-header .pull-left {
    /*float: left;*/
    padding: 25px 0px 2px;
    /*width: 300px;*/
    font-family: Malgun Gothic,"맑은 고딕";
    color: #666666
}
.table-header .pull-left strong {
    color: #fa2828;
}
.form-inline .form-control {
    display: inline-block;
    width: auto;
    vertical-align: middle;
}

.table-rows tr td:first-child:after {
    content: '';
    position: absolute;
    top: 0;
    right: -1px;
    z-index: 100;
    width: 2px;
    height: 100%;
    background: #fff;
}

.table-rows > tbody > tr > th,
.table-rows > tfoot > tr > th,
.table-rows > tbody > tr > td,
.table-rows > tfoot > tr > td {
    padding: 5px;
    border-top: 1px solid #E6E6E6;
    border-right: 1px solid #E6E6E6;
    border-top: 1px solid #E6E6E6;
    /*border-bottom: 1px solid #E6E6E6;*/
}




/* 포인터 */
.hand {
    cursor: pointer;
}


td{
    height: 25px;
}


</style>
<body>
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>

<!-- 회원관리 left  column 시작 -->
<%@ include file="/module/LeftSideBar.jsp" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var hp=0
		var op=0
		var otp=0
		$('[name="o_insert"]').click(function(){
			var count=$('[name="o_count"]').val()//수량
			var name =$('[name="o_name"]').val()//받으시는분
			var addr=$('[name="o_addr"]').val()//수령주소
			var phone=$('[name="o_phone"]').val()//받으시는분 연락처
			var ask=$('[name="o_ask"]').val()//요청사항
			if(name==''||addr==''||phone==''||ask==''){			
				alert('빈칸을 입력해주세요');
				return false;
			}else if(count=0){			
				alert('마일리지를 확인해주세요.');
				return false;
			}
			else{
				return true;
			}
		});
		$('[name="o_point"]').change(function(){
			hp=parseInt($('[name="h_point"]').text())
			op=parseInt($('[name="o_point"]').val())
			otp=parseInt($('[name="o_tprice"]').val())
			if(op>hp||op>otp||op<0){
				alert('최대치로 가자')
				$('[name="o_point"]').val(hp)
				return true;
			}
		})
		$('[name="o_count"],[name="o_point"]').change(function(){
			var price=$('[name="o_price"]').val()
			var count=$('[name="o_count"]').val()
			if(count>0){
				$('[name="o_point"]').prop('readonly', false)
			}
			var point=$('[name="o_point"]').val()
			console.log(price*count-point)
			$('[name="o_tprice"]').val(price*count-point)
		})
	})
</script>
<%
	String code = request.getParameter("code");
	System.out.println(code + " <- code codecodecode");
	Ndao nao=new Ndao();
	NoteBook n=nao.nUpdateOne(code);
%>

<body>
   

주문 등록 화면
<form action="<%=request.getContextPath()%>/Oinsert/o_insert_pro.jsp" method = "post">
	<table border="1">
	
	<input type="hidden" name="n_code" value="<%=code%>"> 
	<input type="hidden" name="h_id" value="<%=S_ID%>"> 


		<tr>
			<td>상품명</td>
			<td><span><%=n.getnName()%></span></td>
		</tr>
		<tr>
			<td>색상</td>
			<td><span><%=n.getnColor()%></span></td>
		</tr>
		<tr>
			<td>주문금액</td>
			<td><input type="text" name="o_price" size="25" readonly value=<%=n.getnSprice()%>><br /></td>
		</tr>
		<tr>
			<td>주문수량</td>
			<td><select name="o_count">
				<option value="0">수량을 정해주세요</option>
				<%
					for (int i = 1; i <= n.getnCount(); i++) {
				%>
				<option value="<%=i%>"><%=i%></option>
				<%
					
					}
				%>
			</select><br/></td>
		</tr>
		<tr>
			<td>사용 가능 마일리지 : </td>
			<%
				Odao dao=new Odao();
			%>
			<td name="h_point"><%=dao.hPoint(S_ID)%></td>
		</tr>
		<tr>
			<td>사용 마일리지</td>
			<td><input type="number" name="o_point" size="25" placeholder="0" value="0" readonly><br /></td>
			
		</tr>
		<tr>
			<td>최종 주문 금액</td>
			<td><input type="text" name="o_tprice" size="25" readonly><br /></td>
		</tr>
		<tr>
			<td>받는 사람 이름</td>
			<td><input type="text" name="o_name" size="25"><br /></td>
		</tr>
		<tr>
			<td>받는 사람 주소</td>
			<td><input type="text" name="o_addr" size="25"><br /></td>
		</tr>
		<tr>
			<td>받는 사람 연락처</td>
			<td><input type="tel" name="o_phone" size="3">-<input type="tel" name="o_phone" size="4">-<input type="tel" name="o_phone" size="4"><br/></td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td><input type="text" name="o_ask" size="25"><br /></td>
		</tr>
		<tr>
			<td>주문등록을 합니다</td>
			<td><input type="submit" name="o_insert" value="주문등록"></td>
		</tr>
	</table>
</form>

	<%@ include file="/module/MainFooter.jsp" %>
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>