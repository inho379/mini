<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<style type="text/css">
@import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
/* Side Navigation */

@media(min-width:768px) {
    .side-nav {
    border-top: 1px rgba(0,0,0,.5) solid;
    background-color: #6E7074;
    padding-bottom: 100px;

    }

    .side-nav>li>a {
        width: 200px;
        border-bottom: 1px rgba(0,0,0,.3) solid;
    }

    .side-nav li a:hover,
    .side-nav li a:focus {
        outline: none;
        background-color: #1a242f !important;
    }
}

.side-nav>li>ul {
    padding: 0;
    border-bottom: 1px rgba(0,0,0,.3) solid;
}

.side-nav>li>ul>li>a {
    display: block;
    padding: 10px 15px 10px 38px;
    text-decoration: none;
    /*color: #999;*/
    color: #333333;
    background-color: #FCFCFC;   
}

.side-nav>li>ul>li>a:hover {
    color: #fff;
}

.navbar .nav > li > a > .label {
  -webkit-border-radius: 50%;
  -moz-border-radius: 50%;
  border-radius: 50%;
  position: absolute;
  top: 14px;
  right: 6px;
  font-size: 10px;
  font-weight: normal;
  min-width: 15px;
  min-height: 15px;
  line-height: 1.0em;
  text-align: center;
  padding: 2px;
}

.navbar .nav > li > a:hover > .label {
  top: 10px;
}

.navbar-brand {
    padding: 5px 15px;
}

.col-md-3{
background-color: #FCFCFC; 
max-width:230px; 
border-right: 1px solid #888888;
}


</style>
<!-- LeftSidebar 시작 -->
<div id="throbber" style="display:none; min-height:120px;"></div>
<div id="noty-holder"></div>
<div class="container" style="margin-left: 0px; margin-right:0px; padding-left: 0px; padding-right: 20px; width: 100%">
	<div class="row" style="display: flex; border-bottom: 1px solid #888888;">
		<div class="col-md-3">
		        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
		        <div class="collapse navbar-collapse navbar-ex1-collapse navbar-inverse" style="padding-left: 0px; padding-right: 0px; width: 214px; background-color: #FCFCFC;">
		            <ul class="nav navbar-nav side-nav" style="background-color: #FCFCFC;">
		                

<%
String S_LEVEL1 = (String)session.getAttribute("S_LEVEL");
System.out.println(S_LEVEL1 + "<- S_LEVEL LoginForm.jsp");
if("관리자".equals(S_LEVEL1)){
%>
	 <li>
         <a href="#" data-toggle="collapse" data-target="#submenu-1" style="background-color: #AEAEAE; color: white;"><i class="fa fa-fw fa-search"></i>회원관리<i class="fa fa-fw fa-angle-down pull-right"></i></a>
         <ul id="submenu-1" class="collapse">
         	<li><a href="<%= request.getContextPath() %>/Hlist/h_search_list.jsp"><i class="fa fa-angle-double-right"></i>회원리스트</a></li>
         </ul>
     </li>
     
     
     <li>
         <a href="#" data-toggle="collapse" data-target="#submenu-2" style="background-color: #AEAEAE; color: white;"><i class="fa fa-fw fa-star"></i>상품관리<i class="fa fa-fw fa-angle-down pull-right"></i></a>
         <ul id="submenu-2" class="collapse">
         	<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp"><i class="fa fa-angle-double-right"></i>상품리스트</a></li>
             <li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp"><i class="fa fa-angle-double-right"></i>상품수정</a></li>
         </ul>
     </li>
<%
}else if("판매자".equals(S_LEVEL1)){
%>
      <li>
          <a href="#" data-toggle="collapse" data-target="#submenu-2" style="background-color: #AEAEAE; color: white;"><i class="fa fa-fw fa-star"></i>상품관리<i class="fa fa-fw fa-angle-down pull-right"></i></a>
          <ul id="submenu-2" class="collapse">
          	<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp"><i class="fa fa-angle-double-right"></i>상품리스트</a></li>
              <li><a href="<%= request.getContextPath() %>/Ninsert/n_insert_form.jsp"><i class="fa fa-angle-double-right"></i>상품등록</a></li>
              <li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp"><i class="fa fa-angle-double-right"></i>상품수정</a></li>
          </ul>
      </li>
<%	
}else if("구매자".equals(S_LEVEL1)){
%>
      <li>
          <a href="#" data-toggle="collapse" data-target="#submenu-2" style="background-color: #AEAEAE; color: white;"><i class="fa fa-fw fa-star"></i>상품<i class="fa fa-fw fa-angle-down pull-right"></i></a>
          <ul id="submenu-2" class="collapse">
          	<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp"><i class="fa fa-angle-double-right"></i>상품리스트</a></li>
          </ul>
      </li>
<%	
}else{
%>
       <li>
           <a href="#" data-toggle="collapse" data-target="#submenu-1" style="background-color: #AEAEAE; color: white;"><i class="fa fa-fw fa-search"></i>유저메뉴<i class="fa fa-fw fa-angle-down pull-right"></i></a>
           <ul id="submenu-1" class="collapse">
               <li><a href="<%= request.getContextPath() %>/Hinsert/h_insert_form.jsp"><i class="fa fa-angle-double-right"></i>회원등록</a></li>
           </ul>
       </li>
       
       
       <li>
           <a href="#" data-toggle="collapse" data-target="#submenu-2" style="background-color: #AEAEAE; color: white;"><i class="fa fa-fw fa-star"></i>상품 정보<i class="fa fa-fw fa-angle-down pull-right"></i></a>
           <ul id="submenu-2" class="collapse">
           	<li><a href="<%= request.getContextPath() %>/Nsearch/n_search_list.jsp"><i class="fa fa-angle-double-right"></i>상품리스트</a></li>
           </ul>
       </li>

<%	
}
%>

		            </ul>
		        </div>
		        <!-- /.navbar-collapse -->
		</div>
		<div class="col-md-9">
		


