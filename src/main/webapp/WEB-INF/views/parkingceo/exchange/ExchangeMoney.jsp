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
		  <div class="col-md-12" style="height: 500px;" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">환전 신청</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                       <tr>
                       	<td align="center"><div style="color: white;">현재 [사업자]님의 오일</div></td>
						<td>짱많움</td>                       
                       </tr>
                      <tr>
                        <td align="center"><div style="color: white;">예금주</div></td>
                        <td>
						<input type="text" placeholder="예금주 명" class="form-control form-control-success"  style="width: 500px;"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">생년월일</div></td>
                        <td>
						<input type="text" placeholder="생년월일" class="form-control form-control-success" style="width: 500px;"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">은행/계좌번호</div></td>
                        <td>
                        <select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02" style="width: 500px;">
    						<option selected style="color: black;">카테고리를 선택해주세요</option>
    						<option value="1" style="color: black;">국민</option>
    						<option value="2" style="color: black;">신한</option>
  						</select>
						<input type="text" placeholder="계좌번호를 입력해주세요" class="form-control form-control-success" style="width: 500px;"/>
						</td>
                      </tr>
                                <tr>
                        <td align="center"><div style="color: white;">환전 동의</div></td>
                        <td>
						
						<div style="width: 500px;">
						본인은 환금 금액에 대해 위 계좌로 환금되는 것에 동의합니다. 타인 계좌로 환급 요청 시, 
  						 이에 대한 모든 법적 책임은 본인에게 있습니다.  위 내용에 확인하였으며, 이에 동의합니다.

						</div>
						</td>
                      </tr>
                      <tr>
                      <td colspan="2" align="center">동의합니다
						<div class="form-check form-check-inline">
      						<label class="form-check-label">
        				<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
       					 <span class="form-check-sign"></span>
      					</label>
    						</div>
                   
                      </td>
                      </tr>
                      <tr>
                      <td colspan="2">
                       
                      </td>
                      </tr>      
                      <tr>
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button">신청</button>
                      	<button class="btn btn-default animation-on-hover" type="button">취소</button></td>                      
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