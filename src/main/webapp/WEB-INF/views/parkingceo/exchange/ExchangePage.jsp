<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	.imagesTest{
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
		    <form action="#" method="post">
		    	
		      <div class="form-group">
		        <label for="ex1">주차장 명</label>
		        <input type="text" class="form-control" id="ex1" placeholder="주차장 이름을 입력해주세요"  name="parkingName" style="width: 300px;">
		      </div>
		      	<div class="form-group">
		        <label for="ex4">주차 구획수</label>
		        <input type="text" class="form-control" id="ex4" placeholder="주차 구획수를 입력해주세요" style="width: 400px;">
		      </div>
		      <div class="form-check">
		      <label for="ex5">운영 요일</label>
		      <br>
		          <label class="form-check-label" id="ex5">
		              <input class="form-check-input" type="checkbox" value="평일">
		              평일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" value="토요일">
		              토요일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" value="공휴일">
		              공휴일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		      </div>
		      <br>
		             <div class="form-check">
		      <label for="ex5">결제 방법</label>
		      <br>
		          <label class="form-check-label" id="ex5">
		              <input class="form-check-input" type="checkbox" value="현금">
		              현금
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" value="카드">
		              카드
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		      </div>
		      
		      <br>
		      <div class="form-group" style="color: rgb(167,168,176);">
		      <label for="exzero">요금정보</label>
		      <br>
		      <input class="form-radio-input" type="radio" name="payType">&nbsp;무료
		      &nbsp;&nbsp;&nbsp;
		      <input class="form-radio-input" type="radio" name="payType">&nbsp;유료
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
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="weekDayStartTime" size="16" type="text" placeholder="시작시간" readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="weekDayEndTime" size="16" type="text" placeholder="종료시간" readonly style="color: white; width: 100%; cursor: pointer !important; " >
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
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="satDayStartTime" size="16" type="text" placeholder="시작시간" readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="satDayEndTime" size="16" type="text" placeholder="종료시간" readonly style="color: white; width: 100%; cursor: pointer !important; " >
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
		   <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="holDayStartTime" size="16" type="text" placeholder="시작시간" readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>
		  	</div>
		  	<div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
		    <div style="width: 70%"><input class="form-control"  id="holDayEndTime" size="16" type="text" placeholder="종료시간" readonly style="color: white; width: 100%; cursor: pointer !important; " >
		  	 <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
			<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    </div>	
		  	</div>
		  </div>
		  </div>
		  
		  <br>
		  	<div class="form-group">
		   <label for="ex7">기본 시간/요금</label>
		   <div>
		    <input type="text" class="form-control" id="ex7" placeholder="기본 시간" style="width: 250px;">
		  	<br>
		  	<input type="text" class="form-control" placeholder="기본 요금" style="width: 250px;">
		  </div>
		  </div>
		  <br>
		  <div class="form-group">
		   <label for="ex7">추가 시간/요금</label>
		   <div>
		    <input type="text" class="form-control" id="ex7" placeholder="추가 시간" style="width: 250px;">
		    <br>
		  	<input type="text" class="form-control" placeholder="추가 요금" style="width: 250px;">
		  </div>
		  </div>
		      <br>
			<div align="center">
				<div class="imagesTest"></div>
				<div class="imagesTest"></div>
				<div class="imagesTest"></div>
				<!-- 파일 숨기기 -->
				<input type="file" style="display: none;">
				<input type="file" style="display: none;">
				<input type="file" style="display: none;">
			</div>	
			
			<br>
				<div align="center">
				<button type="submit" class="btn btn-info btn-sm" style="">신청하기</button>
				</div>
				
				
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
	
	
	function selectParking(){
		var parkingSelectBox = $("#inputGroupSelect01 option:selected").val();
		console.log(parkingSelectBox);
		if(parkingSelectBox = 'none'){
			var modalText = $("<b>").text("주차장이 없습니다 등록해주세요.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
		}
		$("#modalText").html('');
		
	}

	
</script>

</html>