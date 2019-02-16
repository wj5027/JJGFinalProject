<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	.images{
		border: 2px solid rgb(167,168,176);
		height: 300px;
		margin-left : 10px;
		margin-right : 10px;
		width: 300px;
		display: inline-block;
	
	}
	#contentImg1,#contentImg2,#contentImg3{
	  max-width:100%; 
	  max-height:100%;
  		margin:auto;
  		display:block;
	
	
	}
	

	#hiddenButton{
		display: none;
	}
	
 	#weekdayStime,#weekdayEtime,#satStime,#satEtime,#hollydayStime,#hollydayEtime{
		display: none;
	} 
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85185db0fc452125ec8070a4279f67bb&libraries=services,clusterer,drawing"></script>
</head>

<body class="">
  <div class="wrapper">
  <jsp:include page="/WEB-INF/views/parkingceo/common/Sidebar.jsp"></jsp:include>


    <div class="main-panel">
      <!-- Navbar -->
  		<jsp:include page="/WEB-INF/views/parkingceo/common/menubar.jsp"></jsp:include>
      <!-- End Navbar -->
      
      <div class="content">
         <!-- 주차장 정보 입력 폼 --> 
         <div class="card">
		  <div class="card-body">
		  
		  		<div style="width: 500px; height: 500px;">
		  			<h1 style="margin-left: auto; margin-right: auto;">${message }</h1>
		  		</div>
		
		  </div>
		  </div>
		</div>  
      <!-- content -->
      
      <div class="modal fade bd-example-modal-lg-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center" id="modalText" style="color: white;"></td></tr>
						<tr><td align="center">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>



<div id="hiddenButton">
<button onclick="searchGeolocation();"></button>
<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-4" type="button" id="modalBtn">현장 결제</button>
</div>     
      
      
      </div>
    </div>
 
</body>
<script type="text/javascript">

//페이지 이동 함수
function goMain(){
	location.href="parkingceoMain.pc";
}

function goExchangePage(){
	location.href = "parkingceoExchange.pc";
}

function insertParkingPage(){
	location.href = "insertParkingPage.pc";
}

function goOilStatisticsPage(){
	location.href = "goOilStatisticsPage.pc";
}

function goParkingListStatisticsPage(){
	location.href = "goParkingListStatisticsPage.pc";
}

function goBestPakerStatisticsPage(){
	location.href = "goBestPakerStatisticsPage.pc";
}

function goParkingDetailListPage(){
	location.href = "goParkingDetailListPage.pc";
}

function goPromotionPage(){
	location.href = "goPromotionPage.pc";
}

function goExchangeMoneyPage(){
	location.href = "goExchangeMoneyPage.pc";
}

function goNotePage(){
	location.href = "goNotePage.pc";
}
function parkingceoLogin(){
	location.href="parkingceoLogin.pc";	
}
	


	
</script>

</html>