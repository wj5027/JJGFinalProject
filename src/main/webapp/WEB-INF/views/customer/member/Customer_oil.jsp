<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>

<body class="">
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    <div class="main-panel">
      <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>
      
      <div class="content">
        <div class="row">
          <div class="card-body">
            <table class="table tablesorter " id="listTable">
				<tbody align="center">
					<tr>
						<td colspan="2" style="text-align: left;"><b>내 오일</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;"><b>4,000L</b></td>
					</tr>
					<tr>
						<td colspan="6">
							<div class="btn-group">
							  <div style="margin-top: auto; margin-bottom: auto;">사용내역</div>
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <div>
							  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  	선택
							  </button>
							  
							  <div class="dropdown-menu">
							  	<a class="dropdown-item" href="#">오일 충전 내역</a>
							    <a class="dropdown-item" href="#">사용내역</a>
							  </div>
							  </div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="6">
							기간 : 날짜부터 날짜까지
						</td>
					</tr>
					<tr>
						<td colspan="1"><b>사용일자</b></td>
						<td colspan="3"><b>주차장명</b></td>
						<td colspan="1"><b>주차시간</b></td>
						<td colspan="1"><b>사용오일</b></td>
					</tr>
					<tr>
						<td colspan="1">2018-12-01</td>
						<td colspan="3">롯데시네마</td>
						<td colspan="1">2시간</td>
						<td colspan="1">3,000L</td>
					</tr>
					<tr>
						<td colspan="6">
							<button class="btn btn-info animation-on-hover" type="button" onclick="changeTableList()">오일충전</button>
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table tablesorter " id="payTable" style="display: none;">
				<tbody align="center">
					<tr>
						<td colspan="2" style="text-align: left;"><b>내 오일</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;"><b>4,000L</b></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: left;"><b>결제금액</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;"><b>3,000원</b></td>
					</tr>
					
					<tr>
						<td colspan="6">
							<div>
							  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  	금액 선택
							  </button>
							  
							  <div class="dropdown-menu">
							    <a class="dropdown-item" onclick="selecteMoney(3000)">3,000원</a>
							    <a class="dropdown-item" onclick="selecteMoney(5000)">5,000원</a>
							    <a class="dropdown-item" onclick="selecteMoney(10000)">10,000원</a>
							    <a class="dropdown-item" onclick="selecteMoney(30000)">30,000원</a>
							  </div>
							</div>
							<br>
							<div id="showSelectedMoney">
								
							</div>
							<br>
							<button class="btn btn-info animation-on-hover" type="button" onclick="backTableList()">취소</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info animation-on-hover" type="button" onclick="payment('${ loginUser.member_no }')">결제하기</button>
							<br><br><br>
							<div style="text-align: left;">
								<p style="color: red;">미사용 오일 환불 안내</p><br>
								- 결제일로부터 3일 이내 승인취소 가능<br>
								- 일괄 PG사 수수료 5% 제외 후 요청 후 관리자 승인을 통해 7일 이내 계좌입금 처리<br>
								- 보유한 오일이 환불할 오일보다 부족하다면 환불이 불가능합니다.
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<script type="text/javascript">
				function changeTableList() {
					$("#listTable").css("display", "none");
					$("#payTable").css("display", "");
				}
				function backTableList() {
					$("#listTable").css("display", "");
					$("#payTable").css("display", "none");
				}
			</script>
		  </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	IMP.init('imp31619485'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	var selectedPay = 0;
	var chargeOil = 0;
	
	function selecteMoney(select) {
		selectedPay = select;
		chargeOil = select + (select * 0.1);
		if (select > 9999) {
			$("#showSelectedMoney").html("선택한 금액 : " + (selectedPay / 1000) + ",000"
					+ "<br>"
					+ "충전될 오일 : " + (chargeOil / 1000) + ",000");
		} else {
			$("#showSelectedMoney").html("선택한 금액 : " + (selectedPay / 1000) + ",000"
					+ "<br>"
					+ "충전될 오일 : " + ((chargeOil / 1000) + "00").replace('.', ','));
		}
		
	}
	
	function payment(memberNo) {
		var link = document.location.href;
		console.log(link.substring(0, link.indexOf("jjg")) + 'jjg/oil.cu')
		if (selectedPay != 0) {
			var nowTime = new Date();
			var randomUid = memberNo + "_" + chargeOil + "_"
								+ nowTime.getFullYear() + (nowTime.getMonth() + 1) + nowTime.getDate() + nowTime.getHours() + nowTime.getMinutes();
			
			IMP.request_pay({
			    pay_method : 'card',
			    merchant_uid : randomUid,
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_name : '구매자이름',
			    m_redirect_url: link.substring(0, link.indexOf("jjg")) + 'jjg/oilIn.cu'
			}, function(rsp) {
			    // 모바일에선 콜백을 하지 않아요...ㅜㅜㅜㅜ
			});
		} else {
			alert("먼저 금액을 선택해주세요!")
		}
	}
		
	
	
</script>

</html>