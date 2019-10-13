<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="kr.or.ksmart.dao.*"%>
<%@page import=" kr.or.ksmart.dto.*"%>


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

<%
	request.setCharacterEncoding("utf-8");
	
	String o_code = request.getParameter("o_code");
	System.out.println(o_code + "<--o_code");
	Odao odao=new Odao();
	Order o=odao.oUpdateOne(o_code);
	System.out.println(o + " <- o");
	System.out.println(o.getN_code() + " <- o.getN_code()");
	Ndao ndao = new Ndao();
	NoteBook n = ndao.nUpdateOne(o.getN_code());
	String Nname = n.getnName();
	String Ncolor = n.getnColor();
	int n_count = n.getnCount();
	System.out.println(Nname + " <- name");
	System.out.println(Ncolor + " <- name");

	
	String dbocode=o.getO_code();
	String dbnname =n.getnName();
	String dbcolor =n.getnColor();
	int dboprice =Integer.parseInt(o.getO_price());
	int dbocount =Integer.parseInt(o.getO_count());
	String dbopoint =o.getO_point();
	String dbotprice = o.getO_tprice();
	String dboname =o.getO_name();
	String dbaddr =o.getO_addr();
	int dbophone =Integer.parseInt(o.getO_phone());
	String dbask = o.getO_ask();
	
	
	
	System.out.println(dbocount + " <- dbocount "+n_count + " <- n_count");
%>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var hp=0
		var op=0
		var otp=0
		$('[name="o_count"]').change(function(){
			var price=$('[name="o_price"]').val()
			var count=$('[name="o_count"]').val()
			var point=$('[name="o_point"]').val()
			console.log(price*count-point)
			$('[name="o_tprice"]').val(price*count-point)
		})
		$('[name="o_update"]').click(function(){
			var count=$('[name="o_count"]').val()//수량
			var name =$('[name="o_name"]').val()//받으시는분
			var addr=$('[name="o_addr"]').val()//수령주소
			var phone=$('[name="o_phone"]').val()//받으시는분 연락처
			var ask=$('[name="o_ask"]').val()//요청사항
			if(name==''||addr==''||phone==''||ask==''){			
				alert('빈칸을 입력해주세요');
				return false;
			}else if(op>hp||op>otp||op<0){			
				alert('마일리지를 확인해주세요.');
				return false;
			}else if(count==0){			
				alert('수량을 잘못선택하셨습니다.');
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
				alert('마일리지 오류')
			}
		})
	})
	
</script>
주문수정화면<br><br>
<form action="<%=request.getContextPath() %>/Oupdate/o_update_pro.jsp" method = "post">
	<table border="1">
			<input type="hidden" name="o_code"value="<%=dbocode%>">
			<input type="hidden" name="n_code"value="<%=o.getN_code()%>">
			<input type="hidden" name="h_id" value="<%=S_ID%>"> 
			<input type="hidden" name="t_count" value="<%=(n_count+dbocount)%>"> 
		<tr>
			<td>상품명</td>
			<td><input type="text" name="n_name" value="<%=dbnname%>" readonly><br></td>
		</tr>
		<tr>
			<td>색상</td>
			<td><span><%=dbcolor%></span></td>
		</tr>
		<tr>
			<td>판매가</td>
			<td><input type="text" name="o_price" size="20" value="<%=dboprice%>"readonly><br /></td>
		</tr>
		<tr>
			<td>수량</td>

			<td><select name="o_count">
				<%
					if((n_count+dbocount)==0) {
				%>
					<option value="0">재고가 없습니다.</option>
				<%		
					}else if((n_count+dbocount)>0) {
				%>
					<option value="0">수량을 정해주세요</option>
				<%		for (int i = 0; i <(n_count+dbocount); i++) {
					
				%>
					<option value="<%=i+1%>"><%=i+1%></option>
				<%
						}
					}
				%>
			</select><br/></td> 
		</tr>
		<tr>
			<td>사용한 마일리지 : </td>
			<td><input type="text" name="o_point" value="<%=o.getO_point()%>" readonly></td>
		</tr>
		<tr>
			<td>최종 주문 금액</td>
			<td><input type="text" name="o_tprice" size="20" readonly><br/></td>
		</tr>
		<tr>
			<td>받으시는분</td>
			<td><input type="text" name="o_name" size="20" value="<%=dboname %>" placeholder=<%=dboname %>><br/></td>
		</tr>
		<tr>
			<td>수령 주소</td>
			<td><input type="text" name="o_addr" size="20" value="<%=dbaddr %>" placeholder=<%=dbaddr %>><br/></td>
		<tr>
		<tr>
			<td>받으실 분 연락처</td>
			<td><input type="number" name="o_phone" size="20" value="<%=dbophone %>" placeholder=<%=dbophone %>><br/></td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td><input type="text" name="o_ask" size="20" value="<%=dbask %>" placeholder=<%=dbask %>><br/></td>
		</tr>
		<tr>
			<td>주문등록을 합니다</td>
			<td><input type="submit" name="o_update" value="주문수정하기"></td>
		</tr>
	</table>
	</form>
</body>
</html>