<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<% request.setCharacterEncoding("utf-8"); %>
<%@page import = "kr.or.ksmart.dao.Ndao" %>
<jsp:useBean id="n" class="kr.or.ksmart.dto.NoteBook"/>
<jsp:setProperty name="n" property="*"/>

<%
	String uploadPath = application.getRealPath("/img");
	System.out.println(uploadPath + "<-update uploadPath");
	int maxSize =1024 *1024 *100;// 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	MultipartRequest multi =new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
	
	String nCode = multi.getParameter("nCode");
	String hId = multi.getParameter("hId");
	String nName = multi.getParameter("nName");
	String nColor = multi.getParameter("nColor");
	String nMade = multi.getParameter("nMade");
	String nSday = multi.getParameter("nSday");
	String nCount = multi.getParameter("nCount");
	String nNspec = multi.getParameter("nNspec");
	String nPrice1 = multi.getParameter("nPrice");
	String nSale1 = multi.getParameter("nSale");
	String nImg = multi.getFilesystemName("nImg");
	System.out.println(nCode + " <- nCode 화면에서 넘어온 코드값");
	System.out.println(nImg + " <- nImg 화면에서 넘어온 이미지 파일");
	int count = Integer.parseInt(nCount);
	int price = Integer.parseInt(nPrice1);
	int sale = Integer.parseInt(nSale1);
	
	//할인
	float nSprice;
	float perSale = (float)((100-sale)*0.01);
	System.out.println(perSale + "<-perSale");
	nSprice = price*perSale;
	System.out.println(nSprice + "<-Sprice");
	
	n.setnSprice(nSprice);
	n.setnCode(nCode);
	n.sethId(hId);
	n.setnName(nName);
	n.setnColor(nColor);
	n.setnMade(nMade);
	n.setnSday(nSday);
	n.setnCount(count);
	n.setnNspec(nNspec);
	n.setnPrice(price);
	n.setnSale(sale);
	n.setnImg(nImg);

	System.out.println(n.getnCode() + " <-n.getnCode()");
	Ndao dao = new Ndao();
	String img = dao.nUpdate(n,n.getnSprice());
		
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
	
// 		String fileName1 ="";// 중복처리된 이름
// 	    String originalName1 ="";// 중복 처리전 실제 원본 이름
// 	    long fileSize =0;// 파일 사이즈
// 	    String fileType ="";// 파일 타입
		
// 	try{
// 	    // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
// 	    System.out.println(multi + "<-multi");
	  
// 	    // 전송한 전체 파일이름들을 가져옴
// 	    Enumeration<?> files = multi.getFileNames();
	     
// 	    while(files.hasMoreElements()){
// 	        // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
// 	        String file1 = (String)files.nextElement();// 파일 input에 지정한 이름을 가져옴
// 	        // 그에 해당하는 실재 파일 이름을 가져옴
// 	        originalName1 = multi.getOriginalFileName(file1);
// 	        // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
// 	        // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
// 	        fileName1 = multi.getFilesystemName(file1);
// 	        // 파일 타입 정보를 가져옴
// 	        fileType = multi.getContentType(file1);
// 	        // input file name에 해당하는 실재 파일을 가져옴
// 	        File file = multi.getFile(file1);
// 	        // 그 파일 객체의 크기를 알아냄
// 	        fileSize = file.length();
// 	    }
	
// 	}catch(Exception e){
// 	    e.printStackTrace();
// 	}
	
	 response.sendRedirect(request.getContextPath()+"/Nsearch/n_search_list.jsp");
%>