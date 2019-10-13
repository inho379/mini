<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>	
<%@page import="java.util.List"%>
<%@page import="kr.or.ksmart.dao.Hdao"%>
<%@page import="kr.or.ksmart.dto.Human"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원관리 - 다나와</title>
<link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/main.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>
<script src="<%= request.getContextPath() %>/js/main.js"></script>
</head>
<style>

.page-header{
    width: 100%;
    border-bottom: 2px solid #888888;
    
}

.page-header input{
    float: right;
    margin-top: -40px;
}

/* 빨간 라인 버튼 */
.btn-red-line {
    background-image: none;
    background-color: #FFFFFF;
    background: 10px;
    text-shadow: none;
    color: #fa2828;
    border-color: #fa2828;
    padding-left: 20px;
    font-weight: bold;
}

.table-title{
    color: #666666;
    margin-top: 0;
}
/* Content - Content Form - 목록테이블 */
.table-cols > thead > tr > th,
.table-cols > tbody > tr > th,
.table-cols > tfoot > tr > th,
.table-cols > thead > tr > td,
.table-cols > tbody > tr > td,
.table-cols > tfoot > tr > td {
    /*white-space:nowrap;*/
    border-top: 0;
    border-bottom: 1px solid #E6E6E6;
}
.table-cols > tbody > tr > th {
    background-color: #F6F6F6;
}

.table-cols > thead > tr > th,
.table-cols > tbody > tr > th,
.table-cols > tfoot > tr > th,
.table-cols > thead > tr > td,
.table-cols > tbody > tr > td,
.table-cols > tfoot > tr > td {
    padding: 8px 15px;
    font-size: 12px;
    height: 43px;
}

/* 검정색 버튼 */
.btn-black {
    background-image: none;
    background-color: #666666;
    text-shadow: none;
    color: #FFFFFF;
    border-color: #666666;
    font-weight:bold;
}

.btn-black.active {
    background-color: #444444;
    border-color: #444444;
    color: #FFFFFF;
    font-weight: bold;
}

.btn-black:hover,
.btn-black:focus {
    background-color: #444444;
    background-position: 0 -15px;
    border-color: #444444;
    color: #FFFFFF;
    font-weight: bold;
}

.table-header {
    overflow: hidden;
    border-top: 1px solid #888888;
}
.table-header .pull-left {
    /*float: left;*/
    padding: 25px 0px 2px;
    /*width: 300px;*/
    font-family: Malgun Gothic,"맑은 고딕";
    color: #666666
}
.table-header .pull-left strong {
    color: #fa2828;
}
.form-inline .form-control {
    display: inline-block;
    width: auto;
    vertical-align: middle;
}

.table-rows tr td:first-child:after {
    content: '';
    top: 0;
    right: -1px;
    z-index: 100;
    width: 2px;
    height: 100%;
    background: #fff;
}

.table-rows > tbody > tr > th,
.table-rows > tfoot > tr > th,
.table-rows > tbody > tr > td,
.table-rows > tfoot > tr > td {
    padding: 5px;
    border-top: 1px solid #E6E6E6;
    border-right: 1px solid #E6E6E6;
    border-top: 1px solid #E6E6E6;
    /*border-bottom: 1px solid #E6E6E6;*/
}

.table-rows > caption + thead > tr:first-child > th, .table-rows > colgroup + thead > tr:first-child > th, .table-rows > thead:first-child > tr:first-child > th, .table-rows > caption + thead > tr:first-child > td, .table-rows > colgroup + thead > tr:first-child > td, .table-rows > thead:first-child > tr:first-child > td {
    border-top: 1px solid #AEAEAE;
    border-bottom: 1px solid #AEAEAE;
    border-right: 1px solid #aeaeae;
    text-align: center;
    font-weight: bold;
    font-size: 12px;
    white-space: nowrap;
    vertical-align: middle;
}

/***** 포인터**** 
.hand {
    cursor: pointer;
}
****************/
.center, .table-btn{
    text-align: center;
}

.table-action {
    width: 100%;
    overflow: hidden;
    padding: 8px 0;
    margin-top: -21px;
    margin-bottom: 20px;
    background:#f6f6f6;
    border-top: 1px solid #E6E6E6;
    border-bottom: 1px solid #E6E6E6;
}

.table-header .pull-left-btn {
    float: left;
    margin: 12px 5px;
    width: 300px;
    text-indent: 15px;
    font-size: 11px;
    font-family: '돋움', 'Dotum';
    color: #666666
}

/* 하얀색 버튼 */
.btn-white {
    background-image: none;
    background-color: #FFFFFF !important;
    text-shadow: none;
    color: #444444;
    border-color: #CCCCCC;
    -webkit-transition: border-color 0.2s ease;
    -moz-transition: border-color 0.2s ease;
    -o-transition: border-color 0.2s ease;
    -ms-transition: border-color 0.2s ease;
    transition: border-color 0.2s ease;
}
</style>
<body>
<!-- include Directive(디렉티브)는 소스코드를 포함시킨다 -->
<%@ include file="/module/MainHeader.jsp" %>

<!-- 회원관리 left  column 시작 -->
<%@ include file="/module/LeftSideBar.jsp" %>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	var t = {}
	$(document).ready(function() {
		t.page = 1
		t.id = ""
		t.name = ""
		t.nick = ""
		t.level = ""
		t.gender = ""
		t.permit = ""
		t.jday1 = ""
		t.jday2 = ""
		t.bday1 = ""
		t.bday2 = ""
		t.pn = 5
		
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!

		var yyyy = today.getFullYear();
		if(dd<10){
		    dd='0'+dd;
		} 
		if(mm<10){
		    mm='0'+mm;
		} 
		var today = yyyy+'-'+mm+'-'+dd;
		
		$('[name="h_jday2"],[name="h_bday2"]').val(today)
		$('[name="h_jday2"],[name="h_bday2"]').attr('max',today)
		$('[name="h_jday1"]').attr('max',$('[name="h_jday2"]').val())
		$('[name="h_bday1"]').attr('max',$('[name="h_bday2"]').val())
		
		$('[name="h_jday1"]').change(function () {
			$('[name="h_jday2"]').attr('min',$('[name="h_jday1"]').val())
		})
		
		$('[name="h_bday1"]').change(function () {
			$('[name="h_bday2"]').attr('min',$('[name="h_bday1"]').val())
		})
		
		$('[name="h_jday2"]').change(function () {
			$('[name="h_jday1"]').attr('max',$('[name="h_jday2"]').val())
		})
		
		$('[name="h_bday2"]').change(function () {
			$('[name="h_bday1"]').attr('max',$('[name="h_bday2"]').val())
		})
		
		var request = $.ajax({
			url : "./h_search_html.jsp",
			method : "POST",
			data : t,
			dataType : "html"
		});

		request.done(function(data) {
			console.log(data)
			$("#table").html(data)
		});
		
		request.fail(function(jqXHR, textStatus) {
			alert("조회 실패!")
		});
		
		$('[name="h_level"]').change(function(){
			t.level = $(this).val()
		})
		
		$('[name="h_gender"]').change(function(){
			t.gender = $(this).val()
		})
		
		$('[name="h_permit"]').change(function(){
			t.permit = $(this).val()
		})
		
		$('#search').click(function() {
			t.id = $('#h_id').val()
			t.name = $('#h_name').val()
			t.nick = $('#h_nick').val()
			t.jday1 = $('[name="h_jday1"]').val()
			t.jday2 = $('[name="h_jday2"]').val()
			t.bday1 = $('[name="h_bday1"]').val()
			t.bday2 = $('[name="h_bday2"]').val()
			t.page = 1
			var request = $.ajax({
				url : "./h_search_html.jsp",
				method : "POST",
				data : t,
				dataType : "html"
			});

			request.done(function(data) {
				console.log(data)
				$("#table").html(data)
			});

			request.fail(function(jqXHR, textStatus) {
				alert("검색 실패!")
			})
		})
	})
	$(document).on('change','#pageNum',function(){
		t.pn = $(this).val()
		t.page = 1
		var request = $.ajax({
			url : "./h_search_html.jsp",
			method : "POST",
			data : t,
			dataType : "html"
		});

		request.done(function(data) {
			console.log(data)
			$("#table").html(data)
		});

		request.fail(function(jqXHR, textStatus) {
			alert("검색 실패!")
		})
	})
	function page(a){
		t.page = a
		var request = $.ajax({
			url : "./h_search_html.jsp",
			method : "POST",
			data : t,
			dataType : "html"
		})

		request.done(function(data) {
			console.log(data)
			$('#table').html(data)
		})

		request.fail(function(jqXHR, textStatus) {
			alert("페이지 이동 실패!")
		})
	}
</script>
<script type="text/javascript">

</script>


<div class="page-header js-affix affix-top" style="width: auto; left: auto;">
    <h3>회원 리스트</h3>
</div>


<form id="frmSearchBase" class="content-form js-search-form js-form-enter-submit">
<div class="table-title gd-help-manual">회원검색</div>
<div class="search-detail-box form-inline">
<table class="table table-cols">
	<tbody>	
		<tr>
			<th>아이디</th>
			<td style="margin:0px;padding:5px">
				<input type="text" id="h_id" value="" name="keyword" class="form-control">
			</td>
			<th>이름</th>
			<td style="margin:0px;padding:5px">
				<input type="text" id="h_name" value="" name="keyword" class="form-control">
			</td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td style="margin:0px;padding:5px">
				<input type="text" id="h_nick" value="" name="keyword" class="form-control">
			</td>
			<th>회원등급</th>
			<td>
				<label class="radio-inline">
					<input type="radio" name="h_level" value="" checked="checked"> 전체
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_level" value="구매자"> 구매자
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_level" value="판매자"> 판매자
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_level" value="관리자"> 관리자
				</label>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<label class="radio-inline">
					<input type="radio" name="h_gender" value="" checked="checked"> 전체
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_gender" value="남"> 남성
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_gender" value="여"> 여성
				</label>
			</td>
			<th>가입승인</th>
			<td>
				<label class="radio-inline">
					<input type="radio" name="h_permit" value="" checked="checked"> 전체
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_permit" value="O"> 승인
				</label>
				<label class="radio-inline">
					<input type="radio" name="h_permit" value="X"> 미승인
				</label>
			</td>
		</tr>
		<tr>
			<th>가입일</th>
			<td>
				<input type="date" name="h_jday1" class="form-control">~
				<input type="date" name="h_jday2" class="form-control">
			</td>
			<th>생일</th>
			<td>
				<input type="date" name="h_bday1" class="form-control">~
				<input type="date" name="h_bday2" class="form-control">
			</td>
		</tr>
	</tbody>
</table>		
</div>	
<div class="table-btn">		
	<input type="button" id="search" value="검색" class="btn btn-lg btn-black js-search-button">
</div>	
</form>
<br>
회원 리스트
<br>
<div class="table-header form-inline">
	<div class="pull-right">
		<div> 
			<select class=" js-page-number form-control" id="pageNum"
				name="pageNum">
				<option value="5">5개보기</option>
				<option value="10">10개보기</option>
				<option value="20">20개 보기</option>
				<option value="30">30개 보기</option>
				<option value="40">40개 보기</option>
				<option value="50">50개 보기</option>
				<option value="60">60개 보기</option>
				<option value="70">70개 보기</option>
				<option value="80">80개 보기</option>
				<option value="90">90개 보기</option>
				<option value="100">100개 보기</option>
			</select>
		</div>
	</div>
	<div id="table" style="padding-top:7px;">

	</div>
</div>

<!-- 	테이블 입력될 폼 -->

	<%@ include file="/module/MainFooter.jsp" %>
	<script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
</body>
</html>