<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@page import="kr.or.ksmart.dao.Hdao"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="h" class="kr.or.ksmart.dto.Human"/>
<jsp:setProperty name="h" property="*"/>		
<%	
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	Hdao hdao = new Hdao();
	String h_id = request.getParameter("h_id");
	String permit = request.getParameter("permit");
	if("O".equals(permit)){
		hdao.hCheck(h_id);
	}else{		
		hdao.hUpdate(h);
		if("관리자".equals(S_LEVEL)){
			response.sendRedirect(request.getContextPath()+"/Hlist/h_search_list.jsp");
		}else{
			response.sendRedirect(request.getContextPath()+"/index.jsp");
		}
	}
%>