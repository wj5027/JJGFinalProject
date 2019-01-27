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
	<div class="wrapper">
		<div class="sidebar" style="background: rgb(49, 49, 49) !important;">
			<!-- sidebar_admin -->
			<jsp:include page="../../common/sidebar_admin.jsp"></jsp:include>
			<!-- END sidebar_admin -->

			<div class="content">
				<div class="row">
					<div class="col-md-12" height="500px">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">환전 통계 검색</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<tbody>
											<tr>
												<td>구분</td>
												<td>
													<div style="width: 20%;">
														<select class="custom-select nav-link dropdown-toggle"
															id="" style="background-color: rgb(34, 42, 65);">
															<option selected>전체</option>
															<option value="1">활동중인 사업자</option>
															<option value="2">탈퇴한 사업자</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td>아이디</td>
												<td>
													<div class="row">
														<div class="form-group" style="margin-left: 1.5%;">
															<input type="text" class="form-control"
																id="exampleInputPassword1" placeholder="아이디를 입력해주세요">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>날짜 검색</td>
												<td>
													<button id="alltime"
														class="btn btn-info animation-on-hover btn-sm">전체</button>
													&nbsp;&nbsp;
													<button id="one"
														class="btn btn-info animation-on-hover btn-sm">1일</button>
													&nbsp;&nbsp;
													<button id="seven"
														class="btn btn-info animation-on-hover btn-sm">7일</button>
													&nbsp;&nbsp;
													<button id="month"
														class="btn btn-info animation-on-hover btn-sm">1개월</button>
													&nbsp;&nbsp;
													<button id="halfYear"
														class="btn btn-info animation-on-hover btn-sm">6개월</button>
													&nbsp;&nbsp;
													<button id="year"
														class="btn btn-info animation-on-hover btn-sm">1년</button>
												</td>
											</tr>
											<tr>
												<td colspan="2" align="center">
													<button class="btn btn-info animation-on-hover">검색</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">환전 통계 결과</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<thead class=" text-primary">
											<tr>
												<th class="text-center">계정번호</th>
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th>주소</th>
												<th class="text-center">환전 포인트</th>
												<th>환전 날짜</th>
												<th class="text-center">상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-center">1</td>
												<td>Niger</td>
												<td>니제르</td>
												<td>010-1234-5678</td>
												<td>서울시 강남구 역삼동</td>
												<td class="text-center">7000</td>
												<td>2019-01-03</td>
												<td class="text-center">활동중인 사업자</td>
											</tr>
											<tr>
												<td class="text-center">2</td>
												<td>Red</td>
												<td>레드</td>
												<td>010-0001-5678</td>
												<td>서울시 강남구 삼성동</td>
												<td class="text-center">12000</td>
												<td>2019-01-07</td>
												<td class="text-center">활동중인 사업자</td>
											</tr>
											<tr>
												<td class="text-center">3</td>
												<td>Blue</td>
												<td>블루</td>
												<td>010-0012-5678</td>
												<td>서울시 강남구 역삼동</td>
												<td class="text-center">3200</td>
												<td>2019-01-15</td>
												<td class="text-center">탈퇴한 사업자</td>
											</tr>
											<tr>
												<td class="text-center">4</td>
												<td>Niger</td>
												<td>니제르</td>
												<td>010-1234-5678</td>
												<td>서울시 강남구 역삼동</td>
												<td class="text-center">12000</td>
												<td>2019-01-25</td>
												<td class="text-center">활동중인 사업자</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 그래프 -->
				<div class="card" style="height: 300px; width: 100%;">
					<div class="card-header">
						<h4 class="card-title">
							환전 통계 그래프 (매출:
							<p style="display: inline;">140000</p>
							원)
						</h4>
					</div>
					<div class="card-body">
						<canvas id="lineChartExample"></canvas>
					</div>
				</div>
				<!-- 그래프 끝 -->
			</div>

			<!-- footer_admin -->
			<jsp:include page="../../common/footer_admin.jsp"></jsp:include>
			<!-- END footer_admin -->
		</div>
	</div>

	<!-- 테이블 날짜버튼 클릭 시 색상 변경 -->
	<script>
		$(function() {
			$("#alltime").click(
					function() {
						$("#alltime").attr("class",
								"btn btn-warning animation-on-hover btn-sm");
						$("#one").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#seven").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#month").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#halfYear").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#year").attr("class",
								"btn btn-info animation-on-hover btn-sm");
					});
			$("#one").click(
					function() {
						$("#alltime").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#one").attr("class",
								"btn btn-warning animation-on-hover btn-sm");
						$("#seven").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#month").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#halfYear").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#year").attr("class",
								"btn btn-info animation-on-hover btn-sm");
					});
			$("#seven").click(
					function() {
						$("#alltime").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#one").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#seven").attr("class",
								"btn btn-warning animation-on-hover btn-sm");
						$("#month").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#halfYear").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#year").attr("class",
								"btn btn-info animation-on-hover btn-sm");
					});
			$("#month").click(
					function() {
						$("#alltime").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#one").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#seven").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#month").attr("class",
								"btn btn-warning animation-on-hover btn-sm");
						$("#halfYear").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#year").attr("class",
								"btn btn-info animation-on-hover btn-sm");
					});
			$("#halfYear").click(
					function() {
						$("#alltime").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#one").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#seven").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#month").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#halfYear").attr("class",
								"btn btn-warning animation-on-hover btn-sm");
						$("#year").attr("class",
								"btn btn-info animation-on-hover btn-sm");
					});
			$("#year").click(
					function() {
						$("#alltime").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#one").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#seven").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#month").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#halfYear").attr("class",
								"btn btn-info animation-on-hover btn-sm");
						$("#year").attr("class",
								"btn btn-warning animation-on-hover btn-sm");
					});
		});
	</script>
	<!-- 테이블 날짜버튼 클릭 시 색상 변경 끝 -->

	<!-- 통계 그래프 -->
	<script>
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
						suggestedMax : 110,
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

		var ctx = document.getElementById("lineChartExample").getContext("2d");

		var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

		gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
		gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
		gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors

		var data = {
			labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
					'10월', '11월', '12월' ],
			datasets : [ {
				label : "Data",
				fill : true,
				backgroundColor : gradientStroke,
				borderColor : '#d048b6',
				borderWidth : 2,
				borderDash : [],
				borderDashOffset : 0.0,
				pointBackgroundColor : '#d048b6',
				pointBorderColor : 'rgba(255,255,255,0)',
				pointHoverBackgroundColor : '#d048b6',
				pointBorderWidth : 20,
				pointHoverRadius : 4,
				pointHoverBorderWidth : 15,
				pointRadius : 4,
				data : [ 60, 110, 70, 100, 75, 90, 80, 100, 70, 80, 120, 80 ],
			} ]
		};

		var myChart = new Chart(ctx, {
			type : 'line',
			data : data,
			options : gradientChartOptionsConfiguration
		});
	</script>
	<!-- 통계 그래프 끝 -->


</body>
</html>