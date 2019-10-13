<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.or.ksmart.dao.Hdao"%>
<%@ page import="kr.or.ksmart.dto.Human"%>
<%
	response.setContentType("application/json");
	response.setHeader("Content-Disposiont", "inline");
	//리스트 처리
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String level = request.getParameter("level");
	String gender = request.getParameter("gender");
	String permit = request.getParameter("permit");	
	String jday1 = request.getParameter("jday1");	
	String jday2 = request.getParameter("jday2");	
	String bday1 = request.getParameter("bday1");	
	String bday2 = request.getParameter("bday2");	
	String s_pn = request.getParameter("pn");
	int pn = Integer.parseInt(s_pn);
	System.out.println(id + "<- id");
	System.out.println(name + "<- name");
	System.out.println(nick + "<- nick");
	System.out.println(level + "<- level");
	System.out.println(gender + "<- gender");
	System.out.println(permit + "<- permit");
	System.out.println(jday1 + "<- jday1");
	System.out.println(jday2 + "<- jday2");
	System.out.println(bday1 + "<- bday1");
	System.out.println(bday2 + "<- bday2");
	System.out.println(pn + "<- pn");
	Hdao hdao = new Hdao();
	List<Human> h = null;
	h = hdao.hList(id, name, nick, gender, level, permit, jday1, jday2, bday1, bday2);
	//페이징 처리
	System.out.println(h.size());
	String lpage = request.getParameter("page");
	System.out.println(lpage + "<- page");
	int p=Integer.parseInt(lpage);					//선택한 페이지
	int c_page=pn;									//출력 희망 갯수
	int f_page=c_page;								//출력할 최대치
	int i_pc=0;										//인원 확인
	if(h.size()<c_page*p){							//출력할 갯수 모자를 경우
		f_page = h.size();							//최대치는 사이즈 만큼
		i_pc=f_page-c_page*(p-1);
	}else{											//출력이 가능한 경우
		f_page = c_page*p;
		i_pc=c_page;
	}
	int t = 0;
	t = h.size() / c_page;
	if (h.size() % c_page != 0) {
		t += 1;
	}
%>
<span style="font-size:15px">검색 <span style="font-weight:bold"><%=i_pc%></span> 명 / 전체 <span style="font-weight:bold"><%=h.size()%></span> 명</span>
<table id="table"  class="table table-rows" style="width:100%;text-align:left;text-indent:5px;">
	<tr style="width:100%;text-align:center;background-color:#ccc;font-weight:bold">
		<td>아이디</td>
		<td>비번</td>
		<td>이름</td>
		<td>성별</td>
		<td>전화번호</td>
		<td>주소</td>
		<td>이메일</td>
		<td>닉네임</td>
		<td>가입일</td>
		<td>생일</td>
		<td>마일리지</td>
		<td>회원등급</td>
		<%
			if (permit.equals("O")) {
		%>
		<td>정보수정</td>
		<%
			} else if (permit.equals("X")) {
		%>
		<td>가입승인</td>
		<%
			} else if (permit.equals("")) {
		%>
		<td>승인여부</td>
		<%
			}
		%>
		<td>회원탈퇴</td>
	</tr>
	<%
		for (int i = (c_page*p)-c_page; i < f_page; i++) {
	%>
	<tr>
		<td><%=h.get(i).getH_id()%></td>
		<td><%=h.get(i).getH_pw()%></td>
		<td><%=h.get(i).getH_name()%></td>
		<td><%=h.get(i).getH_gender()%></td>
		<td><%=h.get(i).getH_phone()%></td>
		<td><%=h.get(i).getH_addr()%></td>
		<td><%=h.get(i).getH_email()%></td>
		<td><%=h.get(i).getH_nick()%></td>
		<td><%=h.get(i).getH_jday()%></td>
		<td><%=h.get(i).getH_birth()%></td>
		<td><%=h.get(i).getH_point()%></td>
		<td><%=h.get(i).getH_level()%></td>
		<%
			if (permit.equals("O")) {
		%>
		<td><a
			href="<%=request.getContextPath()%>/Hupdate/h_update_form.jsp?h_id=<%=h.get(i).getH_id()%>"><button type="button" class="btn btn-white">정보수정</button></a>
		</td>
		<%
			} else if (permit.equals("X")) {
		%>
		<td><a
			href="<%=request.getContextPath()%>/Hupdate/h_update_pro.jsp?h_id=<%=h.get(i).getH_id()%>&permit=O"><button type="button" class="btn btn-white">가입승인</button></a>
		</td>
		<%
			} else if (permit.equals("")) {
		%>
		<td><%=h.get(i).getH_permit()%>
		</td>
		<%
			}
		%>
		<td><a href="<%=request.getContextPath()%>/Hdelete/h_delete_pro.jsp?h_id=<%=h.get(i).getH_id()%>"><button type="button" class="btn btn-white">회원탈퇴</button></a>
		</td>
	</tr>
	<%
		}
	%>
	<tr>
</tr>
</table>
<div class="table-action">
</div>

<div class="center">
	<nav>
		<ul class="pagination pagination-sm">
			<%
 				for (int i = 1; i <= t; i++) { 
			%>
				<li class="active" onclick="page(<%=i%>)"><span><%=i%></span></li>
			<%
 				}
			%>
		</ul>
	</nav>
</div>