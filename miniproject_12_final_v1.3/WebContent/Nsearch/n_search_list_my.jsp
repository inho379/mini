<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>		
<%@page import="java.util.List"%>
<%@page import="kr.or.ksmart.dao.Ndao"%>
<%@page import="java.util.ArrayList" %>
<%@page import="kr.or.ksmart.dto.NoteBook" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품관리 - 다나와</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
<style type="text/css">

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{

vertical-align : baseline;

}



</style>
</head>
<body>
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>

<!-- 회원관리 left  column 시작 -->
<%@ include file="/module/LeftSideBar.jsp" %>

<%
String rday1 = request.getParameter("rday1");
String rday2 = request.getParameter("rday2");	
String name = request.getParameter("name");

System.out.println(rday1 +"<--rday1 값");
System.out.println(rday2 +"<--rday2 값");
System.out.println(name +"<--name 값");
Ndao ndao = new Ndao();
ArrayList<NoteBook> h = null;
h =ndao.nSearch(rday1,rday2,name);


System.out.println(S_ID + " <- 세션 등록 아이디");
System.out.println(S_NAME + " <- 세션 등록 이름");
System.out.println(S_LEVEL + " <- 세션 등록 권한");
%>

<div class="container">
<div class="page-header js-affix affix-top" style="width: auto; left: auto;">
    <h3>상품 검색</h3>
    <a href="<%= request.getContextPath() %>/Ninsert/n_insert_form.jsp">
    <button type="button" class="btn btn-danger btn-block" style="width:150px; float:right; margin-top: -40px">상품등록</button>
    </a>
</div>
  
   <form action="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp" method="post" style="margin-bottom: 40px;">
	기간 : <input type="date" name="rday1">~<input type="date" name="rday2">
	상품명 : <input type="text" class="btn btn-info "name="name">
	<!-- 상품명<input type="text" name="name"> -->
	 <!-- <input type="submit"  value="검색">  -->
	 <button type="submit" class="btn btn-info">검색</button>
	 
	 
	
</form> 
  <table class="table table-bordered" style=" text-align: center; margin: auto; vertical-align: center;">
    <thead>
      <tr>
      	<td>번호</td>
		<td>아이디</td>		
        <td>상품코드</td>
		<td>이미지</td>
		<td>상품명</td>
		<td>판매가</td>
		<td>제조사</td>
		<td>재고</td>
		<td>등록일</td>
		<td>수정</td>	
		<td>삭제</td>		
      </tr>
    </thead>
    <tbody>
<%
	for(int i=0; i< h.size(); i++){
 		NoteBook n = h.get(i);
 		if(S_ID.equals(n.gethId())){
%>
     <tr>
     	<td><%= i+1 %></td>
		<td><%=n.gethId()%></td>
		<td><%=n.getnCode()%></td>
		<td style="width : 120px;">
		<a href="<%=request.getContextPath()%>/Nlist/n_list_details.jsp?code=<%=n.getnCode()  %>"><img src="../img/<%=n.getnImg() %>" alt="" style="max-width: 100px; max-height: 130px;"></a>
		</td>	
		<td><%=n.getnName()%></td>
		<td><%=n.getnPrice()%></td>
		<td><%=n.getnMade()%></td>
		<td><%=n.getnCount()%></td>		
		<td><%=n.getnRday()%></td>
		<td><a href="<%=request.getContextPath() %>/Nupdate/n_update_form.jsp?code=<%=n.getnCode() %>">수정하기</a></td>
		<td><a href="<%=request.getContextPath() %>/Ndelete/n_delete_pro.jsp?code=<%=n.getnCode()  %>">삭제하기</a></td>
<%			 
			}
		}
%>			
		</tr>
    </tbody>
  </table>
</div>
<%@ include file="/module/MainFooter.jsp" %>
	
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>



<!-- https://www.w3schools.com/bootstrap/tryit.asp?filename=trybs_pager&stacked=h
 -->









