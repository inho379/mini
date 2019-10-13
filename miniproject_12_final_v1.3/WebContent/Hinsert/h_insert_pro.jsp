<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="kr.or.ksmart.dao.Hdao"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="h" class="kr.or.ksmart.dto.Human"/>
<jsp:setProperty name="h" property="*"/>		
<%
	System.out.println(h.getH_birth()+"날짜");
	System.out.println(h.getH_level()+"등급");
	Hdao hdao = new Hdao();
	hdao.hInsert(h);
	response.sendRedirect(request.getContextPath()+"/Hlist/h_search_list.jsp");
%>