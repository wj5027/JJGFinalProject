<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	
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
      
      <!-- 내 쿠폰 신청 기능 -->
        <div class="row">
		  <div class="col-md-12" style="height: 500px;" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">쿠폰 신청</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                <form action="insertPromotion.pc" method="post" onSubmit="return insertPromotion();">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">주차장 명</div></td>
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
                      <tr>
                        <td align="center"><div style="color: white;">쿠폰명</div></td>
                        <td>
						<input type="text" placeholder="쿠폰 명을 넣어주세요" class="form-control form-control-success" style="width: 500px;" name="coupon_name"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">가격/할인률</div></td>
                        <td>
                        <select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02" style="width: 500px;" name="selectDiscount">
    						<option selected style="color: black;" value="oilMoney">카테고리를 선택해주세요</option>
    						<option value="oilMoney" style="color: black;">가격</option>
    						<option value="percent" style="color: black;">할인률</option>
  						</select>
						<input type="text" placeholder="숫자를 입력해주세요" class="form-control form-control-success" style="width: 500px;" name="discountValue" id="discountValue"/>
						</td>
                      </tr>
                      <tr>
                      	<td align="center"><div style="color: white;">기간을 선택해주세요</div></td>
                      	<td>
                      	<div>
                      		   <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="margin: 0; padding: 0; display: inline-block;">
		    					<div style="width: 70%"><input class="form-control"  id="startDay" size="16" type="text" placeholder="시작일" readonly style="color: white; width: 100%; cursor: pointer !important;" name="startDay">
		  	 					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    			</div>
		  				</div>
                      	<div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="margin: 0; padding: 0; display: inline-block;">
		    					<div style="width: 70%"><input class="form-control"  id="EndDay" size="16" type="text" placeholder="종료일" readonly style="color: white; width: 100%; cursor: pointer !important;" name="endDay">
		  	 					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    			</div>
		  				</div>
                      	</div>
                      	</td>
                      </tr>
                        <tr>
                        <td align="center"><div style="color: white;">비고</div></td>
                        <td>
						<input type="text" placeholder="비고란" class="form-control form-control-success" style="width: 500px;" name="remark"/>
						</td>
                      </tr>
                        <tr>
                        <td align="center"><div style="color: white;">수량</div></td>
                        <td>
						<input type="text" placeholder="수량을 적어주세요" class="form-control form-control-success" style="width: 500px;" name="amount"/>
						</td>
                      </tr>
                                           <tr>
                      <td colspan="2">
                       <ul>
                        <li>박스를 클릭하지 않으시고 검색 버튼을 누르면 제일 상위 박스 카테고리가 검색됩니다.</li>
                       <li>할인율은 100이하의 숫자를 입력해주세요. 100 초과 숫자 입력시 신청이 되지 않습니다.</li>
                       <li>가격은 현재 사업자님의 주차장 기본 요금보다 높을 수 없습니다. 확인 후 입력바랍니다.</li>
                       <li>쿠폰 시작일은 당일보다 이전일 수 없습니다.</li>
                       </ul>
                      </td>
                      </tr>      
                      <tr>
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="submit" >신청</button></td>
                      </tr>                    
                    </tbody>
                  </table>
                  </form>
                </div>
              </div>
            </div>
          </div>
      <!-- content -->
      </div>
    </div>
    
    
    
    
  </div>
  
  <c:if test="${promotionChk == 'success'}">
<div style="margin: 20% 40%; position: absolute; z-index: 10;">
                  <div align="center" class="alert alert-default alert-dismissible fade show" role="alert" style="width: 400px; height: 80px; padding-top: 6%; font-size: 20px;">
                       <strong>쿠폰 신청</strong>완료.
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                           <i class="tim-icons icon-simple-remove"></i>
                       </button>
                  </div>
               </div>
  </c:if>
	<c:if test="${promotionChk == 'failed'}">
	       <div style="position: absolute; z-index: 10; margin: 20% 40%;">
                  <div align="center" class="alert alert-default alert-dismissible fade show" role="alert" style="width: 400px; height: 80px; padding-top: 6%; font-size: 20px;">
                       <strong>쿠폰 신청</strong>실패.
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                           <i class="tim-icons icon-simple-remove"></i>
                       </button>
                  </div>
               </div>
	 </c:if>
  
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
	
	function insertPromotion(){
		if($("#inputGroupSelect01 option:selected").val() == "none"){
			alert("주차장이 없습니다. 등록해주세요");
			return false;
		}
		if($("#inputGroupSelect02 option:selected").val() == "percent"){
			if($("#discountValue").val() > 100){
				alert("할인률은 100을 넘길 수 없습니다. 재확인 해주세요");
				return false;
			}
		}
		
		var selectStartDay = $("#startDay").val().replace('월','');
		var StartDayCheckDate = new Date(selectStartDay);
		var toDayDate = new Date();
		var toDay = toDayDate.toLocaleDateString();
		var StartDayCheck = StartDayCheckDate.toLocaleDateString();
		

		
		if(toDay > StartDayCheck){
			alert("쿠폰 시작일은 오늘 기준으로 입력해주세요");
			return false;
		}
		var selectEndDay = $("#EndDay").val().replace('월','');
		var toDay2 = toDayDate.toLocaleDateString();
		var endDayCheckDate = new Date(selectEndDay);
		var endDayCheck = endDayCheckDate.toLocaleDateString();
		
		console.log(toDay2);
		console.log(endDayCheck);
		
		/* if(toDay2 >= endDayCheck){
			console.log(toDay);
			console.log(endDayCheck);
			alert("쿠폰 종료일은 내일 기준으로 입력해주세요");
			return false;
		} */
		return true;
	}

	

</script>

</html>