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
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>
<%@ include file="/module/LeftSideBar.jsp" %>

<!-- 리스트 처리 -->
<%@ page import = "kr.or.ksmart.dao.Ndao" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "kr.or.ksmart.dto.NoteBook"%>
<% request.setCharacterEncoding("utf-8"); %>

	<table border="1" width="500px">
		<tr>
			<td>이미지</td><td>상품명</td><td>제조사</td>
			<!-- 
			<td>상품색상</td><td>제조사</td><td>스펙</td>
			<td>재고수량</td><td>출시일</td><td>가격 </td><td>할인가격</td>
			 -->
		</tr>
	
<%

	System.out.println(S_ID + " <- 세션 등록 아이디");
	System.out.println(S_NAME + " <- 세션 등록 이름");
	System.out.println(S_LEVEL + " <- 세션 등록 권한");
	
	Ndao dao = new Ndao();
 	ArrayList<NoteBook> arry = null;
 	
	
		
 
	//관리자 권한
		if("관리자".equals(S_LEVEL)){
			System.out.println(S_LEVEL + " <- S_LEVEL 관리자 권한");
			arry = dao.nlist();
		
			for(int i=0; i< arry.size(); i++){
		 		NoteBook n = arry.get(i);
		 		String code = n.getnCode();
		 		System.out.println(code + " <-code");
%>	 		
		<!--관리자 권한으로 로그인시 상품 리스트   -->
		 <tr>
			<td><a href="<%=request.getContextPath()%>/Nlist/n_list_details.jsp?code=<%=code %>"><img src="../img/<%=n.getnImg() %>" alt="" style="width: 200px; height: 150px;"></a></td>
			<td><%=n.getnName()%></td>
			<td><%=n.getnMade()%></td>
			<td><a href="<%=request.getContextPath() %>/Nupdate/n_update_form.jsp?code=<%=code %>">수정하기</a></td>
			<td><a href="<%=request.getContextPath() %>/Ndelete/n_delete_pro.jsp?code=<%=code %>">삭제하기</a></td>
			<td><a href="<%=request.getContextPath() %>/Oinsert/o_insert_form.jsp?code=<%=code %>">주문하기</a></td>
		</tr>		
<%
			}
		}else if("구매자".equals(S_LEVEL) || null==S_LEVEL){
			System.out.println(S_LEVEL + " <- S_LEVEL 구매자 권한");
			arry = dao.nlist();
			
			for(int i=0; i< arry.size(); i++){
		 		NoteBook n = arry.get(i);
		 		String code = n.getnCode();
		 		System.out.println(code + " <-code");
%>	 		
		<!--구매자 권한으로 로그인시 상품 리스트   -->
		 <tr>
			<td><a href="<%=request.getContextPath()%>/Nlist/n_list_details.jsp?code=<%=code %>"><img src="../img/<%=n.getnImg() %>" alt="" style="width: 200px; height: 150px;"></a></td>
			<td><%=n.getnName()%></td>
			<td><%=n.getnMade()%></td>
		</tr>		
<%		
			}
		}else if("판매자".equals(S_LEVEL)){
			System.out.println(S_LEVEL + " <- S_LEVEL 구매자 권한");
			arry = dao.nlist(S_ID);
			System.out.println(arry.size() + " <- arry.size() 사이즈");
			for(int i=0; i< arry.size(); i++){
		 		NoteBook n = arry.get(i);
		 		String code = n.getnCode();
		 		System.out.println(code + " <-code");
			//쿼리 조인 활용 아이디와 권한에 일치하는 상품 리스트 조회
%>	 		
		<!--판매자 권한으로 로그인시 상품 리스트   -->
		 <tr>
			<td><a href="<%=request.getContextPath()%>/Nlist/n_list_details.jsp?code=<%=code %>"><img src="../img/<%=n.getnImg() %>" alt="" style="width: 200px; height: 150px;"></a></td>
			<td><%=n.getnName()%></td>
			<td><%=n.getnMade()%></td>
			<td><a href="<%=request.getContextPath() %>/Nupdate/n_update_form.jsp?code=<%=code %>">수정하기</a></td>
			<td><a href="<%=request.getContextPath() %>/Ndelete/n_delete_pro.jsp?code=<%=code %>">삭제하기</a></td>
		</tr>		
<%
			}
	 	}
%>

</table>
<%@ include file="/module/MainFooter.jsp" %>
	
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>

<%-- <tr>
			<td><a href="<%=request.getContextPath()%>/Nlist/n_list_details.jsp?code=<%=code %>"><img src="../img/<%=n.getnImg() %>" alt="" style="width: 200px; height: 150px;"></a></td>
			<td><%=n.getnName()%></td>
			<td><%=n.getnMade()%></td>
			<td><a href="<%=request.getContextPath() %>/Nupdate/n_update_form.jsp?code=<%=code %>">수정하기</a></td>
			<td><a href="<%=request.getContextPath() %>/Ndelete/n_delete_pro.jsp?code=<%=code %>">삭제하기</a></td>
		</tr> --%>
