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
	
	#contentImgArea1,#contentImgArea2,#contentImgArea3{
		display: none;
	}
</style>
</head>

<body class="">
  <div class="wrapper">
  <jsp:include page="/WEB-INF/views/parkingceo/common/Sidebar.jsp"></jsp:include>


    <div class="main-panel">
      <!-- Navbar -->
  		<jsp:include page="/WEB-INF/views/parkingceo/common/menubar.jsp"></jsp:include>
      <!-- End Navbar -->
      
      <div	 class="content">
      
      <!-- 내 주차장 검색 기능 -->
        <div class="row">
		  <div class="col-md-12" style="height: 500px;" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 주차장 정보 수정 신청</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">${loginUser.member_name }님의 주차장을 선택해주세요</div></td>
                        <td>	
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect01" style="width: 500px;" name="parking_no">
    						<c:if test="${not empty  CurrentParkinglist}">
    						<option selected style="color: black;" value=${CurrentParkinglist[0].parking_no } id="pakringOption1">주차장을 선택해주세요</option>
    						<c:set var="number" value="1"/>
    						<c:forEach var="list" items="${CurrentParkinglist }" varStatus="status">
    							<option value=${list.parking_no } style="color: black;">${list.parking_name }</option>
    						</c:forEach>
    						</c:if>
    						<c:if test="${empty CurrentParkinglist }">
    							<option selected style="color: black;" value="none">등록하신 주차장이 없습니다.</option>
    						</c:if>
  						</select>
						</td>
						
						
                      </tr>  
                      <tr><td colspan="2">
						<ul>
                        <li>선택 박스를 체크 하지 않으시면 제일 첫번째 주차장이 검색됩니다.</li>
                       <li>주차장이 없으실 경우에 등록을 먼저 해주시기 바랍니다.</li>
                       </ul>
						
						</td></tr>
                      <tr>
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button" onclick="selectParking();">검색</button></td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
         <!-- 주차장 정보 입력 폼 --> 
         <div class="card">
		  <div class="card-body">
		    <form action="exchangeParking.pc" method="post" enctype="multipart/form-data" onSubmit="return exchangeParking();">
		    	
		      <div class="form-group">
		        <label for="ex1">주차장 명</label>
		        <input type="text" class="form-control" id="parkingName" placeholder="주차장 이름을 입력해주세요"  name="parkingName" style="width: 300px;">
		      </div>
		      	<div class="form-group">
		        <label for="ex4">주차 구획수</label>
		        <input type="text" class="form-control" id="parkingSize" placeholder="주차 구획수를 입력해주세요" name="parkingSize" style="width: 400px;">
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
		              <input class="form-check-input" type="checkbox" name="pay_typeArry" value="현금" id="payTypeMoney">
		              현금
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" name="pay_typeArry" value="카드" id="payTypeCard">
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
		      <input class="form-radio-input" type="radio" name="priceInfo" value="무료" id="free">&nbsp;무료
		      &nbsp;&nbsp;&nbsp;
		      <input class="form-radio-input" type="radio" name="priceInfo" value="유료" id="notFree">&nbsp;유료
		      </div>
		      
		 
		      <br>
		      <!-- 로직 -->
	<!-- 	      <div class="container">
	
    <form action="" class="form-horizontal"  role="form">
        <fieldset>

            <legend>Test</legend>
            <div class="form-group">
            	
                <label for="dtp_input1" class="col-md-2 control-label">DateTime Picking</label>
                <div class="input-group date form_datetime col-md-5" data-date="2018-09-16T05:25:07Z" data-date-format="yyyy MM dd - HH:ii p" data-link-field="dtp_input1">
                    <div style="width: 70%"><input class="form-control" size="16" type="text" value="" readonly placeholder="Click Me" style="color: white; width: 70%;"></div>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
                
				<input type="hidden" id="dtp_input1" value="" /><br/>
            </div>
			<div class="form-group">
                <label for="dtp_input2" class="col-md-2 control-label">Date Picking</label>
                <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                    <input class="form-control" size="16" type="text" value="" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
					<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
				<input type="hidden" id="dtp_input2" value="" /><br/>
            </div>
			<div class="form-group">
                <label for="dtp_input3" class="col-md-2 control-label">Time Picking</label>
                <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
                    <div style="width: 70%"><input class="form-control" size="16" type="text" value="" readonly style="color: white; width: 40%;">
                    	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
						<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    
                    </div>
                   
                </div>
				<input type="hidden" id="dtp_input3" value="" /><br/>
            </div>

        </fieldset>
		
    </form>

</div> -->
		      
		      
		      <!-- 내가 처리한 시간 로직 -->
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
		   <label for="parking_ntime">기본 시간/요금</label>
		   <div>
		    <input type="text" class="form-control" id="parking_ntime" name="parkingNtime" placeholder="기본 시간" style="width: 250px;">
		  	<br>
		  	<input type="text" class="form-control" placeholder="기본 요금" id="parking_nprice" name="parkingNprice" style="width: 250px;">
		  </div>
		  </div>
		  <br>
		  <div class="form-group">
		   <label for="parking_atime">추가 시간/요금</label>
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
                       <li>정보 수정 신청에서는 시간을 재 입력해주셔야 합니다.</li>
                       <li>시간을 입력하지 않았을시 00:00 ~ 00:00 으로 기본 설정 됩니다.</li>
                       <li>기본 시간과 추가 시간은 5분,요금은 100원 단위로 입력바랍니다 다른 단위로 입력시 5분, 100원 단위로 저장됩니다.</li>
                       </ul>
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
				<input type="file" id="parkingImage1" name="parkingImage"  style="display: none;" onchange="loadImg(this, 1)">
				<input type="file" id="parkingImage2" name="parkingImage"  style="display: none;" onchange="loadImg(this, 2)">
				<input type="file" id="parkingImage3" name="parkingImage" style="display: none;" onchange="loadImg(this, 3)">
			</div>	
			
			<br>
				<div align="center">
				<button type="submit" class="btn btn-info btn-sm" style="" disabled="disabled" id="exchangeSubmit" onclick="exchangeParking();">신청하기</button>
				</div>
				
				
				<input type="hidden" name="hiddenOriginName" id="hiddenOriginName1">
				<input type="hidden" name="hiddenOriginName" id="hiddenOriginName2">
				<input type="hidden" name="hiddenOriginName" id="hiddenOriginName3">
				<input type="hidden" name="hiddenChangeName" id="hiddenChangeName1">
				<input type="hidden" name="hiddenChangeName" id="hiddenChangeName2">
				<input type="hidden" name="hiddenChangeName" id="hiddenChangeName3">
				<input type="hidden" name="hiddenParkingNo" id="hiddenParkingNo">		
		    </form>
		  </div>
		</div>
	
          
          
		<!-- 이미지란 -->



			
    
      
      <!-- content -->
      </div>
    </div>
    
    
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
	
	
	var ParkingNo = "";
	
	function selectParking(){
		//주차장 번호 값 조회
		var parkingSelectBox = $("#inputGroupSelect01 option:selected").val();
		ParkingNo = parkingSelectBox;
		//주차장값이 none일 때 
		if(parkingSelectBox == 'none'){
			var modalText = $("<b>").text("주차장이 없습니다 등록해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
		}
		$("#modalText").html('');
		
		$("#exchangeSubmit").attr('disabled',false);
		
		$.ajax({
			url:"searchParkingOne.pc",
			type:"post",
			data: {parkingSelectBox:parkingSelectBox},
			success : function(data){
				console.log(data);
				
				//이미지 div 출력
				$("#contentImgArea1").css('display', 'block');
				$("#contentImgArea2").css('display', 'block');
				$("#contentImgArea3").css('display', 'block');
				
				//주차장 이름,주차장 크기 동적 값 삽입
				$("#parkingName").val(data.hmap.parkingListOne.PARKING_LIST_NAME);
				$("#parkingSize").val(data.hmap.parkingListOne.PARKING_LIST_PARKING_SIZE);
				
				//운영요일 동적 체크
				var openDaysArry = data.hmap.parkingListOne.PARKING_LIST_OPEN_DAYS.split(',');
				for(var openDaysItem in openDaysArry){
					switch(openDaysArry[openDaysItem]){
						case "평일" : 
							$("input[id=week_days]").prop("checked",true);
							$("input[id=weekdayStime]").css('display', 'block');
							$("input[id=weekdayEtime]").css('display', 'block');
						break;
						case "토요일" : 
							$("input[id=sat_days]").prop("checked",true);
							$("input[id=satStime]").css('display', 'block');
							$("input[id=satEtime]").css('display', 'block');
						break;
						case "일요일" : 
							$("input[id=hol_days]").prop("checked",true);
							$("input[id=hollydayStime]").css('display', 'block');
							$("input[id=hollydayEtime]").css('display', 'block');
						break;
					}
				}
				
				//결제 방법 동적 체크
				var payTypeArray = data.hmap.parkingListOne.PARKING_LIST_PAY_TYPE.split(',');
				for(var payTypeItem in payTypeArray){
					switch(payTypeArray[payTypeItem]){
						case "현금" :
								$("#payTypeMoney").prop("checked",true);
							break;
						case "카드" :
								$("#payTypeCard").prop("checked",true);
							break;
					}
				}
				
				//요금 정보 동적 체크
				if(data.hmap.parkingListOne.PARKING_LIST_PRICE_INFO == '무료'){
					$("#free").prop("checked",true);
				}else{
					$("#notFree").prop("checked",true);
				}
				
				
				//기본,추가(시간,요금) 동적 삽입
				$("#parking_ntime").val(data.hmap.parkingListOne.PARKING_LIST_NTIME);
				$("#parking_nprice").val(data.hmap.parkingListOne.PARKING_LIST_NPRICE);
				$("#parking_atime").val(data.hmap.parkingListOne.PARKING_LIST_ATIME);
				$("#parking_aprice").val(data.hmap.parkingListOne.PARKING_LIST_APRICE);
				
				
				//비고 값이 있을시 동적 삽입
				if(data.hmap.parkingListOne.hasOwnProperty('PARKING_LIST_REMAKRS') == true){
					$("#remarks").val(data.hmap.parkingListOne.PARKING_LIST_REMAKRS);
				}

				/*
				var context = '${pageContext.servletContext.contextPath }' +'/resources/common/parkingImage/';
				

				 //이미지 있을시 div에 동적 삽입
				if(data.hmap.attList.length != 0){
					for(var index in data.hmap.attList){
						var originName = data.hmap.attList[index].ORIGIN_NAME;
						var ext = originName.substr(originName.indexOf("."),4);
						
						switch(index){
							case "0" : 
								$("#hiddenOriginName1").val(context+data.hmap.attList[index].ORIGIN_NAME);
								$("#hiddenChangeName1").val(context+data.hmap.attList[index].CHANGE_NAME);
								break;
							case "1" :
								$("#hiddenOriginName2").val(context+data.hmap.attList[index].ORIGIN_NAME);
								$("#hiddenChangeName2").val(context+data.hmap.attList[index].CHANGE_NAME);
								break;
							case "2" :
								$("#hiddenOriginName3").val(context+data.hmap.attList[index].ORIGIN_NAME);
								$("#hiddenChangeName3").val(context+data.hmap.attList[index].CHANGE_NAME);
								break;
						}
					}
				}	 */			
			},
			error : function(data){
				console.log("데이터 통신 실패");	
			}
		});
		 
	}
	
	
	//주차장 등록 메소드
	function exchangeParking(){
		//각 데이터 정규식 표현 진행
		
		//주차장 번호 삽입
		$("#hiddenParkingNo").val(ParkingNo);
		
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