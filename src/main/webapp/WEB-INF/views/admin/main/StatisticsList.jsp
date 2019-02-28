<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="../../common/bootInfo.jsp"></jsp:include>
</head>
<body>

	<c:if test="${not empty sessionScope.loginUser and loginUser.member_type=='A'}">
		<div class="wrapper">
			<div class="sidebar" style="background: rgb(49, 49, 49) !important;">
				<!-- sidebar_admin -->
				<jsp:include page="../../common/sidebar_admin.jsp"></jsp:include>
				<!-- END sidebar_admin -->
	
				<!-- 그래프 시작 -->
				<div class="content">
					<div class="row">
						<div class="col-lg-6">
							<div class="card card-chart">
								<div class="card-header">
									<h5> - 사용자 회원가입 현황 (전체 : ${customerListCount}명)</h5>
									<h3 class="card-title">
										<i class="tim-icons icon-send" style="color: #39acf4"></i>
										<p id="ajaxGraph1" style="display: inline-block;"></p>
									</h3>
									<div align="right">
										<button id="selectCustomerSignUpMonthBtn" onclick="selectCustomerSignUpMonth();" class="btn btn-default animation-on-hover btn-sm">월별</button>				
										<button id="selectCustomerSignUp7DaysBtn" onclick="selectCustomerSignUp7Days();" class="btn btn-default animation-on-hover btn-sm">최근 7일</button>				
									</div>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="selectCustomerSignUpMonth"></canvas>
										<canvas id="selectCustomerSignUp7Days"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card card-chart">
								<div class="card-header">
									<h5> - 사업자 회원가입 현황 (전체 : ${ceoListCount}명)</h5>
									<h3 class="card-title">
										<i class="tim-icons icon-attach-87" style="color: #ff7373"></i>
										<p id="ajaxGraph2" style="display: inline-block;"></p>
									</h3>
									<div align="right">
										<button id="selectCEOSignUpMonthBtn" onclick="selectCEOSignUpMonth();" class="btn btn-default animation-on-hover btn-sm">월별</button>				
										<button id="selectCEOSignUp7DaysBtn" onclick="selectCEOSignUp7Days();" class="btn btn-default animation-on-hover btn-sm">최근 7일</button>				
									</div>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="selectCEOSignUpMonth"></canvas>
										<canvas id="selectCEOSignUp7Days"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card card-chart">
								<div class="card-header">
									<h5> - 게시판 등록 수 (관리자문의 : ${boardAdminListCount}건 / 사업자문의: ${boardCeoListCount}건 / 후기: ${boardReplyListCount}건)</h5>
									<h3 class="card-title">
										<i class="tim-icons icon-bell-55" style="color: #39acf4"></i>
										<p id="ajaxGraph3" style="display: inline-block;"></p>
									</h3>
									<div align="right">		
										<button id="selectBoardAdminMonthBtn" onclick="selectBoardAdminMonth();" class="btn btn-default animation-on-hover btn-sm">관리자문의(월별)</button>				
										<button id="selectBoardAdmin7DaysBtn" onclick="selectBoardAdmin7Days();" class="btn btn-default animation-on-hover btn-sm">관리자문의(최근 7일)</button>	
										<button id="selectBoardReplyMonthBtn" onclick="selectBoardReplyMonth();" class="btn btn-default animation-on-hover btn-sm" style="width: 26%">후기(월별)</button>	
										<button id="selectBoardCeoMonthBtn" onclick="selectBoardCeoMonth();" class="btn btn-default animation-on-hover btn-sm">사업자문의(월별)</button>				
										<button id="selectBoardCeo7DaysBtn" onclick="selectBoardCeo7Days();" class="btn btn-default animation-on-hover btn-sm">사업자문의(최근 7일)</button>		
										<button id="selectBoardReply7DaysBtn" onclick="selectBoardReply7Days();" class="btn btn-default animation-on-hover btn-sm">후기(최근 7일)</button>				
									</div>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="selectBoardAdminMonth"></canvas>
										<canvas id="selectBoardAdmin7Days"></canvas>
										<canvas id="selectBoardReplyMonth"></canvas>
										<canvas id="selectBoardCeoMonth"></canvas>
										<canvas id="selectBoardCeo7Days"></canvas>
										<canvas id="selectBoardReply7Days"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card card-chart">
								<div class="card-header">
									<h5> - 회원 주차장 예약 건수</h5>
									<h3 class="card-title">
										<i class="tim-icons icon-support-17" style="color: #ff7373"></i> 
										<p id="ajaxGraph4" style="display: inline-block;"></p>
									</h3>
									<div align="right">
										<button id="Btn" onclick="" class="btn btn-default animation-on-hover btn-sm">월별</button>		
										<button id="Btn" onclick="" class="btn btn-default animation-on-hover btn-sm">최근 7일</button>	
									</div>
									<div>&nbsp;</div>
									<div>&nbsp;</div>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="chartLinePurple"></canvas>
	<%-- 									<canvas id="lineChartExample2"></canvas> --%>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card card-chart">
								<div class="card-header">
									<h5> - 환전</h5>
									<h3 class="card-title">
										<i class="tim-icons icon-planet" style="color: #39acf4"></i>
										<p id="ajaxGraph5" style="display: inline-block;"></p>
									</h3>
									<div align="right">
										<button id="selectStatisticsMonth2Btn" onclick="selectStatisticsMonth2();" class="btn btn-default animation-on-hover btn-sm">월별</button>				
										<button id="selectStatistics7Days2Btn" onclick="selectStatistics7Days2();" class="btn btn-default animation-on-hover btn-sm">최근 7일</button>				
										<button id="selectStatisticsToday2Btn" onclick="selectStatisticsToday2();" class="btn btn-default animation-on-hover btn-sm">최근 24시간</button>				
									</div>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="selectStatisticsMonth2"></canvas>
										<canvas id="selectStatistics7Days2"></canvas>
										<canvas id="selectStatisticsToday2"></canvas>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="card card-chart">
								<div class="card-header">
									<h5> - 매출</h5>
									<h3 class="card-title">
										<i class="tim-icons icon-spaceship" style="color: #ff7373;"></i>
										<p id="ajaxGraph6" style="display: inline-block;"></p>
									</h3>
									<div align="right">
										<button id="selectStatisticsMonthBtn" onclick="selectStatisticsMonth();" class="btn btn-default animation-on-hover btn-sm">월별</button>				
										<button id="selectStatistics7DaysBtn" onclick="selectStatistics7Days();" class="btn btn-default animation-on-hover btn-sm">최근 7일</button>				
										<button id="selectStatisticsTodayBtn" onclick="selectStatisticsToday();" class="btn btn-default animation-on-hover btn-sm">최근 24시간</button>		
									</div>
								</div>
								<div class="card-body">
									<div class="chart-area">
										<canvas id="selectStatisticsMonth"></canvas>
										<canvas id="selectStatistics7Days"></canvas>
										<canvas id="selectStatisticsToday"></canvas>
									</div>
								</div>
							</div>
						</div>
						<!-- 그래프 끝 -->
						
						<!-- 테이블 시작 -->					
						<div class="col-md-12">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">오늘 현황</h4>
									<h6 class="card-title">( 리스트 클릭으로 페이지 이동 )</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table align="center" class="table tablesorter " id="" style="width: 60%;">
											<thead class=" text-primary">
												<tr>
													<th style="font-size: 18px;" class="text-center">번호</th>
													<th style="font-size: 18px;">구분</th>
													<th style="font-size: 18px;">내용</th>
													<th style="font-size: 18px;" class="text-center">건수</th>
												</tr>
											</thead>
											<tbody>
												<tr class="todayTable">
													<td class="text-center">1</td>
													<td>신청</td>
													<td>오늘 환불신청 건수</td>
													<td class="text-center">${requestRefund}건</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">2</td>
													<td>신청</td>
													<td>오늘 환전신청 건수</td>
													<td class="text-center">${requestExchange}건</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">3</td>
													<td>신청</td>
													<td>오늘 주차장 신청 수</td>
													<td class="text-center">${requestParkingLot}건</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">4</td>
													<td>회원가입</td>
													<td>오늘 사용자 회원가입 수 </td>
													<td class="text-center">${todayCeoList}명</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">5</td>
													<td>회원가입</td>
													<td>오늘 사업자 회원가입 수 </td>
													<td class="text-center">${todayCustomerList}명</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">6</td>
													<td>게시판</td>
													<td>오늘 관리자문의 게시판 등록 수</td>
													<td class="text-center">${todayBoardCeo}건</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">7</td>
													<td>게시판</td>
													<td>오늘 사업자문의 게시판 등록 수</td>
													<td class="text-center">${todayBoardAdmin}건</td>
												</tr>
												<tr class="todayTable">
													<td class="text-center">8</td>
													<td>매출</td>
													<td>오늘 충전 금액</td>
													<td class="text-center">${profit}원</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- 테이블 끝 -->					
					</div>
				</div>
	
				<!-- footer_admin -->
				<jsp:include page="../../common/footer_admin.jsp"></jsp:include>
				<!-- END footer_admin -->
			</div>
		</div>
	</c:if>
	
	<!-- 오늘 현황 테이블 페이지 이동 -->
	<script>
		var d = new Date();
		var today = d.getFullYear() + '-' + ('0' + (d.getMonth() + 1)).slice(-2) + '-' + ('0' + (d.getDate())).slice(-2);
		console.log(today);
	
		$(".todayTable").mouseenter(function () {
			$(this).children().css({"background":"rgb(28, 28, 38)", "cursor":"pointer"});	
			no = $(this).children().eq(0).text();	
		}).mouseout(function () {	
			$(this).children().css({"background":"rgb(39, 41, 61)"});	
		}).click(function () {
			for (var i = 0; i < $(".todayTable").length; i++) {
				$(".todayTable").eq(i).children().css({"background":"rgb(39, 41, 61)"});	
			}
			$(this).children().css({"background":"rgb(0, 0, 0)"});	
			if(no==1){	
				location.href="selectSearchExchangeList.ad?currentPage=1&status=R&memberId=&memberType=&today=&startDate="+today+"&endDate="+today;			
			}else if(no==2){
				location.href="selectSearchExchangeList.ad?currentPage=1&status=E&memberId=&memberType=&today=&startDate="+today+"&endDate="+today;		
			}else if(no==3){
				location.href="selectSearchParkingLotList.ad?currentPage=1&parkingListStatus=I&memberId=&parkingAddress=&parkingListName=&today=&startDate="+today+"&endDate="+today;		
			}else if(no==4){
				location.href="selectCustomerList.ad?currentPage=1&memberId=&today=&startDate="+today+"&endDate="+today;
			}else if(no==5){
				location.href="selectSearchCEOList.ad?currentPage=1&selectStatus=A&memberId=&today=&startDate="+today+"&endDate="+today;
			}else if(no==6){
				location.href="selectSearchBoardQnAList.ad?currentPage=2&selectStatus=A&mId=&bTitle=&today=&startDate="+today+"&endDate="+today;
			}else if(no==7){
				location.href="selectBoardQnA.ad";
			}else if(no==8){
				location.href="selectStatisticsCustomer.ad?currentPage=1&selectStatus=A&memberId=&startMoney=0&endMoney=&today=&startDate="+today+"&endDate="+today;
			}
		});	
	</script>
	<!-- 오늘 현황 테이블 페이지 이동 끝 -->
	
	<!-- 111111111111111111111111 사용자 회원가입 현황 1111111111111111111111111111111 -->	
	<!-- 메인 사용자 회원가입 -->
	<script>
		$(function () {

			$.ajax({
				url:"selectCustomerSignUpMonth.ad",
				type:"get",
				success:function(data){
					$("#selectCustomerSignUpMonth").show();
					$("#selectCustomerSignUp7Days").hide();
					
					$("#ajaxGraph1").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph1").append('<div align="left">올해 사용자 회원가입 수 : '+sum+'명</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectCustomerSignUpMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "인원:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		});
	</script>
	<!-- 메인 사용자 회원가입 끝 -->
	
	<!-- 사용자 회원가입 올해 -->
	<script>
		function selectCustomerSignUpMonth() {

			$.ajax({
				url:"selectCustomerSignUpMonth.ad",
				type:"get",
				success:function(data){
					$("#selectCustomerSignUpMonth").show();
					$("#selectCustomerSignUp7Days").hide();
					$("#selectCustomerSignUpMonthBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectCustomerSignUp7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph1").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph1").append('<div align="left">올해 사용자 회원가입 수 : '+sum+'명</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectCustomerSignUpMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "인원:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 사용자 회원가입 올해 끝 -->
	
	<!-- 사용자 회원가입 최근 7일 -->	
	<script>
		function selectCustomerSignUp7Days() {

			$.ajax({
				url:"selectCustomerSignUp7Days.ad",
				type:"get",
				success:function(data){
					$("#selectCustomerSignUpMonth").hide();
					$("#selectCustomerSignUp7Days").show();
					$("#selectCustomerSignUpMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectCustomerSignUp7DaysBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					
					$("#ajaxGraph1").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph1").append('<div align="left">최근 7일 사용자 회원가입 수 : '+sum+'명</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectCustomerSignUp7Days").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "인원:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 사용자 회원가입 최근 7일 끝 -->
	<!-- 111111111111111111111111 사용자 회원가입 현황 끝 1111111111111111111111111111111 -->	
	
	<!-- 222222222222222222222222 사업자 회원가입 현황 22222222222222222222222222222222 -->	
	<!-- 메인 사업자 회원가입 -->
	<script>
		$(function () {

			$.ajax({
				url:"selectCEOSignUpMonth.ad",
				type:"get",
				success:function(data){
					$("#selectCEOSignUpMonth").show();
					$("#selectCEOSignUp7Days").hide();
					
					$("#ajaxGraph2").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph2").append('<div align="left">올해 사업자 회원가입 수 : '+sum+'명</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectCEOSignUpMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "인원:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		});
	</script>
	<!-- 메인 사업자 회원가입 끝 -->
	
	<!-- 사업자 회원가입 올해 -->
	<script>
		function selectCEOSignUpMonth() {

			$.ajax({
				url:"selectCEOSignUpMonth.ad",
				type:"get",
				success:function(data){
					$("#selectCEOSignUpMonth").show();
					$("#selectCEOSignUp7Days").hide();
					$("#selectCEOSignUpMonthBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectCEOSignUp7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph2").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph2").append('<div align="left">올해 사업자 회원가입 수 : '+sum+'명</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectCEOSignUpMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "인원:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 사업자 회원가입 올해 끝 -->
	
	<!-- 사업자 회원가입 최근 7일 -->	
	<script>
		function selectCEOSignUp7Days() {

			$.ajax({
				url:"selectCEOSignUp7Days.ad",
				type:"get",
				success:function(data){
					$("#selectCEOSignUpMonth").hide();
					$("#selectCEOSignUp7Days").show();
					$("#selectCEOSignUpMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectCEOSignUp7DaysBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					
					$("#ajaxGraph2").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph2").append('<div align="left">최근 7일 사업자 회원가입 수 : '+sum+'명</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectCEOSignUp7Days").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "인원:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 사업자 회원가입 최근 7일 끝 -->
	<!-- 222222222222222222222222 사업자 회원가입 현황 끝 22222222222222222222222222222222 -->	
	
	<!-- 3333333333333333333333333333 게시판 등록 수 333333333333333333333333333333333 -->	
	<!-- 메인 관리자문의 올해 -->
	<script>
		$(function () {

			$.ajax({
				url:"selectBoardAdminMonth.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").show();
					$("#selectBoardAdmin7Days").hide();
					$("#selectBoardReplyMonth").hide();
					$("#selectBoardCeoMonth").hide();
					$("#selectBoardCeo7Days").hide();
					$("#selectBoardReply7Days").hide();
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph3").append('<div align="left">올해 관리자문의 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardAdminMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		});
	</script>
	<!-- 메인 관리자문의 올해 끝 -->
	
	<!-- 관리자 문의 올해 -->
	<script>
		function selectBoardAdminMonth() {

			$.ajax({
				url:"selectBoardAdminMonth.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").show();
					$("#selectBoardAdmin7Days").hide();
					$("#selectBoardReplyMonth").hide();
					$("#selectBoardCeoMonth").hide();
					$("#selectBoardCeo7Days").hide();
					$("#selectBoardReply7Days").hide();
					
					$("#selectBoardAdminMonthBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectBoardAdmin7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReplyMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeoMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeo7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReply7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph3").append('<div align="left">올해 관리자문의 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardAdminMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 관리자문의 올해 끝 -->
	
	<!-- 관리자문의 최근 7일 -->	
	<script>
		function selectBoardAdmin7Days() {

			$.ajax({
				url:"selectBoardAdmin7Days.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").hide();
					$("#selectBoardAdmin7Days").show();
					$("#selectBoardReplyMonth").hide();
					$("#selectBoardCeoMonth").hide();
					$("#selectBoardCeo7Days").hide();
					$("#selectBoardReply7Days").hide();
					
					$("#selectBoardAdminMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardAdmin7DaysBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectBoardReplyMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeoMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeo7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReply7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph3").append('<div align="left">최근 7일 관리자문의 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardAdmin7Days").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 관리자문의 최근 7일 끝 -->
		
	<!-- 사업자 문의 올해 -->
	<script>
		function selectBoardCeoMonth() {

			$.ajax({
				url:"selectBoardCeoMonth.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").hide();
					$("#selectBoardAdmin7Days").hide();
					$("#selectBoardReplyMonth").hide();
					$("#selectBoardCeoMonth").show();
					$("#selectBoardCeo7Days").hide();
					$("#selectBoardReply7Days").hide();
					
					$("#selectBoardAdminMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardAdmin7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReplyMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeoMonthBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectBoardCeo7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReply7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph3").append('<div align="left">올해 사업자문의 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardCeoMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 사업자문의 올해 끝 -->
	
	<!-- 사업자문의 최근 7일 -->	
	<script>
		function selectBoardCeo7Days() {

			$.ajax({
				url:"selectBoardCeo7Days.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").hide();
					$("#selectBoardAdmin7Days").hide();
					$("#selectBoardReplyMonth").hide();
					$("#selectBoardCeoMonth").hide();
					$("#selectBoardCeo7Days").show();
					$("#selectBoardReply7Days").hide();
					
					$("#selectBoardAdminMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardAdmin7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReplyMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeoMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeo7DaysBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectBoardReply7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph3").append('<div align="left">최근 7일 사업자문의 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardCeo7Days").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 사업자문의 최근 7일 끝 -->
	
	
	<!-- 후기 문의 올해 -->
	<script>
		function selectBoardReplyMonth() {

			$.ajax({
				url:"selectBoardReplyMonth.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").hide();
					$("#selectBoardAdmin7Days").hide();
					$("#selectBoardReplyMonth").show();
					$("#selectBoardCeoMonth").hide();
					$("#selectBoardCeo7Days").hide();
					$("#selectBoardReply7Days").hide();
					
					$("#selectBoardAdminMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardAdmin7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReplyMonthBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectBoardCeoMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeo7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReply7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph3").append('<div align="left">올해 후기 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardReplyMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 후기 올해 끝 -->
	
	<!-- 후기 최근 7일 -->	
	<script>
		function selectBoardReply7Days() {

			$.ajax({
				url:"selectBoardReply7Days.ad",
				type:"get",
				success:function(data){
					$("#selectBoardAdminMonth").hide();
					$("#selectBoardAdmin7Days").hide();
					$("#selectBoardReplyMonth").hide();
					$("#selectBoardCeoMonth").hide();
					$("#selectBoardCeo7Days").hide();
					$("#selectBoardReply7Days").show();
					
					$("#selectBoardAdminMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardAdmin7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReplyMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeoMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardCeo7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectBoardReply7DaysBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					
					$("#ajaxGraph3").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph3").append('<div align="left">최근 7일 후기 : '+sum+'건</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
// 								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 0,
										suggestedMax : 10,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectBoardReply7Days").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "건수:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 후기 최근 7일 끝 -->
	<!-- 3333333333333333333333333333 게시판 등록 수 끝 333333333333333333333333333333333 -->	
	
	<!-- 444444444444444444444444 회원 주차장 예약 건수 444444444444444444444444444444444 -->	
	<script>
		$(function () {
			
		});
	</script>
	<!-- 444444444444444444444444 회원 주차장 예약 건수 끝 444444444444444444444444444444444 -->	
	
	<!-- 55555555555555555555555555555555 환전 5555555555555555555555555555555555 -->	
	<!-- 메인 환전 통계 -->
	<script>
		$(function () {

			$.ajax({
				url:"selectStatisticsMonth2.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth2").show();
					$("#selectStatistics7Days2").hide();
					$("#selectStatisticsToday2").hide();
					
					$("#ajaxGraph5").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph5").append('<div align="left">올해 환전 금액 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatisticsMonth2").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		});
	</script>
	<!-- 메인 환전 통계 끝 -->
	
	<!-- 통계 그래프 (월별) -->
	<script>
		function selectStatisticsMonth2() {
			$.ajax({
				url:"selectStatisticsMonth2.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth2").show();
					$("#selectStatistics7Days2").hide();
					$("#selectStatisticsToday2").hide();
					
					$("#selectStatisticsMonth2Btn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectStatistics7Days2Btn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatisticsToday2Btn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph5").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph5").append('<div align="left">올해 환전 금액 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatisticsMonth2").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 통계 그래프 (월별) 끝 -->

	<!-- 통계 그래프 (최근 7일) -->
	<script>
		function selectStatistics7Days2() {
			$.ajax({
				url:"selectStatistics7Day2.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth2").hide();
					$("#selectStatistics7Days2").show();
					$("#selectStatisticsToday2").hide();
					
					$("#selectStatisticsMonth2Btn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatistics7Days2Btn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectStatisticsToday2Btn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph5").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph5").append('<div align="left">최근 7일 환전 금액 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatistics7Days2").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 통계 그래프 (최근 7일) 끝 -->
	
	<!-- 통계 그래프 (최근 24시간) -->
	<script>
		function selectStatisticsToday2() {
			$.ajax({
				url:"selectStatisticsToday2.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth2").hide();
					$("#selectStatistics7Days2").hide();
					$("#selectStatisticsToday2").show();
					
					$("#selectStatisticsMonth2Btn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatistics7Days2Btn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatisticsToday2Btn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					
					$("#ajaxGraph5").empty();
					var sum = parseInt(data.time01) +  parseInt(data.time07) +  parseInt(data.time13) +  parseInt(data.time19) + 
									parseInt(data.time02) +  parseInt(data.time08) +  parseInt(data.time14) +  parseInt(data.time20) + 
									parseInt(data.time03) +  parseInt(data.time09) +  parseInt(data.time15) +  parseInt(data.time21) + 
									parseInt(data.time04) +  parseInt(data.time10) +  parseInt(data.time16) +  parseInt(data.time22) + 
									parseInt(data.time05) +  parseInt(data.time11) +  parseInt(data.time17) +  parseInt(data.time23) + 
									parseInt(data.time06) +  parseInt(data.time12) +  parseInt(data.time18) +  parseInt(data.time24)
					$("#ajaxGraph5").append('<div align="left">최근 24시간 환전 금액 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatisticsToday2").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.time01, data.time02, data.time03, data.time04, data.time05, data.time06, 
												data.time07, data.time08, data.time09, data.time10, data.time11, data.time12, 
												data.time13, data.time14, data.time15, data.time16, data.time17, data.time18, 
												data.time19, data.time20, data.time21, data.time22, data.time23, data.time24];
						
						var data = {
							labels : [ '1시간전', '2시간전', '3시간전', '4시간전', '5시간전', '6시간전',
										 '7시간전', '8시간전', '9시간전', '10시간전', '11시간전', '12시간전',
										 '13시간전', '14시간전', '15시간전', '16시간전', '17시간전', '18시간전',
										 '19시간전', '20시간전', '21시간전', '22시간전', '23시간전', '24시간전'],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#39acf4',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#39acf4',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#39acf4',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 통계 그래프 (최근 24시간) 끝 -->
	<!-- 55555555555555555555555555555555 환전 끝 5555555555555555555555555555555555 -->	
	
	<!-- 666666666666666666666666666666 환불 6666666666666666666666666666666666 -->
	<!-- 메인 환불 통계 -->
	<script>
		$(function () {
			$.ajax({
				url:"selectStatisticsMonth.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth").show();
					$("#selectStatistics7Days").hide();
					$("#selectStatisticsToday").hide();
					
					$("#ajaxGraph6").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph6").append('<div align="left">올해 매출 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatisticsMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		});
	</script>
	<!-- 메인 환불 통계 끝 -->
		
	<!-- 통계 그래프 (월별) -->
	<script>
		function selectStatisticsMonth() {
			$.ajax({
				url:"selectStatisticsMonth.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth").show();
					$("#selectStatistics7Days").hide();
					$("#selectStatisticsToday").hide();
					
					$("#selectStatisticsMonthBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectStatistics7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatisticsTodayBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph6").empty();
					var sum = parseInt(data.jan) + parseInt(data.feb) + parseInt(data.mar)
								+ parseInt(data.apr) + parseInt(data.may) + parseInt(data.jun) 
								+ parseInt(data.jul) + parseInt(data.aug) +parseInt(data.sep)
								+ parseInt(data.oct) + parseInt(data.nov) + parseInt(data.dec)
					$("#ajaxGraph6").append('<div align="left">올해 매출 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatisticsMonth").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.jan, data.feb, data.mar, data.apr,
												data.may, data.jun, data.jul, data.aug,
												data.sep, data.oct, data.nov, data.dec];
						
						var data = {
							labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
									'10월', '11월', '12월' ],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 통계 그래프 (월별) 끝 -->

	<!-- 통계 그래프 (최근 7일) -->
	<script>
		function selectStatistics7Days() {
			$.ajax({
				url:"selectStatistics7Day.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth").hide();
					$("#selectStatistics7Days").show();
					$("#selectStatisticsToday").hide();
					
					$("#selectStatisticsMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatistics7DaysBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#selectStatisticsTodayBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					
					$("#ajaxGraph6").empty();
					var sum = parseInt(data.dayZero) + parseInt(data.dayOne) + parseInt(data.dayTwo)
					+ parseInt(data.dayThree) + parseInt(data.dayFour) + parseInt(data.dayFive) 
					+ parseInt(data.daySix) + parseInt(data.daySeven)
					$("#ajaxGraph6").append('<div align="left">최근 7일 매출 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatistics7Days").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.dayZero, data.dayOne, data.dayTwo, data.dayThree,
												data.dayFour, data.dayFive, data.daySix, data.daySeven];
						
						var data = {
							labels : [ '오늘', '1일전', '2일전', '3일전', '4일전', '5일전', '6일전', '7일전'],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 통계 그래프 (최근 7일) 끝 -->
	
	<!-- 통계 그래프 (최근 24시간) -->
	<script>
		function selectStatisticsToday() {
			$.ajax({
				url:"selectStatisticsToday.ad",
				type:"get",
				success:function(data){
					$("#selectStatisticsMonth").hide();
					$("#selectStatistics7Days").hide();
					$("#selectStatisticsToday").show();
					
					$("#selectStatisticsMonthBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatistics7DaysBtn").attr("class", "btn btn-defalut animation-on-hover btn-sm");
					$("#selectStatisticsTodayBtn").attr("class", "btn btn-warning animation-on-hover btn-sm");
					
					$("#ajaxGraph6").empty();
					var sum = parseInt(data.time01) +  parseInt(data.time07) +  parseInt(data.time13) +  parseInt(data.time19) + 
									parseInt(data.time02) +  parseInt(data.time08) +  parseInt(data.time14) +  parseInt(data.time20) + 
									parseInt(data.time03) +  parseInt(data.time09) +  parseInt(data.time15) +  parseInt(data.time21) + 
									parseInt(data.time04) +  parseInt(data.time10) +  parseInt(data.time16) +  parseInt(data.time22) + 
									parseInt(data.time05) +  parseInt(data.time11) +  parseInt(data.time17) +  parseInt(data.time23) + 
									parseInt(data.time06) +  parseInt(data.time12) +  parseInt(data.time18) +  parseInt(data.time24)
					$("#ajaxGraph6").append('<div align="left">최근 24시간 매출 : '+sum+'원</div>');
					
					gradientChartOptionsConfiguration = {
							maintainAspectRatio : false,
							legend : {
								display : false
							},
				
							tooltips : {
								backgroundColor : '#fff',
								titleFontColor : '#333',
								bodyFontColor : '#666',
								bodySpacing : 4,
								xPadding : 12,
								mode : "nearest",
								intersect : 0,
								position : "nearest"
							},
							responsive : true,
							scales : {
								yAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(29,140,248,0.0)',
										zeroLineColor : "transparent",
									},
									ticks : {
										suggestedMin : 50,
										suggestedMax : 110,	// y축
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ],
				
								xAxes : [ {
									barPercentage : 1.6,
									gridLines : {
										drawBorder : false,
										color : 'rgba(220,53,69,0.1)',
										zeroLineColor : "transparent",
									},
									ticks : {
										padding : 20,
										fontColor : "#9a9a9a"
									}
								} ]
							}
						};
				
						var ctx = document.getElementById("selectStatisticsToday").getContext("2d");
				
						var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
				
						gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
						gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
						gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
				
						var chartData = [data.time01, data.time02, data.time03, data.time04, data.time05, data.time06, 
												data.time07, data.time08, data.time09, data.time10, data.time11, data.time12, 
												data.time13, data.time14, data.time15, data.time16, data.time17, data.time18, 
												data.time19, data.time20, data.time21, data.time22, data.time23, data.time24];
						
						var data = {
							labels : [ '1시간전', '2시간전', '3시간전', '4시간전', '5시간전', '6시간전',
										 '7시간전', '8시간전', '9시간전', '10시간전', '11시간전', '12시간전',
										 '13시간전', '14시간전', '15시간전', '16시간전', '17시간전', '18시간전',
										 '19시간전', '20시간전', '21시간전', '22시간전', '23시간전', '24시간전'],
							datasets : [ {
								label : "매출:",
								fill : true,
								backgroundColor : gradientStroke,
								borderColor : '#ff7373',
								borderWidth : 2,
								borderDash : [],
								borderDashOffset : 0.0,
								pointBackgroundColor : '#ff7373',
								pointBorderColor : 'rgba(255,255,255,0)',
								pointHoverBackgroundColor : '#ff7373',
								pointBorderWidth : 20,
								pointHoverRadius : 4,
								pointHoverBorderWidth : 15,
								pointRadius : 4,
								data : chartData
							} ]
						};
				
						var myChart = new Chart(ctx, {
							type : 'line',
							data : data,
							options : gradientChartOptionsConfiguration
						});
				},error:function(status){
					console.log(status);
				}
			});
		}
	</script>
	<!-- 통계 그래프 (최근 24시간) 끝 -->
	<!-- 666666666666666666666666666666 환불 끝 6666666666666666666666666666666666 -->
</body>
</html>