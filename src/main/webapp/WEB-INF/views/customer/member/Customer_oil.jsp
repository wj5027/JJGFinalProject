<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=103820f64442cfd4cf984f298b7c8470"></script>
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
							    <a class="dropdown-item" href="#">사용내역</a>
							    <a class="dropdown-item" href="#">오일 충전 내역</a>
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
							    <a class="dropdown-item" href="#">3,000원</a>
							    <a class="dropdown-item" href="#">5,000원</a>
							    <a class="dropdown-item" href="#">10,000원</a>
							    <a class="dropdown-item" href="#">30,000원</a>
							  </div>
							</div>
							<br><br><br>
							<button class="btn btn-info animation-on-hover" type="button" onclick="backTableList()">취소</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info animation-on-hover" type="button" onclick="backTableList()">결제하기</button>
							<br><br><br>
							<div style="text-align: left;">
								<p style="color: red;">미사용 오일 환불 안내</p><br>
								-전액 미사용 시 : 결제일로부터 7일 이내 승인취소 가능<br>
								-일부 사용 시 : 일괄 PG사 수수료 5% 제외 후 요청 후 7 영업일 내 계좌입금 처리
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

</html>