<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<!-- body 시작  -->
<!--  캐러셀(carousel) 시작 -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="./images/carousel_img01.jpeg" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<img src="./images/carousel_img02.jpg" alt="Image">
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<img src="./images/carousel_img03.png" alt="Image">
			<div class="carousel-caption"></div>
		</div>			
	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" role="button"
		data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
		aria-hidden="true"></span> <span class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" role="button"
		data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<!--  캐러셀(carousel) 끝 -->

<!--  Row(Column 3개 ) 브랜드 laptop 시작 -->
	<div class="container-fluid" style="padding-left: 0; padding-right: 0; margin-right: 130px; margin-left: 135px">
		<div class="row">
		  <div class="col-md-4">
		    <div class="thumbnail">
		      <img src="./images/Lenovo/LenovoLaptopMain_01.jpg" alt="imgs">
		      <div class="caption" style="text-align: center;">
				<a href="#"><strong style="font-size: 30px"><span style="color: black;">Lenovo</span><span style="color: black"> 노트북</span></strong></a>			      
		      </div>
		    </div>
		  </div>
		  <div class="col-md-4">
		    <div class="thumbnail">
		      <img src="./images/LG/LGlaptopmain_01.jpg" alt="imgs">
		      <div class="caption" style="text-align: center;">
		      	<a href="#"><strong style="font-size: 30px"><span style="color: red;">LG</span><span style="color: black"> 노트북</span></strong></a>
		      </div>
		    </div>
		  </div>
		  <div class="col-md-4">
		    <div class="thumbnail">
		      <img src="./images/Samsung/SamsungLaptopMain_01.jpg" alt="imgs">
		      <div class="caption" style="text-align: center;">
		      	<a href="#"><strong style="font-size: 30px"><span style="color: blue;">Samsung</span><span style="color: black"> 노트북</span></strong></a>
		      </div>
		    </div>
		  </div>    
		</div>
	</div>
<!--  Row(Column 3개 ) 브랜드 laptop 끝 -->

<!--  노트북 카테고리 4개 시작 Taps기능 시작 -->
<h3 class="text-center" style="margin-bottom: 40px; margin-top: 50px">
	<strong>
	<span class="text-muted">삶을 사랑하는 당신을 위한</span>
	<span class="text-danger">다나와의 맞춤 제안</span>
	</strong>
</h3>

<div class="container-fluid" style="padding-left: 0; padding-right: 0; margin-right: 150px; margin-left: 150px">
  <div class="row">
  <ul class="nav nav-tabs nav-justified" style="border:1px solid #E2E2E2;">
    <li class="active"><a data-toggle="tab" href="#home" style="border-radius: 0" class="tabmenu">게이밍 노트북</a></li>
   <li><a data-toggle="tab" href="#menu1" class="tabmenu">초경량 노트북</a></li>
   <li><a data-toggle="tab" href="#menu2" class="tabmenu">비즈니스 노트북</a></li>
   <li><a data-toggle="tab" href="#menu3" class="tabmenu">디자인용 노트북</a></li>
 </ul>
 </div>
 
<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <div class="row" style="border: 1px solid #E2E2E2; padding-top: 30px">
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/01_GamingLaptop/01_ASUS_ROG_Strix_G_G731GU-EV005.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">파격적인 게이밍 디자인</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,420,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/01_GamingLaptop/02_LEGION_Y530-15ICH_i5_Special.jpg" alt="imgs">
  	  <span style="text-align: center" class="prod_tit">레노버 대표 게이밍 시리즈</span>
  	  <span class="prod_price"><strong class="pr_num">1,367,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/01_GamingLaptop/03_LGElectronic_UltraGear_GT_15U780-PA5MK.jpg" alt="imgs">
  	  <span style="text-align: center" class="prod_tit">LG전자 울트라기어 GT</span>
  	  <span class="prod_price"><strong class="pr_num">998,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/01_GamingLaptop/04_MSI_GLseries_GL65_9SD.jpg" alt="imgs">
  	  <span style="text-align: center" class="prod_tit">MSI GL시리즈 GL65</span>
  	  <span class="prod_price"><strong class="pr_num">1,299,000</strong>원</span>
  	 </div>
   </div>
 </div>
 <div id="menu1" class="tab-pane fade">
   <div class="row" style="border: 1px solid #E2E2E2; padding-top: 30px">
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/02_UltralightLaptop/01_LGElectronic_2019_gram_14ZD990-GX50K.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">LG전자 2019 그램</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,156,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/02_UltralightLaptop/02_LGElectronic_2019_gram_17Z990-VA5IK.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">LG전자 2019 그램</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,259,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/02_UltralightLaptop/03_Samsung_2019_Always_NT950XBV-A58A_WIN10.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">삼성전자2019 노트북9</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,169,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/02_UltralightLaptop/04_HansungComputer_UnderCage_TFX245.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">한성컴퓨터 언터케이지</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">795,000</strong>원</span>
  	 </div>
   </div>
 </div>
 <div id="menu2" class="tab-pane fade">
   <div class="row" style="border: 1px solid #E2E2E2; padding-top: 30px">
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/03_BusinessLaptop/01_ACER_Swift5_SF515-51T_i5_SMART.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">광시야각 노트북</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">900,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/03_BusinessLaptop/02_ASUS_ViboBook_15_R564DA-BQ774.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">ASUS 비보북</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">577,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/03_BusinessLaptop/03_LG_2019_gram_14ZD990-GX50K.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">LG전자 2019 그램</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,156,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/03_BusinessLaptop/04_samsung_2019_Pen_S_NT930SBE-K38A.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">삼성전자 2019 노트북 Pen</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,637,000</strong>원</span>
  	 </div>
   </div>
 </div>
 <div id="menu3" class="tab-pane fade">
   <div class="row" style="border: 1px solid #E2E2E2; padding-top: 30px">
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/04_DesignLaptop/01_APPLE_mac_2019_MV912KHA.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">APPLE 맥북프로 2019년형</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">2,369,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/04_DesignLaptop/02_DELL_ins_15_7590_D001I759003KR.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">DELL 인스피론</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,699,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/04_DesignLaptop/03_LG_utra_17U790-PA76K.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">LG전자 울트라기어</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">1,816,000</strong>원</span>
  	 </div>
  	 <div class="col-md-3" > <img class="ImagesCategory" src="./images/04_DesignLaptop/04_HansungComputer_AllDayLong_TFX255.jpg" alt="imgs">
  	 <span style="text-align: center" class="prod_tit">한성컴퓨터 올데이롱</span>
  	 <span class="prod_price"  style="text-align: center"><strong class="pr_num">846,000</strong>원</span>
  	 </div>
  	 </div>
    </div>
  </div>
</div>
<!--  노트북 카테고리 4개 시작 Taps기능 끝 -->

<!-- iframe youtube 시작  -->
<h3 class="text-center" style="margin-bottom: 40px; margin-top: 100px">
	<strong>
	<span class="text-muted">브랜드 노트북</span>
	<span class="text-danger">다양한 광고를</span>
	<span class="text-muted">만나보세요</span>
</strong>
</h3>

<div class="container" style="margin-top: 60px; padding-left: 0; padding-right: 0">	
	<div class="row">
	   <div class="col-md-4">
	    <div class="embed-responsive embed-responsive-16by9">
	      <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tQKd0xHPN6U"></iframe>
	      <span class="text">LG 그램 노트북 광고</span>
	    </div>
	  </div>
	
	  <div class="col-md-4">
	    <div class="embed-responsive embed-responsive-16by9 hoverable">
	      <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/x-FM1oV1GUg"></iframe>
	      <span class="text">삼성 노트북 Pen S 광고</span>
	    </div>
	  </div>
	
	  <div class="col-md-4">
	    <div class="embed-responsive embed-responsive-16by9 hoverable">
	      <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/hs1HoLs4SD0"></iframe>
	 		 <span class="text">new MacBook Air</span>
		</div>    
	  </div>
	</div>
</div>	
<!-- iframe youtube 끝  -->
<!-- body 끝  -->
