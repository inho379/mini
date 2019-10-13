<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스마트한 쇼핑검색, 다나와! : 가격비교</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
</head>
<body>
<%@ include file="/module/MainHeader.jsp" %>
<%@ include file="/module/LeftSideBar.jsp" %>
<%@ page import = "kr.or.ksmart.dao.Odao" %>
<%@ page import = "java.util.ArrayList" %>	

<form action="<%=request.getContextPath()%>/Osearch/o_search_list.jsp" method = "post" name="myForm">
			
	<div class="form-group">
		<label for="sel1">원하는 조건을 선택해주세요.</label>
		<select name = "scvalue" class="form-control" id="sel1" >
			<option value="a_human.h_id">구매자 아이디</option>
			<option value="a_order.o_code">주문번호</option>
			<option value="n_name">상품명</option>
			<option value="a_notebook.n_code">상품코드</option>
			<option value="o_name">받는사람이름</option>
		</select>
	</div>
	<div class="form-group">
			<input type = "text" name = "stvalue" class="form-control" id="usr" >
	</div>
		
	<div class="form-group">
		<label for="sel1">기간별</label>
		<select name = "selday" class="form-control" id="sel1">
			<option value="o_oday">주문일</option>
		</select>
		<br/>
		<label for="sel1">날짜선택</label>
			
			<input type = "date" name = "nsday2" class="form-control" id="usr" >
			
			&nbsp;&nbsp;<i class="glyphicon glyphicon-minus"></i>
			
			<input type = "date" name = "nsday3" class="form-control" id="usr" >
	
	</div>
		
			<div class="form-group">
				<label for="sel1">최종주문금액</label>
					<input type = "number" name = "otprice2" class="form-control" id="usr">
			</div>
				
			&nbsp;&nbsp;<i class="glyphicon glyphicon-minus"></i>
			<br>
			&nbsp;
			<div class="form-group">
				<input type = "number" name = "otprice3" class="form-control" id="usr">
			</div>	
		
				<input type = "submit" value = "검색버튼" class="btn btn-info">
</form>


	<div class="container">
		<h2>검색결과</h2>  
			<table width="100%" border="1" class="table">
				<tr>
					<td>주문번호</td><td>상품코드</td><td>구매자아이디</td><td>상품명</td><td>할인된상품가격</td><td>소모마일리지</td><td>주문수량</td><td>최종주문금액</td><td>주문일</td><td>받는사람이름</td><td>받는사람주소</td><td>받는사람연락처</td><td>요청사항</td>
				</tr>
	</div>

	<%
	request.setCharacterEncoding("utf-8");
	String scvalue = request.getParameter("scvalue");
	String stvalue = request.getParameter("stvalue");
	System.out.println(scvalue + "<- scvalue");
	System.out.println(stvalue + "<- stvalue");
	
	String selday = request.getParameter("selday");
	String nsday2 = request.getParameter("nsday2");
	String nsday3 = request.getParameter("nsday3");
	System.out.println(selday + "<- selday");
	System.out.println(nsday2 + "<- nsday2");
	System.out.println(nsday3 + "<- nsday3");
	
	String otprice2 = request.getParameter("otprice2");
	String otprice3 = request.getParameter("otprice3");
	System.out.println(otprice2 + "<- otprice2");
	System.out.println(otprice3 + "<- otprice3");
	
	Odao dao = new Odao();
	ArrayList<String[]> result = dao.tSearch(scvalue, stvalue, selday, nsday2, nsday3, otprice2, otprice3);
	for(int i = 0; i <result.size(); i++){
		String[] str=result.get(i);
	%>
			<tr>
				<td><%= str[0]%></td>
				<td><%= str[1]%></td>
				<td><%= str[2]%></td>
				<td><%= str[3]%></td>
				<td><%= str[4]%></td>
				<td><%= str[5]%></td>
				<td><%= str[6]%></td>
				<td><%= str[7]%></td>
				<td><%= str[8]%></td>
				<td><%= str[9]%></td>
				<td><%= str[10]%></td>
				<td><%= str[11]%></td>
				<td><%= str[12]%></td>
			</tr>
	<%
		}
	%>	

</table>

 <%@ include file="/module/MainFooter.jsp" %>
	
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
    