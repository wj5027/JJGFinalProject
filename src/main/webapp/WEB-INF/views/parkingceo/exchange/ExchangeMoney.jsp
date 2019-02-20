<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
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
      
       <c:if test="${exchangeChk == 'success'}">

    <div style="position: absolute; z-index: 10; margin: 15% 25%;">
    <div align="center" class="alert alert-default alert-dismissible fade show" role="alert" style="width: 400px; height: 80px; padding-top: 6%; font-size: 20px;">
         <strong>환전 신청</strong>성공.
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
             <i class="tim-icons icon-simple-remove"></i>
         </button>
    </div>
 </div>
  </c:if>
	<c:if test="${exchangeChk == 'failed'}">
	       <div style="position: absolute; z-index: 10; margin: 15% 25%;">
                  <div align="center" class="alert alert-default alert-dismissible fade show" role="alert" style="width: 400px; height: 80px; padding-top: 6%; font-size: 20px;">
                       <strong>환전 신청</strong>실패.
                          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                           <i class="tim-icons icon-simple-remove"></i>
                       </button>
                  </div>
               </div>
	 </c:if>
      
      
      <!-- 내 쿠폰 신청 기능 -->
        <div class="row">
		  <div class="col-md-12" style="height: 500px;" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">환전 신청</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                <form action="exchangeMoney.pc" method="post" onsubmit="return exchange();">
                  <table class="table tablesorter " id="">
                    <tbody>
                       <tr>
                       	<td align="center"><div style="color: white;">현재 ${loginUser.member_name}님의 오일</div></td>
						<td id="currentOil">${loginUser.oil } 오일</td>                       
                       </tr>
                      <tr>
                        <td align="center"><div style="color: white;">예금주</div></td>
                        <td>
						<input type="text" placeholder="예금주 명" class="form-control form-control-success"  style="width: 500px;"
						name="account_holder"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">환전 오일</div></td>
                        <td>
						<input type="number" placeholder="환전할 오일을 입력해주세요" class="form-control form-control-success" style="width: 500px;"
						id="ApplicationOil" name="oil"/>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">은행/계좌번호</div></td>
                        <td>
                        <select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02" style="width: 500px;" name="application_bank" id="Application_bank">
    						<option selected style="color: black;" value="국민">카테고리를 선택해주세요</option>
    						<option value="국민" style="color: black;">국민</option>
    						<option value="신한" style="color: black;">신한</option>
    						<option value="농협" style="color: black;">농협</option>
    						<option value="우리" style="color: black;">우리</option>
  						</select>
						<input type="text" placeholder="계좌번호를 입력해주세요" class="form-control form-control-success" style="width: 500px;" name="application_account_number"/>
						</td>
                      </tr>
                                <tr>
                        <td align="center"><div style="color: white;">환전 동의</div></td>
                        <td>
						
						<div style="width: 500px;">
						본인은 환금 금액에 대해 위 계좌로 환금되는 것에 동의합니다. 타인 계좌로 환급 요청 시, 
  						 이에 대한 모든 법적 책임은 본인에게 있습니다.  위 내용에 확인하였으며, 이에 동의합니다.
  						 지금 주차하러 갑니다의 기본 수수료는 10% 입니다.

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
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="submit">신청</button>
                      	<button class="btn btn-default animation-on-hover" type="reset">취소</button></td>                      
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
  </div>


     <div class="modal fade bd-example-modal-lg-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center" id="modalText"></td></tr>
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
	
	function exchange(){
		
		if($("#currentOil").text().replace(" 오일","") < $("#ApplicationOil").val()){
			var modalText = $("<b>").text("죄송합니다 보유하신 오일보다 환전금액이 높을 수 없습니다.");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		if($("#inlineCheckbox1").is(":checked")==false){
			var modalText = $("<b>").text("죄송합니다 환전 동의를 체크해주세요");
			$("#modalText").append(modalText);
			$("#modalBtn").click();
			return false;
		}
		
		return true;
	}
	

</script>

</html>