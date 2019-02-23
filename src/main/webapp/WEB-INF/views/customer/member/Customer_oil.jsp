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
       	  <div class="col-md-12" height="500px" id="listTable">
          <div class="card ">
          <div class="card-body" style="padding-bottom: 0px;">
            <table class="table tablesorter ">
				<tbody align="center">
				<c:if test="${ !empty loginUser }">
					<tr>
						<td colspan="1" style="text-align: left;"><b>내 오일</b></td>
						<td colspan="1"><b></b></td>
						<td colspan="1"style="text-align: right;"><b><fmt:formatNumber value="${ UserOilInfo }" groupingUsed="true"></fmt:formatNumber>L</b></td>
					</tr>
					<tr>
						<td colspan="3">
							<div class="btn-group">
							  <div style="margin-top: auto; margin-bottom: auto;" id="selectedOilView">오일 충전 내역</div>
							  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <div>
							  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  	선택
							  </button>
							  
							  <div class="dropdown-menu">
							  	<a class="dropdown-item" onclick="OilChargeList()">오일 충전 내역</a>
							    <a class="dropdown-item" onclick="OilUseList()">사용내역</a>
							    <a class="dropdown-item" onclick="OilRefundList()">오일 환불</a>
							  </div>
							  </div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="1">
							<div class="input-group date form_date col-md-5" data-date="" data-date-format="yy년 MM d일" data-link-field="dtp_input3" data-link-format="yyyy-mm-d">
		    					<div>
		    						<input class="form-control"  id="setStartTime" size="16" type="text" placeholder="시작날짜" readonly style="color: white; width: 110px; cursor: pointer !important;">
		  	 						<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    					</div>
		  					</div>
		  				</td>
		  				<td colspan="1">
		  					-
						</td>
						<td colspan="1">
							<div class="input-group date form_date col-md-5" data-date="" data-date-format="yy년 MM d일" data-link-field="dtp_input3" data-link-format="yyyy-mm-d">
		    					<div>
		    						<input class="form-control"  id="setEndTime" size="16" type="text" placeholder="마지막날짜" readonly style="color: white; width: 110px; cursor: pointer !important;">
		  	 						<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
									<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
		    					</div>
		  					</div>
						</td>
					</tr>
					<tr>
						<td colspan="3">
							<button class="btn btn-info animation-on-hover" type="button" onclick="searchList(1)">검색</button>
						</td>
					</tr>
				</c:if>
				</tbody>
			</table>
		  </div></div></div>
		  <div class="col-md-12" height="500px" id="listTable2">
          <div class="card ">
          <div class="card-body" style="padding-bottom: 0px; overflow: auto; height: 200px;">
          	<table class="table tablesorter ">
				<tbody align="center" style="overflow-y:auto; overflow-x:hidden;" id="selectOilView">
				<c:if test="${ empty loginUser }">
					<tr>
						<th colspan="3" style="color: white;">로그인을 해주세요!</th>
					</tr>
				</c:if>
				</tbody>
			</table>
			<div id="pagingArea" align="center"></div>
		  </div>
		  </div>
		  </div>
		  <c:if test="${ !empty loginUser }">
		  <div align="center" style="width: 100%" id="listBtn">
		  	<button class="btn btn-info animation-on-hover" type="button" onclick="changeTableList()">오일충전</button>
		  </div>
		  <div align="center" style="width: 100%; display: none;" id="listRefundBtn">
		  	<button class="btn btn-info animation-on-hover" type="button" onclick="changeTableRefund()">환불</button>
		  </div>
		  </c:if>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 테이블 경계선 -->
		  <div class="col-md-12" height="500px" id="payTable" style="display: none;">
          <div class="card ">
          <div class="card-header">
          	<h4 class="card-title">결제</h4>
          </div>
          <div class="card-body" style="padding-bottom: 0px;">
			<table class="table tablesorter ">
				<tbody align="center">
					<tr>
						<td colspan="2" style="text-align: left;"><b>내 오일</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;"><b><fmt:formatNumber value="${ UserOilInfo }" groupingUsed="true"></fmt:formatNumber>L</b></td>
					</tr>
					<tr id="showChargeView" style="display: none;">
						<td colspan="2" style="text-align: left;"><b>결제금액</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;" id="selectedChargeView"><b>0원</b></td>
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
								- 일부 PG사 수수료 5% 제외 후 요청 후 관리자 승인을 통해 7일 이내 계좌입금 처리<br>
								- 환불 시 보유한 오일이 환불할 오일보다 부족하다면 환불이 불가능합니다.
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		  </div>
		  </div>
		  </div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 테이블 경계선 -->
		  <div class="col-md-12" height="500px" id="refundTable" style="display: none;">
          <div class="card ">
          <div class="card-header">
          	<h4 class="card-title">환불</h4>
          </div>
          <div class="card-body" style="padding-bottom: 0px;">
			<table class="table tablesorter ">
				<tbody align="center">
					<tr>
						<td colspan="2" style="text-align: left;"><b>내 오일</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;"><b><fmt:formatNumber value="${ UserOilInfo }" groupingUsed="true"></fmt:formatNumber>L</b></td>
					</tr>
					<tr id="showRefundView" style="display: none;">
						<td colspan="2" style="text-align: left;"><b>환불 할 오일</b></td>
						<td colspan="2"><b></b></td>
						<td colspan="2"style="text-align: right;" id="selectedRefundView"><b>0L</b></td>
					</tr>
					
					<tr>
						<td colspan="6">
							<div>
							  <button type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							  	오일 선택
							  </button>
							  
							  <div class="dropdown-menu">
							    <a class="dropdown-item" onclick="selecteOil(3300)">3,300L</a>
							    <a class="dropdown-item" onclick="selecteOil(5500)">5,500L</a>
							    <a class="dropdown-item" onclick="selecteOil(11000)">11,000L</a>
							    <a class="dropdown-item" onclick="selecteOil(33000)">33,000L</a>
							  </div>
							</div>
							<br>
							<div id="showSelectedOil">
								
							</div>
							<br>
							<button class="btn btn-info animation-on-hover" type="button" onclick="backTableRefundList()">취소</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class='btn btn-info animation-on-hover' data-toggle='modal' onclick="refundNo(${ loginUser.member_no }, ${ UserOilInfo })" data-target='.cancle_pay'>환불신청</button>
							<br><br><br>
							<div style="text-align: left;">
								<p style="color: red;">미사용 오일 환불 안내</p><br>
								- 일부 PG사 수수료 5% 제외 후 요청 후 관리자 승인을 통해 7일 이내 계좌입금 처리<br>
								- 환불 시 보유한 오일이 환불할 오일보다 부족하다면 환불이 불가능합니다.
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		  </div>
		  </div>
		  </div>
        </div>
      </div>
      	  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 결제 취소 모달 -->
            <div class="modal fade cancle_pay" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody id="ShowRefundModal">
			                  <tr>
			                  	<td align="center"><br><br>
			                  		환불할 포인트는 1000 입니다.<br><br>
			                  		정말로 환불 하시겠습니까?
			                  	<br><br><br></td>
			                  </tr>
			                  <tr><td align="center">
			                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="">취소</button>
			                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="requestRefund()">환불</button>
			                  </td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		  <button id="clickRefundResult" class='btn btn-info btn-sm' data-toggle='modal' data-target='.refund_pay_result' style="visibility: hidden;"></button>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 결제 취소 확인 모달 -->
            <div class="modal fade refund_pay_result" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody id="ShowRefundResultModal">
			                  <tr>
			                  	<td align="center">
			                  	<br><br>
			                  		정상적으로 신청되었습니다.
			                  		<br><br>
			                  		7일 안에 관리자의 승인을 거처 환불이 됩니다.
			                  		<br><br>
			                  		그 동안 신청한 포인트는 사용을 할 수 없습니다.
			                  	<br><br>
			                  	</td>
			                  </tr>
			                  <tr>
			                  	<td align="center">
			                  		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='oil.cu'">닫기</button>
			                  	</td>
			                  </tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    </div>
  </div>
 
</body>
<script type="text/javascript">
	var selectedListInfo = "충전";
	var memberNo = ${loginUser.member_no};
	
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

	function changeTableList() {
		$("#listTable").css("display", "none");
		$("#listTable2").css("display", "none");
		$("#listBtn").css("display", "none");
		$("#listRefundBtn").css("display", "none");
		$("#payTable").css("display", "inline-block");
	}
	function changeTableRefund() {
		$("#listTable").css("display", "none");
		$("#listTable2").css("display", "none");
		$("#listBtn").css("display", "none");
		$("#listRefundBtn").css("display", "none");
		$("#refundTable").css("display", "inline-block");
	}
	function backTableList() {
		$("#listTable").css("display", "inline-block");
		$("#listTable2").css("display", "inline-block");
		$("#listBtn").css("display", "inline-block");
		$("#listRefundBtn").css("display", "none");
		$("#payTable").css("display", "none");
		$("#refundTable").css("display", "none");
	}
	function backTableRefundList() {
		$("#listTable").css("display", "inline-block");
		$("#listTable2").css("display", "inline-block");
		$("#listBtn").css("display", "none");
		$("#listRefundBtn").css("display", "inline-block");
		$("#payTable").css("display", "none");
		$("#refundTable").css("display", "none");
	}
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp31619485'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	var selectedPay = 0;
	var chargeOil = 0;
	var selectedOil = 0;
	
	function selecteMoney(select) {
		selectedPay = select;
		chargeOil = select + (select * 0.1);
		if (select > 9999) {
			$("#showSelectedMoney").html("충전될 오일 : " + (chargeOil / 1000) + ",000");
		} else {
			$("#showSelectedMoney").html("충전될 오일 : " + ((chargeOil / 1000) + "00").replace('.', ','));
		}
		
		$("#showChargeView").css("display", "");
		
		$("#selectedChargeView").html("<b>" + (selectedPay / 1000) + ",000" + "원</b>")
		
	}
	
	function selecteOil(select) {
		selectedOil = select;
		if (select > 9999) {
			$("#selectedRefundView").html((selectedOil / 1000) + ",000L");
		} else {
			if (select == 3300) {
				$("#selectedRefundView").html("3,300L");
			} else {
				$("#selectedRefundView").html("5,500L");
			}
		}
		
		$("#showRefundView").css("display", "");
		
	}
	
	function payment(memberNo) {
		var link = document.location.href;
		console.log(link.substring(0, link.indexOf("jjg")) + 'jjg/oil.cu')
		if (selectedPay != 0) {
			var nowTime = new Date();
			var randomUid = memberNo + "_" + chargeOil + "_"
								+ nowTime.getFullYear() + (nowTime.getMonth() + 1) + nowTime.getDate() + nowTime.getHours() + nowTime.getMinutes() + nowTime.getSeconds();
			
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
	
	function OilChargeList() {
		$("#selectedOilView").html("오일 충전 내역");
		
		selectedListInfo = "충전";
	}
	
	function OilUseList() {
		$("#selectedOilView").html("사용내역");
		
		selectedListInfo = "사용";
	}
	
	function OilRefundList() {
		$("#selectedOilView").html("환불 내역");
		
		selectedListInfo = "환불";
	}
	
	function searchList(pageNo) {
		var startTime = $("#setStartTime").val()
		var endTime = $("#setEndTime").val();
		
		if (startTime != "" && endTime != "") {
			if (compareTime(startTime, endTime)) {
				$.ajax({
					url:"searchOilList.cu",
					type:"post",
					data:{startTime:startTime, endTime:endTime, selectedListInfo:selectedListInfo, memberNo:memberNo, pageNo:pageNo},
					success:function(data){
						if (selectedListInfo == '충전') {
							$("#selectOilView").html("");
							
							$("#listRefundBtn").css("display", "none");
							$("#listBtn").css("display", "inline-block");
							
							$("#selectOilView").append("<tr>"
															+ "<th>"
															+ "날짜"
															+ "</th>"
															+ "<th>"
															+ "분류"
															+ "</th>"
															+ "<th>"
															+ "오일"
															+ "</th>"
													+ "</tr>");
							for (var i = 0; i < data.length; i++) {
								if (data[i].oilListType == '충전') {
									if ((newDate.getTime() - new Date(data[i].oilListDate).getTime()) / (1000*60*60*24) <= 3) {
										$("#selectOilView").append("<tr>"
												+ "<td>"
												+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
												+ "</td>"
												+ "<td>"
												+ data[i].oilListType
												+ "</td>"
												+ "<td>"
												+ "+" + data[i].oil + "L"
												+ "<td>"
												+ "</tr>");
									} else {
										$("#selectOilView").append("<tr>"
												+ "<td>"
												+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
												+ "</td>"
												+ "<td>"
												+ data[i].oilListType
												+ "</td>"
												+ "<td>"
												+ "+" + data[i].oil + "L"

												+ "<td>"
												+ "</tr>");
									}
								} else {
									$("#selectOilView").append("<tr>"
											+ "<td>"
											+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
											+ "</td>"
											+ "<td>"
											+ data[i].oilListType
											+ "</td>"
											+ "<td>"
											+ "-" + data[i].oil + "L"
											+ "<td>"
											+ "</tr>");
								}

							}
						} else if(selectedListInfo == '사용') {
							$("#selectOilView").html("");
							
							$("#listRefundBtn").css("display", "none");
							$("#listBtn").css("display", "inline-block");
							
							$("#selectOilView").append("<tr>"
															+ "<th>"
															+ "날짜"
															+ "</th>"
															+ "<th>"
															+ "분류"
															+ "</th>"
															+ "<th>"
															+ "주차장 명"
															+ "</th>"
															+ "<th>"
															+ "오일"
															+ "</th>"
													+ "</tr>");
							for (var i = 0; i < data.length; i++) {
								if (data[i].oilListType == '예약취소') {
									$("#selectOilView").append("<tr>"
																	+ "<td>"
																	+ (new Date(data[i].oilListDate).getYear() - 100) + "년<br>" + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
																	+ "</td>"
																	+ "<td>"
																	+ data[i].oilListType
																	+ "</td>"
																	+ "<td>"
																	+ data[i].parkingName
																	+ "</td>"
																	+ "<td>"
																	+ "+" + data[i].oil + "L"
																	+ "<td>"
																	+ "</tr>");
								} else {
									$("#selectOilView").append("<tr>"
																	+ "<td>"
																	+ (new Date(data[i].oilListDate).getYear() - 100) + "년<br>" + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
																	+ "</td>"
																	+ "<td>"
																	+ data[i].oilListType
																	+ "</td>"
																	+ "<td>"
																	+ data[i].parkingName
																	+ "</td>"
																	+ "<td>"
																	+ "-" + data[i].oil + "L"
																	+ "<td>"
																	+ "</tr>");
								}
							}
						} else { // 날짜 선택 환불 검색
							$("#selectOilView").html("");
							
							$("#listRefundBtn").css("display", "inline-block");
							$("#listBtn").css("display", "none");
							
							$("#selectOilView").append("<tr>"
													+ "<th>"
													+ "날짜"
													+ "</th>"
													+ "<th>"
													+ "분류"
													+ "</th>"
													+ "<th>"
													+ "오일"
													+ "</th>"
													+ "</tr>");
							for (var i = 0; i < data.length; i++) {
								$("#selectOilView").append("<tr>"
										+ "<td>"
										+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
										+ "</td>"
										+ "<td>"
										+ data[i].oilListType
										+ "</td>"
										+ "<td>"
										+ data[i].oil + "L"
										+ "<td>"
										+ "</tr>");
							}
						}
						// 페이징 Ajax
						$.ajax({
							url:"searchOilListPI.cu",
							type:"post",
							data:{startTime:startTime, endTime:endTime, selectedListInfo:selectedListInfo, memberNo:memberNo, pageNo:pageNo},
							success:function(data){
								$("#pagingArea").html("");
								if (data.currentPage <= 1) {
									
								} else if (data.currentPage > 1) {
									$("#pagingArea").append("<a onclick='searchList(" + (data.currentPage - 1) + ")'>[이전]</a> &nbsp; &nbsp;");
								}
								
								
								
								for (var i = data.startPage; i <= data.endPage; i++) {
									if (data.currentPage == i) {
										$("#pagingArea").append("<font color='white' size='4'><b>" + i + "</b></font> &nbsp; &nbsp;");
									} else {
										$("#pagingArea").append("<a onclick='searchList(" + i + ")'>" + i + "</a> &nbsp; &nbsp;");
									}
								}
								
								
								if (data.currentPage >= data.maxPage) {
									
								} else if (data.currentPage < data.maxPage) {
									$("#pagingArea").append("<a onclick='searchList(" + (data.currentPage + 1) + ")'>[다음]</a>");
								}
							},
							error:function(status){
								console.log(status);
							}
						});
					},
					error:function(status){
						console.log(status);
					}
				});
			} else {
				alert("마지막 날짜를 올바르게 입력해주세요!")
			}
		} else { // 날짜 선택하지 않은 검색
			$.ajax({
				url:"searchOilList.cu",
				type:"post",
				data:{startTime:startTime, endTime:endTime, selectedListInfo:selectedListInfo, memberNo:memberNo, pageNo:pageNo},
				success:function(data){
					var newDate = new Date();
					if (selectedListInfo == '충전') {
						$("#selectOilView").html("");
						
						$("#listRefundBtn").css("display", "none");
						$("#listBtn").css("display", "inline-block");
						
						$("#selectOilView").append("<tr>"
														+ "<th>"
														+ "날짜"
														+ "</th>"
														+ "<th>"
														+ "분류"
														+ "</th>"
														+ "<th>"
														+ "오일"
														+ "</th>"
												+ "</tr>");
						for (var i = 0; i < data.length; i++) {
							if (data[i].oilListType == '충전') {
								if ((newDate.getTime() - new Date(data[i].oilListDate).getTime()) / (1000*60*60*24) <= 3) {
									$("#selectOilView").append("<tr>"
											+ "<td>"
											+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
											+ "</td>"
											+ "<td>"
											+ data[i].oilListType
											+ "</td>"
											+ "<td>"
											+ "+" + data[i].oil + "L"
											+ "<td>"
											+ "</tr>");
								} else {
									$("#selectOilView").append("<tr>"
											+ "<td>"
											+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
											+ "</td>"
											+ "<td>"
											+ data[i].oilListType
											+ "</td>"
											+ "<td>"
											+ "+" + data[i].oil + "L"

											+ "<td>"
											+ "</tr>");
								}
								
								
							} else {
								$("#selectOilView").append("<tr>"
										+ "<td>"
										+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
										+ "</td>"
										+ "<td>"
										+ data[i].oilListType
										+ "</td>"
										+ "<td>"
										+ "-" + data[i].oil + "L"
										+ "<td>"
										+ "</tr>");
							}

						}
					} else if (selectedListInfo == '사용'){
						$("#selectOilView").html("");
						
						$("#listRefundBtn").css("display", "none");
						$("#listBtn").css("display", "inline-block");
						
						$("#selectOilView").append("<tr>"
														+ "<th>"
														+ "날짜"
														+ "</th>"
														+ "<th>"
														+ "분류"
														+ "</th>"
														+ "<th>"
														+ "주차장 명"
														+ "</th>"
														+ "<th>"
														+ "오일"
														+ "</th>"
												+ "</tr>");
						for (var i = 0; i < data.length; i++) {
							if (data[i].oilListType == '예약취소') {
								$("#selectOilView").append("<tr>"
																+ "<td>"
																+ (new Date(data[i].oilListDate).getYear() - 100) + "년<br>" + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
																+ "</td>"
																+ "<td>"
																+ data[i].oilListType
																+ "</td>"
																+ "<td>"
																+ data[i].parkingName
																+ "</td>"
																+ "<td>"
																+ "+" + data[i].oil + "L"
																+ "<td>"
																+ "</tr>");
							} else {
								$("#selectOilView").append("<tr>"
																+ "<td>"
																+ (new Date(data[i].oilListDate).getYear() - 100) + "년<br>" + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
																+ "</td>"
																+ "<td>"
																+ data[i].oilListType
																+ "</td>"
																+ "<td>"
																+ data[i].parkingName
																+ "</td>"
																+ "<td>"
																+ "-" + data[i].oil + "L"
																+ "<td>"
																+ "</tr>");
							}
						}
					} else { // 환불일 때
						$("#selectOilView").html("");
						
						$("#listRefundBtn").css("display", "inline-block");
						$("#listBtn").css("display", "none");
						
						$("#selectOilView").append("<tr>"
													+ "<th>"
													+ "날짜"
													+ "</th>"
													+ "<th>"
													+ "분류"
													+ "</th>"
													+ "<th>"
													+ "오일"
													+ "</th>"
												+ "</tr>");
						for (var i = 0; i < data.length; i++) {
							$("#selectOilView").append("<tr>"
									+ "<td>"
									+ (new Date(data[i].oilListDate).getYear() - 100) + "년 " + (new Date(data[i].oilListDate).getMonth() + 1) + "월 " + new Date(data[i].oilListDate).getDate() + "일"
									+ "</td>"
									+ "<td>"
									+ data[i].oilListType
									+ "</td>"
									+ "<td>"
									+ data[i].oil + "L"
									+ "<td>"
									+ "</tr>");
						}
					}
					// 페이징 Ajax
					$.ajax({
						url:"searchOilListPI.cu",
						type:"post",
						data:{startTime:startTime, endTime:endTime, selectedListInfo:selectedListInfo, memberNo:memberNo, pageNo:pageNo},
						success:function(data){
							$("#pagingArea").html("");
							if (data.currentPage <= 1) {
								
							} else if (data.currentPage > 1) {
								$("#pagingArea").append("<a onclick='searchList(" + (data.currentPage - 1) + ")'>[이전]</a> &nbsp; &nbsp;");
							}
							
							
							
							for (var i = data.startPage; i <= data.endPage; i++) {
								if (data.currentPage == i) {
									$("#pagingArea").append("<font color='white' size='4'><b>" + i + "</b></font> &nbsp; &nbsp;");
								} else {
									$("#pagingArea").append("<a onclick='searchList(" + i + ")'>" + i + "</a> &nbsp; &nbsp;");
								}
							}
							
							
							if (data.currentPage >= data.maxPage) {
								
							} else if (data.currentPage < data.maxPage) {
								$("#pagingArea").append("<a onclick='searchList(" + (data.currentPage + 1) + ")'>[다음]</a>");
							}
						},
						error:function(status){
							console.log(status);
						}
					});
				},
				error:function(status){
					console.log(status);
				}
			});
		}

	}
	
	function compareTime(start, end) {
		if (splitTime(start) < splitTime(end)) {
			return true;
		} else {
			return false
		}

	}
	
	function splitTime(time) {
		var temp = time.split(" ");
		var result;
		
		if (Number(temp[1].split("월")[0]) >= 10) {
			if (Number(temp[2].split("일")[0]) >= 10) {
				result = "" + temp[0].split("년")[0] + Number(temp[1].split("월")[0]) + Number(temp[2].split("일")[0]);
			} else {
				result = temp[0].split("년")[0] + Number(temp[1].split("월")[0]) + "0" + Number(temp[2].split("일")[0]);
			}
		} else {
			if (Number(temp[2].split("일")[0]) >= 10) {
				result = temp[0].split("년")[0] + "0" + Number(temp[1].split("월")[0]) + Number(temp[2].split("일")[0]);
			} else {
				result = temp[0].split("년")[0] + "0" + Number(temp[1].split("월")[0]) + "0" + Number(temp[2].split("일")[0]);
			}
		}
		
		return result;
	}
	
</script>
<script type="text/javascript">
	// 환불 신청
	function refundNo(memberNo, possesOil) {
		$("#ShowRefundModal").html("");
		var refundOil = selectedOil;
		if (possesOil > refundOil && refundOil > 0) {
			$("#ShowRefundModal").append("<tr><td align='center' colspan='2'>"
									+ "포인트를 " + possesOil + "L 가지고 있습니다.<br>"
									+ "환불할 포인트는 " + refundOil +" 입니다.<br>"
									+ "아래 내용을 입력하고 신청하기를 눌러주세요!</td></tr>"
									+ "<tr align='center'><td colspan='2'>※잘못된 계좌를 입력하여 발생한<br>문제는 관리자에게 연락바랍니다.</td></tr>"
									+ "<tr><td align='center'><div style='color: white;'>예금주</div></td>"
									+ "<td><input type='text' placeholder='예금주 명' class='form-control form-control-success' style='width: 150px;' id='accountHolder'/></td></tr>"
									+ "<tr><td align='center'><div style='color: white;'>환전 오일</div></td>"
									+ "<td><input type='number' value='" + refundOil + "' readonly class='form-control form-control-success' style='width: 150px;' id='ApplicationOil'/></td>"
									+ "<tr><td align='center'><div style='color: white;'>은행</div></td>"
									+ "<td><select class='custom-select nav-link dropdown-toggle' style='width: 150px;' id='selectionBank'>"
									+ "<option value='국민' style='color: black;' selected>국민</option>"
									+ "<option value='신한' style='color: black;'>신한</option>"
									+ "<option value='농협' style='color: black;'>농협</option>"
									+ "<option value='우리' style='color: black;'>우리</option>"
									+ "</select></td></tr>"
									+ "<tr><td align='center'><div style='color: white;'>계좌번호</div></td>"
									+ "<td><input type='text' placeholder='계좌번호' class='form-control form-control-success' style='width: 150px;' id='accountNumber'/></td></tr>"
									+ "<br>"
									+ "<tr><td align='center' colspan='2'>"
									+ "<button type='button' class='btn btn-default' data-dismiss='modal' onclick=''>취소</button>"
									+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
									+ "<button type='button' class='btn btn-default' data-dismiss='modal' onclick='requestRefund(" + memberNo + ", " + refundOil + ")'>환불 신청</button>"
									+ "</td></tr>");
		} else if (refundOil == 0) {
			alert("환불할 오일을 선택해주세요!")
		} else {
			$("#ShowRefundModal").append("<tr><td align='center'><br><br>"
									+ "현재 포인트가 " + possesOil + "L 이므로 환불이 불가능합니다.<br>"
									+ "환불에 필요한 포인트는 " + refundOil +" 입니다.<br><br>"
									+ "<br></td></tr>"
									+ "<tr><td align='center'>"
									+ "<button type='button' class='btn btn-default' data-dismiss='modal' onclick=''>닫기</button>"
									+ "</td></tr>");
		}
		
	}
	function requestRefund(memberNo, refundOil) {
		var accountHolder = $("#accountHolder").val();
		var Application_bank = $("#selectionBank").val();
		var application_account_number = $("#accountNumber").val();
		
		if (accountHolder == "" || Application_bank == "" || application_account_number == "") {
			alert("값을 전부 입력해주세요!");
		} else {
			$.ajax({
				url:"requestRefund.cu",
				type:"post",
				data:{memberNo:memberNo, refundOil:refundOil, accountHolder:accountHolder, Application_bank:Application_bank, application_account_number:application_account_number},
				success:function(data){
					if (data > 0) {
						$("#clickRefundResult").click();
					} else {
						alert("신청 실패! 관리자에게 문의하세요...")
					}
					
				},
				error:function(status){
					console.log(status);
				}
			});
		}
		
		
		
	}
	
</script>

<c:if test="${ !empty loginUser }">
<script type="text/javascript">
	searchList(1);
</script>
</c:if>

</html>