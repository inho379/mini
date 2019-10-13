<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "kr.or.ksmart.dto.Order" %>
<%@ page import = "kr.or.ksmart.dao.Odao" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="o" class="kr.or.ksmart.dto.Order"/>
<jsp:setProperty property="*" name="o"/>
<%
	System.out.println(o.getN_code() + " <-o.getN_code() o.getN_code()");
	
	Odao dao =new Odao();
	dao.oInsert(o);
	String id = o.getH_id();
	String op = o.getO_point();
	String otp =o.getO_tprice();
	dao.oPoint(id, op, otp);
	String n_code = o.getN_code();
	String oc =o.getO_count();
	dao.oCount(oc, n_code);
response.sendRedirect(request.getContextPath()+"/Olist/o_list.jsp");
%>
