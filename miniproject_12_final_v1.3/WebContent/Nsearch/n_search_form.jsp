<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


   <form action="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp" method="post">
	기간<input type="date" name="rday1">~<input type="date" name="rday2">
	상품명 : <input type="text" class="btn btn-info "name="name">
	<!-- 상품명<input type="text" name="name"> -->
	 <!-- <input type="submit"  value="검색">  -->
	 <button type="submit" class="btn btn-info">검색</button>
	
</form>
<table id="table" border="1" style="width: 100%;">
	<tr>
		<td>상품명</td>
		<td>아이디</td>		
		<td>색상</td>
		<td>제조사</td>
		<td>가격</td>
		<td>등록일시</td>
		<td>출시일시</td>
		<td>할인가격</td>
		<td>상품 등록 수량</td>		
	</tr>
</table>	