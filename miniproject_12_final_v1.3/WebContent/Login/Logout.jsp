<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%
	session.invalidate();	//세션 종료
%>
<script type="text/javascript">
	alert('로그아웃');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>