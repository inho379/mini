<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>

<%
String h_id = request.getParameter("h_id");
String h_pw = request.getParameter("h_pw");
System.out.println(h_id + "<- h_id login_pro.jsp");
System.out.println(h_pw + "<- h_pw login_pro.jsp");
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String dbid = null;
String dbpw = null;
String dblevel = null;
String dbname = null;

String alert = null;

DriverDB db = new DriverDB();
conn = db.driverDbcon();
System.out.println(conn + "<- conn LoginPro.jsp");

pstmt = conn.prepareStatement("select h_id,h_pw,h_level,h_name from a_human WHERE h_id=?");
pstmt.setString(1, h_id);

System.out.println(pstmt + "<-- pstmt LoginPro.jsp");
rs = pstmt.executeQuery();

//System.out.println(rs.next() + "<-- rs.next() login_pro.jsp");

	if(rs.next()){
		System.out.println("01아이디일치");
		dbid = rs.getString("h_id");
		dbpw = rs.getString("h_pw");
		dblevel = rs.getString("h_level");
		dbname = rs.getString("h_name");
		System.out.println(dbpw + "<- dbpw LoginPro.jsp");
		System.out.println(dblevel + "<- dblevel LoginPro.jsp");
		System.out.println(dbname + "<- dbname LoginPro.jsp");
		if(h_pw.equals(dbpw)){
			System.out.println("03로그인성공");
			session.setAttribute("S_ID", dbid);
			session.setAttribute("S_NAME", dbname);
			session.setAttribute("S_LEVEL", dblevel);
			
			alert = "로그인성공";
		}else{
			System.out.println("04비번불일치");
			alert = "비번불일치";
		}
	}else{
		System.out.println("02아이디불일치");
		alert = "아이디불일치";
	}
%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>	
<%
rs.close();
pstmt.close();
conn.close();
%>