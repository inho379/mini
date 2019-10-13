<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import = "kr.or.ksmart.dao.Ndao" %>
<%@page import = "kr.or.ksmart.dto.NoteBook" %>
<%@page import = "java.io.File" %>
<%
	String uploadPath = application.getRealPath("/img");
	System.out.println(uploadPath + "<-uploadPath");

	String code = request.getParameter("code");
	System.out.println(code + " <-삭제 하기 버튼 클릭시 넘오오는 코드값");
	
	Ndao dao = new Ndao();
	String img = dao.nDelete(code);
	System.out.println(img + " <-img 삭제 처리후 리턴값");
	
	uploadPath = application.getRealPath("/img/"+img);
	System.out.println(uploadPath + "<-uploadPath");
	
	if(img != null) {
	      
		File file = new File(uploadPath); 
		
		if(file.delete()){ 
			System.out.println("파일삭제 성공"); 
			
		}else{ 
			System.out.println("파일삭제 실패"); 
		}
	}


		
	
		
 
	//System.out.println(n + " <-n 삭제 처리후 리턴값");
	response.sendRedirect(request.getContextPath()+"/Nlist/n_list.jsp");
%>