<%
	request.setCharacterEncoding("utf-8");
%>
<body>

<form action="<%=request.getContextPath()%>/Osearch/o_search_list.jsp" method = "post" name="myForm">
			
	<div class="form-group">
		<label for="sel1">원하는 조건을 선택해주세요.</label>
		<select name = "scvalue" class="form-control" id="sel1" >
			<option value="a_human.h_id">구매자 아이디</option>
			<option value="a_order.o_code">주문번호</option>
			<option value="n_name">상품명</option>
			<option value="a_notebook.n_code">상품코드</option>
			<option value="o_name">받는사람이름</option>
		</select>
	</div>
	<div class="form-group">
			<input type = "text" name = "stvalue" class="form-control" id="usr" >
	</div>
		
	<div class="form-group">
		<label for="sel1">기간별</label>
		<select name = "selday" class="form-control" id="sel1">
			<option value="o_oday">주문일</option>
		</select>
		<br/>
		<label for="sel1">날짜선택</label>
			
			<input type = "date" name = "nsday2" class="form-control" id="usr" >
			
			&nbsp;&nbsp;<i class="glyphicon glyphicon-minus"></i>
			
			<input type = "date" name = "nsday3" class="form-control" id="usr" >
	
	</div>
		
			<div class="form-group">
				<label for="sel1">최종주문금액</label>
					<input type = "number" name = "otprice2" class="form-control" id="usr">
			</div>
				
			&nbsp;&nbsp;<i class="glyphicon glyphicon-minus"></i>
			<br>
			&nbsp;
			<div class="form-group">
				<input type = "number" name = "otprice3" class="form-control" id="usr">
			</div>	
		
				<input type = "submit" value = "검색버튼" class="btn btn-info">
</form>
</body>
</html>