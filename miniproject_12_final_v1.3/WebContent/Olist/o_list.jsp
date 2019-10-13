<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="kr.or.ksmart.driverdb.DriverDB"%>
<%@page import="kr.or.ksmart.dao.*"%>
<%@page import=" kr.or.ksmart.dto.*"%>
<%@page import="java.util.ArrayList"%>

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


<%@ include file="/module/MainHeader.jsp" %>

<!-- 회원관리 left  column 시작 -->
<%@ include file="/module/LeftSideBar.jsp" %>


<body>
	<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->



			주문리스트
	<br>
	<table width="100%" border="1">
		<tr>
 			<td>상 품 명</td>
 			<td>색     상</td>
			<td>주문자ID</td>
			<td>주문수량</td>
			<td>주문금액</td>
			<td>사용 마일리지</td>
			<td>최종주문금액</td>
			<td>주문 일시</td>
			<td>받는사람 이름</td>
			<td>받는 사람 주소</td>
			<td>받는사람 연락처</td>
			<td>요청사항</td>
	<%
			if(S_LEVEL.equals("구매자")){
	%>
			<td>주문수정</td>
			<td>요청취소</td>
	<%
			}
	%>	
		</tr>
		
	<%	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		Odao dao =new Odao();
		Order o =new Order();

try {
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + "<--conn확인");

		if (conn != null) {
			System.out.println("01 DB연결 성공");
		} else {
			System.out.println("02 DB연결 실패");
		}
		if(S_LEVEL.equals("구매자")){
		pstmt = conn.prepareStatement("SELECT a_notebook.n_name,n_color,a_human.h_id ,a_order.* FROM " 
				+"a_order INNER JOIN a_notebook ON a_order.n_code=a_notebook.n_code INNER JOIN a_human ON a_order.h_id = a_human.h_id WHERE a_order.h_id=?");
		pstmt.setString(1, S_ID);
		}else if(S_LEVEL.equals("판매자")){
		pstmt = conn.prepareStatement("SELECT a_notebook.n_name,n_color,a_human.h_id ,a_order.* FROM " 
					+"a_order INNER JOIN a_notebook ON a_order.n_code=a_notebook.n_code INNER JOIN a_human ON a_order.h_id = a_human.h_id WHERE a_notebook.h_id=?");
		pstmt.setString(1, S_ID);
		}else if(S_LEVEL.equals("관리자")){
			pstmt = conn.prepareStatement("SELECT a_notebook.n_name,n_color,a_human.h_id ,a_order.* FROM " 
					+"a_order INNER JOIN a_notebook ON a_order.n_code=a_notebook.n_code INNER JOIN a_human ON a_order.h_id = a_human.h_id");	
		}
		
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-o_list.jsp");
		//System.out.println(rs.next() + "<-rs.next()_goods_list.jsp");

		while (rs.next()) {
%>
		<tr>
<%	
		Ndao nao=new Ndao();
		ArrayList<NoteBook> nlist =new ArrayList<>();
		
		NoteBook n= new NoteBook();
		n.setnName(rs.getString("n_name"));
		n.setnColor(rs.getString("n_color"));
		nlist.add(n);
%>
		<td><%=n.getnName()	%></td>
		<td><%=n.getnColor()%></td>
		<td><%=rs.getString("h_id")%></td>
		<td><%=rs.getString("o_count")%></td>
		<td><%=rs.getString("o_price")%></td>
		<td><%=rs.getString("o_point")%></td>
		<td><%=rs.getString("o_tprice")%></td>
		<td><%=rs.getString("o_oday")%>	</td>
		<td><%=rs.getString("o_name")%></td>
		<td><%=rs.getString("o_addr")%>	</td>
		<td><%=rs.getString("o_phone")%></td>
		<td><%=rs.getString("o_ask")%></td>
<%
		if(S_LEVEL.equals("구매자")){
%>		
		<td>
		<a href="<%= request.getContextPath() %>/Oupdate/o_update_form.jsp?o_code=<%= rs.getString("o_code")%>">수정버튼</a>			
		</td>
		<td>
		<a href="<%= request.getContextPath() %>/Odelete/o_delete_pro.jsp?o_code=<%= rs.getString("o_code")%>">삭제버튼</a>			
		</td>

<%
		}
%>
		</tr>
<%




		}

		} catch (SQLException ex) {
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			// 6. 사용한 Statement 종료
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}

			// 7. 커넥션 종료
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
%>

	</table>

</body>
</html>