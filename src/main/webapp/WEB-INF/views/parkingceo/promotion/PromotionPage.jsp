<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		  <div class="col-md-12" height="500px" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">쿠폰 신청</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">주차장 명</div></td>
                        <td>
						<input type="text" placeholder="주차장 명을 넣어주세요" class="form-control form-control-success"  style="width: 500px;"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">쿠폰명</div></td>
                        <td>
						<input type="text" placeholder="쿠폰 명을 넣어주세요" class="form-control form-control-success" style="width: 500px;"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">가격/할인률</div></td>
                        <td>
                        <select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02" style="width: 500px;">
    						<option selected style="color: black;">카테고리를 선택해주세요</option>
    						<option value="1" style="color: black;">가격</option>
    						<option value="2" style="color: black;">할인률</option>
  						</select>
						<input type="text" placeholder="숫자를 입력해주세요" class="form-control form-control-success" style="width: 500px;"/>
						</td>
                      </tr>
                      <tr>
                      	<td align="center"><div style="color: white;">기간을 선택해주세요(기본 3개월)</div></td>
                      <!-- 	<td><button class="btn btn-info btn-round btn-sm">오늘</button>
                      			<button class="btn btn-info btn-round btn-sm">1주일</button>
                      			<button class="btn btn-info btn-round btn-sm">1개월</button>
                      			<button class="btn btn-info btn-round btn-sm">3개월</button>
                      			<button class="btn btn-info btn-round btn-sm">6개월</button>
                      			<button class="btn btn-info btn-round btn-sm">1년</button>
                      	</td> -->
                      	<td>
                      	<div>
                      		   <div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="margin: 0; padding: 0; display: inline-block;">
		    					<div style="width: 70%"><input class="form-control"  id="startDay" size="16" type="text" placeholder="시작일" readonly style="color: white; width: 100%; cursor: pointer !important;">
		  	 					<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
								<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    			</div>
		  				</div>
                      	<div class="input-group date form_date col-md-5" data-date="" data-date-format="yyyy MM dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd" style="margin: 0; padding: 0; display: inline-block;">
		    					<div style="width: 70%"><input class="form-control"  id="EndDay" size="16" type="text" placeholder="종료일" readonly style="color: white; width: 100%; cursor: pointer !important;">
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
						<input type="text" placeholder="비고란" class="form-control form-control-success" style="width: 500px;"/>
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
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button">신청</button></td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
      <!-- content -->
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
	

</script>

</html>