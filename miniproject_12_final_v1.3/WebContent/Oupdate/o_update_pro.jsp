<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "kr.or.ksmart.dao.Odao" %>
<%@ page import="kr.or.ksmart.driverdb.DriverDB" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="o" class="kr.or.ksmart.dto.Order"/>
<jsp:setProperty property="*" name="o"/>
<%
	int tcount=Integer.parseInt(request.getParameter("t_count"));
	Odao dao =new Odao();
	String n_code = o.getN_code();
	System.out.println(n_code + "<-- n_code 확인");
	System.out.println(o.getO_point() + "<-- 포인트 확인");
	dao.oUpdate(o);
	int ocount= tcount-Integer.parseInt(o.getO_count());
	dao.oCountUpdate(ocount, n_code);
	response.sendRedirect(request.getContextPath() + "/Olist/o_list.jsp");

%>