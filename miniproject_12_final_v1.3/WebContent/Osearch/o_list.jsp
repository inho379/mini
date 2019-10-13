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

<!-- 리스트1 -->
<div class="container">
  <h2>리스트1.회원정보</h2>   
<table width="100%" border="1" class="table table-bordered">
<tr>
	<td>아이디</td><td>회원등급</td><td>닉네임</td><td>마일리지</td>
</tr>

	<%
	request.setCharacterEncoding("utf-8");

	Odao dao1 = new Odao();
	ArrayList<String[]> result1 = dao1.list1();
	for(int i = 0; i < 4; i++){
		String[] strlist1=result1.get(i);
	%>
			<tr>
				<td><%= strlist1[0]%></td>
				<td><%= strlist1[1]%></td>
				<td><%= strlist1[2]%></td>
				<td><%= strlist1[3]%></td>
			</tr>
	<%
		}
	%>	
</table>

</div>

<!-- 리스트2 -->
<div class="container">
  <h2>리스트2.상품정보</h2>  
<table width="100%" border="1" class="table table-bordered">
<tr>
	<td>상품코드</td><td>상품명</td><td>제조사</td><td>가격</td><td>할인가격</td><td>이미지</td>
</tr>

	<%
	request.setCharacterEncoding("utf-8");

	Odao dao2 = new Odao();
	ArrayList<String[]> result2 = dao2.list2();
	for(int i = 0; i < 4; i++){
		String[] strlist2=result2.get(i);
	%>
			<tr>
				<td><%= strlist2[0]%></td>
				<td><%= strlist2[1]%></td>
				<td><%= strlist2[2]%></td>
				<td><%= strlist2[3]%></td>
				<td><%= strlist2[4]%></td>
				<td><img src="../img/<%=strlist2[5] %>" alt="" style="max-width: 100px; max-height: 130px;"></td>
			</tr>
	<%
		}
	%>	
</table>

</div>

<!-- 리스트3 -->
<div class="container">
  <h2>리스트3.주문정보</h2>
<table width="100%" border="1" class="table table-bordered">
<tr>
	<td>주문번호</td><td>상품코드</td><td>최종주문금액</td><td>주문일</td><td>받는사람이름</td><td>받는사람연락처</td>
</tr>
	<%
	request.setCharacterEncoding("utf-8");

	Odao dao3 = new Odao();
	ArrayList<String[]> result3 = dao3.list3();
	for(int i = 0; i < 4; i++){
		String[] strlist3=result3.get(i);
	%>
			<tr>
				<td><%= strlist3[0]%></td>
				<td><%= strlist3[1]%></td>
				<td><%= strlist3[2]%></td>
				<td><%= strlist3[3]%></td>
				<td><%= strlist3[4]%></td>
				<td><%= strlist3[5]%></td>
			</tr>
	<%
		}
	%>	
</table>

</div>

<!-- 리스트4 -->
<div class="container">
  <h2>리스트4.판매자-상품정보</h2>
<table width="100%" border="1" class="table table-bordered">
<tr>
	<td>판매자아이디</td><td>판매자이름</td><td>판매자번호</td><td>상품코드</td><td>상품명</td><td>상품가격</td><td>상품수량</td><td>이미지</td>
</tr>
	<%
	request.setCharacterEncoding("utf-8");

	Odao dao4 = new Odao();
	ArrayList<String[]> result4 = dao4.list4();
	for(int i = 0; i < 4; i++){
		String[] strlist4=result4.get(i);
	%>
			<tr>
				<td><%= strlist4[0]%></td>
				<td><%= strlist4[1]%></td>
				<td><%= strlist4[2]%></td>
				<td><%= strlist4[3]%></td>
				<td><%= strlist4[4]%></td>
				<td><%= strlist4[5]%></td>
				<td><%= strlist4[6]%></td>
				<td><img src="../img/<%=strlist4[7] %>" alt="" style="max-width: 100px; max-height: 130px;"></td>
			</tr>
	<%
		}
	%>	
</table>

</div>

<!-- 리스트5 -->
<div class="container">
  <h2>리스트5.구매자-주문정보</h2>
<table width="100%" border="1" class="table table-bordered">
<tr>
	<td>구매자아이디</td><td>구매자이름</td><td>구매자번호</td><td>주문코드</td><td>최종주문금액</td><td>주문일</td><td>받는사람이름</td><td>받는사람전화번호</td>
</tr>
	<%
	request.setCharacterEncoding("utf-8");

	Odao dao5 = new Odao();
	ArrayList<String[]> result5 = dao5.list5();
	for(int i = 0; i < 4; i++){
		String[] strlist5=result5.get(i);
	%>
			<tr>
				<td><%= strlist5[0]%></td>
				<td><%= strlist5[1]%></td>
				<td><%= strlist5[2]%></td>
				<td><%= strlist5[3]%></td>
				<td><%= strlist5[4]%></td>
				<td><%= strlist5[5]%></td>
				<td><%= strlist5[6]%></td>
				<td><%= strlist5[7]%></td>
			</tr>
	<%
		}
	%>	
</table>

</div>

<!-- 리스트6 -->
<div class="container">
  <h2>리스트6. 회원-상품-주문 조회 </h2>
<table width="100%" border="1"class="table table-bordered">
<tr>
	<td>주문코드</td><td>주문자아이디</td><td>주문자번호</td><td>상품코드</td><td>상품명</td><td>할인된상품가격</td><td>주문수량</td><td>최종주문가격</td><td>받는사람이름</td><td>받는사람연락처</td><td>요청사항</td>
</tr>
	<%
	request.setCharacterEncoding("utf-8");

	Odao dao6 = new Odao();
	ArrayList<String[]> result6 = dao6.list6();
	for(int i = 0; i < 4; i++){
		String[] strlist6=result6.get(i);
	%>
			<tr>
				<td><%= strlist6[0]%></td>
				<td><%= strlist6[1]%></td>
				<td><%= strlist6[2]%></td>
				<td><%= strlist6[3]%></td>
				<td><%= strlist6[4]%></td>
				<td><%= strlist6[5]%></td>
				<td><%= strlist6[6]%></td>
				<td><%= strlist6[7]%></td>
				<td><%= strlist6[8]%></td>
				<td><%= strlist6[9]%></td>
				<td><%= strlist6[10]%></td>
			</tr>
	<%
		}
	%>	
</table>
 <%@ include file="/module/MainFooter.jsp" %>
	
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>
    