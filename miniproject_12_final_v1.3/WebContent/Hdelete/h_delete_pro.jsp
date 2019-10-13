<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="kr.or.ksmart.dao.Hdao"%>
<%	request.setCharacterEncoding("utf-8"); %>
<%	
	String h_id = request.getParameter("h_id");
	Hdao hdao = new Hdao();
	hdao.hDelete(h_id);
	response.sendRedirect(request.getContextPath()+"/Hlist/h_search_list.jsp");
%>