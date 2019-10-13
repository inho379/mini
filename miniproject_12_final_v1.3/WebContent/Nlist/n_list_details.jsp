<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>스마트한 쇼핑검색, 다나와! : 가격비교</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
<style type="text/css">

.tc_top .tcThumb {
  width:560px;
  height:576px;
  float:left;
}


.clearfix:after {
    display:block;
    clear:both;
    content:" "
}

 img {
    border:none;
    vertical-align:baseline
}



.tc_top .tcInfo .infoCont {
  background:#fff;
  padding:15px 25px;
  bo
}




.tc_top .tcInfo {
  margin-left:560px;
  background-color:#efefef;
  padding:30px 20px;
  min-height: 501px;
  display: absolute;
  width:530px;
  margin-bottom: 30px;
  border: 1px solid;
}


ul.pyList>li dl dt {
  font-size:12px;
  color:#333333;
  line-height:30px;
  float:left;
  padding-left:25px;
  width:80px;

}
ul.pyList>li dl dd {
  margin-left:83px;
  padding-left:14px;
  line-height:30px;
  font-size:12px;
  color:#666;
  width: 80px;

}

ul, ol {
    list-style:none
}

.btnBl {
  display:inline-block;
  border:none;
  background:#1363b0;
  color:#fff;
  font-size:13px;
  font-weight:bold;
  text-align:center;
}

.btnBk_cart {
  display:inline-block;
  text-align:center;
  font-size:13px;
  font-weight:bold;
  color:#fff;
  background:#0c0c0c;
}

.btnRd_go {
  display:inline-block;
  text-align:center;
  font-size:13px;
  font-weight:bold;
  color:#fff;
  background:#d92027;
}

.w146h42 {
  width:146px;
  height:42px;
  line-height:42px;
}

.w124h42 {
  width:124px;
  height:42px;
  line-height:42px;
}

.w156h42 {
  width:156px;
  height:42px;
  line-height:42px;
}

.infoCont dl dt{
width: 80px;
}

</style>
</head>
<body>
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>
<%@ include file="/module/LeftSideBar.jsp" %>

<%@ page import = "kr.or.ksmart.dao.Ndao" %>
<%@ page import = "kr.or.ksmart.dto.NoteBook"%>
<%
	request.setCharacterEncoding("utf-8");
	String code = request.getParameter("code");
	System.out.println(code + " <-code 화면에서 누른 사진에 해당하는 상품 코드값");
	
	Ndao dao = new Ndao();
	NoteBook detail = dao.ndetailList(code);
	System.out.println(detail + " <-상세 화면 처리 과정");
	
	if(detail != null){
		
	
%>
<div class="tc_top clearfix" >
	<div class="tcThumb">
	<img src="../img/<%=detail.getnImg()%>" alt="" style="margin-top: 50px; width: 600px; height: 500px;">
	</div>
	<div class="tcInfo" style="margin-top: 50px; margin-left: 600px; height: 380px; padding-top: 5px;">	
		<div class="title" style="margin-top: 5px;">
            
         </div>
	<div class="infoCont" style="padding: 15px 25px">
		<ul class="pyList">
		<li>
			<dl>
				<dt>상품명</dt>
				<dd><%=detail.getnName()%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>컬러</dt>
				<dd><%=detail.getnColor()%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>제조사</dt>
				<dd><%=detail.getnMade()%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>수량</dt>
				<dd><%=detail.getnCount()%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>제조일</dt>
				<dd><%=detail.getnSday()%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>판매가</dt>
				<dd><%=detail.getnPrice()%></dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>할인가?</dt>
				<dd><%=detail.getnSprice()%></dd>
			</dl>
		</li>
	</ul>
	 <dl class="totalPrice" style="border-top: 1px solid; text-align: right; align:right;" >
        <dt style="text-align: right;">총 결제금액</dt>
        <dd><em><span id="total"><%=detail.getnSprice()%></span></em>원</dd>
    </dl>	
		<div class="btnArea" style="width:500px">
		<a href="<%=request.getContextPath()%>/Nsearch/n_search_list.jsp" class="btnBl w146h42">다른 상품보기</a>
		<a href="#" class="btnBk_cart w124h42"><span>장바구니</span></a>
		<a href="<%=request.getContextPath()%>/Oinsert/o_insert_form.jsp?nSprice=<%=detail.getnSprice()%>" class="btnRd_go w156h42"><span>즉시 구매하기</span></a>
		</div>	
	</div>
</div>
</div>
<%
	}
%>
<%@ include file="/module/MainFooter.jsp" %>
	
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>