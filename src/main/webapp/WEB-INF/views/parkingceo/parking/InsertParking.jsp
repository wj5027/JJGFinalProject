<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	#hiddenButton{
		display: none;
	}
	
	#weekday_stime,#weekday_etime,#sat_stime,#sat_etime,#holiday_stime,#holiday_etime{
		display: none;
	}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
		    		<input type="radio" name="parking_type" value="노상">&nbsp;<b style="color: white;">노상</b>
		    		&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input type="radio" name="parking_type" value="노외">&nbsp;<b style="color: white;">노외</b>
		    	</div>
		    	
		      <div class="form-group">
		        <label for="parking_name">주차장 명</label>
		        <input type="text" class="form-control" id="parking_name" placeholder="주차장 이름을 입력해주세요"  name="parking_name" style="width: 300px;">
		      </div>
		      <div class="form-group">
		        <label for="ex3">주차장 주소</label>
		        <br>
		        <br>
		        <button class="btn btn-info btn-sm" type="button" onclick="selectAddress();" >주소 검색</button>
		        <br>
		        <br>
		        <input type="text" class="form-control" placeholder="우편번호" style="width: 200px; color: white;" id="postCode" readonly>
		        <br>
		        <input type="text" class="form-control" placeholder="기본 주소" style="width: 600px; color: white;" id="address" readonly>
		        <br>
		        <input type="text" class="form-control" placeholder="상세 주소" style="width: 600px;" id="detailAddress">
		        <br>
		        <input type="text" class="form-control" placeholder="참고 항목" style="width: 600px;" id="extraAddress">
		      </div>
		      	<div class="form-group">
		        <label for="parking_size">주차 구획수</label>
		        <input type="text" class="form-control" id="parking_size" placeholder="주차 구획수를 입력해주세요" style="width: 400px;">
		      </div>
		      <div class="form-check">
		      <label for="open_days">운영 요일</label>
		      <br>
		          <label class="form-check-label" id="open_days">
		              <input class="form-check-input" type="checkbox" name="open_days" value="평일" id="week_days" onclick="weekChk();">
		              평일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="open_days" value="토요일" id="sat_days" onclick="satChk();">
		              토요일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="open_days" value="공휴일" id="hol_days" onclick="holChk();">
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
		              <input class="form-check-input" type="checkbox" name="pay_type" value="현금">
		              현금
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="pay_type" value="카드">
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
		      <input class="form-radio-input" type="radio" name="price_info">&nbsp;무료
		      &nbsp;&nbsp;&nbsp;
		      <input class="form-radio-input" type="radio" name="price_info">&nbsp;유료
		      </div>
		      
		 
		      <br>
		   <div class="form-group">
		   <label for="ex6">평일 운영 시간</label>
		   <div>
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="weekday_stime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="weekday_stime" name="weekday_stime" size="16" type="text" placeholder="시작시간" readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="weekday_etime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="weekday_etime" name="weekday_etime" size="16" type="text" placeholder="종료시간" readonly style="color: white; width: 100%; cursor: pointer !important; " >
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
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="sat_stime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="sat_stime" name="sat_stime" size="16" type="text" placeholder="시작시간" readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="sat_etime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="sat_etime" name="sat_etime" size="16" type="text" placeholder="종료시간" readonly style="color: white; width: 100%; cursor: pointer !important;">
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
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="holiday_stime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="holiday_stime" name="holiday_stime" size="16" type="text" placeholder="시작시간" readonly style="color: white; width: 100%; cursor: pointer !important;" >
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="holiday_etime" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="holiday_etime" name="holiday_etime" size="16" type="text" placeholder="종료시간" readonly style="color: white; width: 100%; cursor: pointer !important; " >
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
		    <input type="text" class="form-control" id="parking_ntime" name="parking_ntime" placeholder="기본 시간" style="width: 250px;">
		  	<br>
		  	<input type="text" class="form-control" placeholder="기본 요금" id="parking_nprice" name="parking_nprice" style="width: 250px;">
		  </div>
		  </div>
		  <br>
		  <div class="form-group">
		   <label for="parking_atime">추가 시간(분 단위로 입력해주세요)/요금</label>
		   <div>
		    <input type="text" class="form-control" id="parking_atime" name="parking_atime" placeholder="추가 시간" style="width: 250px;">
		    <br>
		  	<input type="text" class="form-control" id="parking_aprice" name="parking_aprice" placeholder="추가 요금" style="width: 250px;">
		  </div>
		  </div>
		      <br>
			<div align="center">
				<div class="images"></div>
				<div class="images"></div>
				<div class="images"></div>
				<!-- 파일 숨기기 -->
				<input type="file" style="display: none;">
				<input type="file" style="display: none;">
				<input type="file" style="display: none;">
			</div>	
			
			<br>
				<div align="center">
				<button type="submit" class="btn btn-info btn-sm" >신청하기</button>
				</div>
				
				
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
            }
        }).open();
    }
	
	
	//주차장 등록 메소드
	function insertParking(){
		
		//각 데이터 정규식 표현 진행
		
		//주차장 타입 미체크시
		if($("input[name=parking_type]").is(":checked") == false){
			var modalText = $("<b>").text("주차장 유형을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		$("#modalText").html('');
		
		
		
/* 		//주차장명 값
		parking_name = $("#parking_name").val();
		//주차장명이 비었을시
		if($("#parking_name").val() == null || $("#parking_name").val() == ''){
			var modalText = $("<b>").text("주차장 명을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parking_name").focus();
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
		
		//주차 구획수 변수
		parking_size = $("#parking_size").val();
		//주차 구획수가 비었을시
		if($("#parking_size").val() == null || $("#parking_size").val() == ''){
			var modalText = $("<b>").text("주차 구획수를 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			$("#parking_size").focus();
			return false;	
		} 
		$("#modalText").html('');
		*/
		
		//체크 확인을 위한 변수
		inputChk1 = 0;
		$("input[name=open_days]").each(function(){
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
		$("input[name=pay_type]").each(function(){
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
		
		if($("input[name=price_info]").is(":checked") == false){
			var modalText = $("<b>").text("주차장 유형을 입력해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		$("#modalText").html('');
		
		
		return false;
	}
	
	
	
	//운영요일 체크 박스 선택시 css 변화
	function weekChk(){
	 	if($("input[id=week_days]").is(":checked") == false){
			$("#weekday_stime").css('display', 'none');
			$("#weekday_etime").css('display', 'none');
		}else{
			$("input[id=weekday_stime]").css('display', 'block');
			$("input[id=weekday_etime]").css('display', 'block');
		} 
	}
	
	function satChk(){
	 	if($("input[id=sat_days]").is(":checked") == false){
			$("#sat_stime").css('display', 'none');
			$("#sat_etime").css('display', 'none');
		}else{
			$("input[id=sat_stime]").css('display', 'block');
			$("input[id=sat_etime]").css('display', 'block');
		} 
	}
	
	function holChk(){
	 	if($("input[id=hol_days]").is(":checked") == false){
			$("#holiday_stime").css('display', 'none');
			$("#holiday_etime").css('display', 'none');
		}else{
			$("input[id=holiday_stime]").css('display', 'block');
			$("input[id=holiday_etime]").css('display', 'block');
		} 
	}
	

	
</script>

</html>