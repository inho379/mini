<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	String S_ID = (String)session.getAttribute("S_ID");
	String S_NAME = (String)session.getAttribute("S_NAME");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	System.out.println(S_ID + "<- S_ID LoginForm.jsp");
	System.out.println(S_NAME + "<- S_NAME LoginForm.jsp");
	System.out.println(S_LEVEL + "<- S_LEVEL LoginForm.jsp");
%>
<!--  header 시작 -->
<div class="header">
	<a href="<%= request.getContextPath() %>/index.jsp">
		<label>
			<span style="font-size: 50px;color:#555"><strong>다나와</strong></span><br>
			<span style="font-size: 20px">비교하고 잘 사는 다나와.</span>
		</label>
	</a>
</div>
<!--  네비게이션 바 시작  -->
<nav class="navbar navbar-expand-md navbar-inverse">
	<div class="container">
<%
if("관리자".equals(S_LEVEL)){
%>
		<ul class="nav navbar-nav">
			<li><a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
			<li><a href="<%= request.getContextPath() %>/Hlist/h_search_list.jsp">회원목록</a></li>
			<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp">상품목록</a></li>
			<li><a href="<%= request.getContextPath() %>/Osearch/o_search_list.jsp">주문목록</a></li>
			<li><a href="<%= request.getContextPath() %>/Osearch/o_list.jsp">total</a></li>
		</ul>
<%
}else{
%>
		<ul class="nav navbar-nav">
			<li><a class="navbar-brand" href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
			<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp">상품목록</a></li>
		</ul>
<%	
}
%>
		
		<ul class="nav navbar-nav navbar-right">
			<%if(S_LEVEL == null){%>
				<li><a href="<%= request.getContextPath() %>/Hinsert/h_insert_form.jsp"><span class="glyphicon glyphicon-user"></span>
						회원가입</a></li>
				<li><a href="<%= request.getContextPath() %>/Login/LoginForm.jsp"><span class="glyphicon glyphicon-log-in"></span>
						로그인</a></li>
			<%}else{%>
				<li style="color: white; text-align: center; margin-top: 13px"><strong><span><%= S_NAME %>님   </span><span><%= S_LEVEL %>로 로그인</span></strong></li>
			
			<%
				if("판매자".equals(S_LEVEL)){
			%>
					<li><a href="<%= request.getContextPath() %>/Olist/o_list.jsp"><span class="glyphicon glyphicon-user"></span>
					내 판매 상품 보기</a></li>
					<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list_my.jsp"><span class="glyphicon glyphicon-user"></span>
					내 등록 상품 보기</a></li>
			<%
				}else if("관리자".equals(S_LEVEL)){
			
			%>
					<li><a href="<%= request.getContextPath() %>/Olist/o_list.jsp"><span class="glyphicon glyphicon-user"></span>
					전체 상품 보기</a></li>
			<%
				}else if("구매자".equals(S_LEVEL)){
				%>
					<li><a href="<%= request.getContextPath() %>/Olist/o_list.jsp"><span class="glyphicon glyphicon-user"></span>
					내 주문보기</a></li>
			<%	
				}
			%>
					<li>
						<a href="<%=request.getContextPath()%>/Hupdate/pwcheck.jsp?h_id=<%= S_ID %>">
							내 정보 수정
						</a>
					</li>
					<li><a href="<%= request.getContextPath() %>/Login/Logout.jsp"><span class="glyphicon glyphicon-log-out"></span>
					로그아웃</a></li>
			<%
			} 
			%>		
		</ul>
		
	</div>
</nav>
<!--  header 끝 -->