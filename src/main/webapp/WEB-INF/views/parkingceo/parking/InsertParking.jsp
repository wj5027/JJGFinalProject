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
		    <form action="insertParking.pc" method="post" enctype="multipart/form-data" onSubmit="return insertParking();">
		    	<div class="form-group" align="center">
		    		<h4 class="card-title">주차장 유형</h4>	
		    		<br>
		    		<input type="radio" name="parkingType" value="노상">&nbsp;<b style="color: white;">노상</b>
		    		&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input type="radio" name="parkingType" value="노외">&nbsp;<b style="color: white;">노외</b>
		    	</div>
		    	
		      <div class="form-group">
		        <label for="parking_name">주차장 명</label>
		        <input type="text" class="form-control" id="parkingName" placeholder="주차장 이름을 입력해주세요"  name="parkingName" style="width: 300px;">
		      </div>
		      <div class="form-group">
		        <label for="ex3">주차장 주소</label>
		        <br>
		        <br>
		        <button class="btn btn-info btn-sm" type="button" onclick="selectAddress();" >주소 검색</button>
		        <br>
		        <br>
		        <input type="text" class="form-control" placeholder="우편번호" style="width: 200px; color: white;" id="postCode" name="postCode" readonly>
		        <br>
		        <input type="text" class="form-control" placeholder="기본 주소" style="width: 600px; color: white;" id="address" name="address" readonly>
		        <br>
		        <input type="text" class="form-control" placeholder="상세 주소" style="width: 600px;" id="detailAddress" name="detailAddress">
		        <br>
		        <input type="text" class="form-control" placeholder="참고 항목" style="width: 600px;" id="extraAddress" name="extraAddress">
		      </div>
		      	<div class="form-group">
		        <label for="parking_size">주차 구획수</label>
		        <input type="text" class="form-control" id="parkingSize" name="parkingSize" placeholder="주차 구획수를 입력해주세요" style="width: 400px;">
		      </div>
		      <div class="form-check">
		      <label for="open_days">운영 요일</label>
		      <br>
		          <label class="form-check-label" id="open_days">
		              <input class="form-check-input" type="checkbox" name="openDaysArry" value="평일" id="week_days" onclick="weekChk();">
		              평일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="openDaysArry" value="토요일" id="sat_days" onclick="satChk();">
		              토요일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="openDaysArry" value="공휴일" id="hol_days" onclick="holChk();">
		              공휴일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		      </div>
		      <br>
		             <div class="form-check">
		      <label for="pay_type">결제 방법</label>
		      <br>
		          <label class="form-check-label" id="pay_type">
		              <input class="form-check-input" type="checkbox" name="pay_typeArry" value="현금">
		              현금
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="pay_typeArry" value="카드">
		              카드
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		      </div>
		      
		      <br>
		      <div class="form-group" style="color: rgb(167,168,176);">
		      <label for="price_info">요금정보</label>
		      <br>
		      <input class="form-radio-input" type="radio" name="priceInfo" value="무료">&nbsp;무료
		      &nbsp;&nbsp;&nbsp;
		      <input class="form-radio-input" type="radio" name="priceInfo" value="유료">&nbsp;유료
		      </div>
		      
		 
		      <br>
		   <div class="form-group">
		   <label for="ex6">평일 운영 시간</label>
		   <div>
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="weekdayStime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="weekdayStime" name="weekdayStime" size="16" type="text" placeholder="시작시간"  readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="weekdayEtime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="weekdayEtime" name="weekdayEtime" size="16" type="text" placeholder="종료시간"  readonly style="color: white; width: 100%; cursor: pointer !important; " >
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>	
		  	</div>
		  </div>
		  </div>
		  <br>
		  	<div class="form-group">
		   <label for="exSat">토요일 운영 시간</label>
		   <div>
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="satStime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="satStime" name="satStime" size="16" type="text" placeholder="시작시간"  readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="satEtime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="satEtime" name="satEtime" size="16" type="text" placeholder="종료시간"  readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>	
		  	</div>
		  </div>
		  </div>
		  <br>
		  <div class="form-group">
		   <label for="exHol">공휴일 운영 시간</label>
		   <div>
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="hollydayStime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="hollydayStime" name="hollydayStime" size="16" type="text" placeholder="시작시간"  readonly style="color: white; width: 100%; cursor: pointer !important;" >
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="hollydayEtime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="hollydayEtime" name="hollydayEtime" size="16" type="text" placeholder="종료시간"  readonly style="color: white; width: 100%; cursor: pointer !important; " >
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>	
		  	</div>
		  </div>
		  </div>
		  
		  <br>
		  	<div class="form-group">
		   <label for="parking_ntime">기본 시간(분 단위로 입력해주세요)/요금</label>
		   <div>
		    <input type="text" class="form-control" id="parking_ntime" name="parkingNtime" placeholder="기본 시간" style="width: 250px;">
		  	<br>
		  	<input type="text" class="form-control" placeholder="기본 요금" id="parking_nprice" name="parkingNprice" style="width: 250px;">
		  </div>
		  </div>
		  <br>
		  <div class="form-group">
		   <label for="parking_atime">추가 시간(분 단위로 입력해주세요)/요금</label>
		   <div>
		    <input type="text" class="form-control" id="parking_atime" name="parkingAtime" placeholder="추가 시간" style="width: 250px;">
		    <br>
		  	<input type="text" class="form-control" id="parking_aprice" name="parkingAprice" placeholder="추가 요금" style="width: 250px;">
		  </div>
		  </div>
		  <br>
		  <div class="form-group">
		  <label for="remarks">비고</label>
		  <div>
		  <input type="text" class="form-control" id="remarks" name="remarks" placeholder="비고" style="width: 350px;">
		  </div>
		  </div>
		  <br>
		                         <ul>
                        <li>기본 필수 항목을 입력하지 않으시면 경고창이 뜹니다.</li>
                       <li>요일 체크되어 있는 시간만 데이터로 인식되어 등록됩니다.</li>
                       <li>시간을 입력하지 않았을시 00:00 ~ 00:00 으로 기본 설정 됩니다.</li>
                       <li>기본 시간과 추가 시간은 5분,요금은 100원 단위로 입력바랍니다 다른 단위로 입력시 5분, 100원 단위로 저장됩니다.</li>
                       </ul>
                       <br>
		      <br>
			<div align="center">
				<div class="images" id="contentImgArea1" style="float: left; margin: 25px;" >
				<img alt="주차장 이미지1" id="contentImg1" height="295" src="${pageContext.servletContext.contextPath }/resources/common/img/noimage.gif">
				</div>
				<div class="images" id="contentImgArea2" style="float: left; margin: 25px;">
				<img alt="주차장 이미지2" id="contentImg2" height="295" src="${pageContext.servletContext.contextPath }/resources/common/img/noimage.gif">
				</div>
				<div class="images" id="contentImgArea3" style="float: left; margin: 25px;">
				<img alt="주차장 이미지3" id="contentImg3" height="295" src="${pageContext.servletContext.contextPath }/resources/common/img/noimage.gif">
				</div>
				<div style="clear: both;"></div>
				<!-- 파일 숨기기 -->
				<input type="file" id="parkingImage1" name="parkingImage1"  style="display: none;" onchange="loadImg(this, 1)">
				<input type="file" id="parkingImage2" name="parkingImage2"  style="display: none;" onchange="loadImg(this, 2)">
				<input type="file" id="parkingImage3" name="parkingImage3" style="display: none;" onchange="loadImg(this, 3)">
			</div>	
			
			<br>
				<div align="center">
				<button type="submit" class="btn btn-info btn-sm" >신청하기</button>
				</div>
				
				<input type="hidden" name="latitude" id="latitude">
				<input type="hidden" name="longitude" id="longitude">
				
				
				
		    </form>
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

function goReservationPage(){
	location.href="parkingceoReservation.pc";
}
	
	

    $('.form_datetime').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	$('.form_date').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
	$('.form_time').datetimepicker({
        language:  'ko',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 1,
		minView: 0,
		maxView: 1,
		forceParse: 0
    });
	

	
	
	//주소 팝업
	function selectAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
                searchGeolocation();
            }
        }).open();
        
    }
	
	
	//위도 경도 전역변수
	var latitude = "";
	var longitude = "";
	
	
	function searchGeolocation(){
		//위도,경도 구하기
		var geocoder = new daum.maps.services.Geocoder();
		var gap = $("#address").val();
		geocoder.addressSearch(gap, function(result, status) {
			//위도
			x = result[0].y;
			//경도
			y = result[0].x;
			
			latitude = x;
			longitude = y;
			
			$("#latitude").val(x)
			$("#longitude").val(y);


		});
	}
	
	

	
	//주차장 등록 메소드
	function insertParking(){
		//각 데이터 정규식 표현 진행
		
		
		
		//주차장 타입 미체크시
		if($("input[name=parkingType]").is(":checked") == false){
			var modalText = $("<b>").text("주차장 유형을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		$("#modalText").html('');
		
		
		
 		//주차장명 값 및 정규표현식
		parking_name = $("#parkingName").val();
		var regExp1 = /^[가-힣 ]{2,15}$/g;
		//주차장명이 비었을시
		if($("#parkingName").val() == null || $("#parkingName").val() == ''){
			var modalText = $("<b>").text("주차장 명을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parkingName").focus();
			return false;	
			//주차장명 정규표현식 진행
		}else if (!regExp1.test(parking_name)){
			$("#modalText").html('');
			var modalText = $("<b>").text("주차장 명은 한글로 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parkingName").focus();
			return false;	
		}
		$("#modalText").html('');
		
		//주소,상세주소 값
		address = $("#address").val();
		detailAddress = $("#detailAddress").val();
		//주소 + 상세주소 값
		resultAdd = address +" " + detailAddress;
		//주소가 비었을시
		if($("#address").val() == null || $("#address").val() == ''){
			var modalText = $("<b>").text("주소를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#address").focus();
			return false;	
		}

		$("#modalText").html('');
		
		//상세 주소가 비었을시
		if($("#detailAddress").val() == null || $("#detailAddress").val() == ''){
			var modalText = $("<b>").text("상세주소를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#detailAddress").focus();
			return false;	
		}
		$("#modalText").html('');
		
		//주소 정규표현식
		regExp2 = /(([가-힣]+(\d{1,5}|\d{1,5}(,|.)\d{1,5}|)+(읍|면|동|가|리))(^구|)((\d{1,5}(~|-)\d{1,5}|\d{1,5})(가|리|)|))([ ](산(\d{1,5}(~|-)\d{1,5}|\d{1,5}))|)|(([가-힣]|(\d{1,5}(~|-)\d{1,5})|\d{1,5})+(로|길))/;
		
		if(!regExp2.test(resultAdd)){
			var modalText = $("<b>").text("주소 입력 형식이 잘못되었습니다.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#detailAddress").focus();
			return false;	
		}
		$("#modalText").html('');
		
		
		//주차 구획수 변수 및 정규표현식
		parking_size = $("#parkingSize").val();
		regExp3 = /\d{1,5}/g;
		//주차 구획수가 비었을시
		if($("#parkingSize").val() == null || $("#parkingSize").val() == ''){
			var modalText = $("<b>").text("주차 구획수를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parkingSize").focus();
			return false;	
		}else if(!regExp3.test(parking_size)) {
			$("#modalText").html('');
			var modalText = $("<b>").text("주차 구획수는 1~99999의 숫자로 지정해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parkingSize").focus();
			return false;	
		}
		$("#modalText").html('');

		
		//체크 확인을 위한 변수
		inputChk1 = 0;
		$("input[name=openDaysArry]").each(function(){
			if($(this).is(":checked") == false){
				inputChk1 +=1; 
			}
		});
	
		//요일 미체크일시
		if(inputChk1 == 3){
			var modalText = $("<b>").text("운영 요일을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		$("#modalText").html('');
		
		//체크 확인 변수2
		inputChk2 = 0;
		$("input[name=pay_typeArry]").each(function(){
			if($(this).is(":checked") == false){
				inputChk2 +=1; 
			}
		});
		
		//결제 방법 미체크시
		if(inputChk2 == 2){
			var modalText = $("<b>").text("결제 방법을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		$("#modalText").html('');
		
		//요금 정보 미입력시
		if($("input[name=priceInfo]").is(":checked") == false){
			var modalText = $("<b>").text("요금 정보를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		$("#modalText").html('');
		
		
		//기본 시간 텍스트가 비었을시
		parking_ntime = $("#parking_ntime").val();
		regExp4 = /\d{1,5}/g;
		if($("#parking_ntime").val() == null || $("#parking_ntime").val() == ''){
			var modalText = $("<b>").text("기본 시간을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parking_ntime").focus();
			return false;	
		}else if(!regExp4.test(parking_ntime)) {
			$("#modalText").html('');
			var modalText = $("<b>").text("기본 시간은 5~1440의 숫자로 지정해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parking_ntime").focus();
			return false;	
		}
		$("#modalText").html('');
		
		//기본 요금이 비었을시
		parking_nprice = $("#parking_nprice").val();
		regExp5 = /\d{1,6}/g;
		if($("#parking_nprice").val() == null || $("#parking_nprice").val() == ''){
			var modalText = $("<b>").text("기본 요금을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parking_nprice").focus();
			return false;	
		}else if(!regExp5.test(parking_nprice)) {
			$("#modalText").html('');
			var modalText = $("<b>").text("기본 요금은 100~100000의 숫자로 지정해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parking_nprice").focus();
			return false;	
		}
		$("#modalText").html('');
		
		
		
		
		return true;
	}
	
	
	
	//운영요일 체크 박스 선택시 css 변화
 	function weekChk(){
	 	if($("input[id=week_days]").is(":checked") == false){
			$("#weekdayStime").css('display', 'none');
			$("#weekdayEtime").css('display', 'none');
		}else{
			$("input[id=weekdayStime]").css('display', 'block');
			$("input[id=weekdayEtime]").css('display', 'block');
		} 
	}
	
	function satChk(){
	 	if($("input[id=sat_days]").is(":checked") == false){
			$("#satStime").css('display', 'none');
			$("#satEtime").css('display', 'none');
		}else{
			$("input[id=satStime]").css('display', 'block');
			$("input[id=satEtime]").css('display', 'block');
		} 
	}
	
	function holChk(){
	 	if($("input[id=hol_days]").is(":checked") == false){
			$("#hollydayStime").css('display', 'none');
			$("#hollydayEtime").css('display', 'none');
		}else{
			$("input[id=hollydayStime]").css('display', 'block');
			$("input[id=hollydayEtime]").css('display', 'block');
		} 
	} 
	
	//파일 업로드
	

	$(document).ready(function(){
		
		$("#contentImgArea1").click(function(){
			$("#parkingImage1").click();
		});
		$("#contentImgArea2").click(function(){
			$("#parkingImage2").click();
		});
		$("#contentImgArea3").click(function(){
			$("#parkingImage3").click();
		});
	});

	function loadImg(value, num){
		if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 : $("#contentImg1").attr("src", e.target.result);
					break;
				case 2 : $("#contentImg2").attr("src",e.target.result);
					break;
				case 3 : $("#contentImg3").attr("src",e.target.result);
					break;
				}
			}
			reader.readAsDataURL(value.files[0]);
		}
	}

	
</script>

</html>