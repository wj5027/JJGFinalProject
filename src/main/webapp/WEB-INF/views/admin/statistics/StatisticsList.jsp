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

			<!-- 그래프 시작 -->
			<div class="content">
				<div class="row">
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">전체 사업자 회원가입 수</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-bell-55 text-primary"></i> 763,215
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLinePurple"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">월별 사업자 회원가입 수</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-delivery-fast text-info"></i> 3,500€
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="CountryChart"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">오늘 사업자 회원가입 수</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-send text-success"></i> 12,100K
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLineGreen"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 아래 세 줄 -->
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">전체 사용자 예약 건수</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-bell-55 text-primary"></i> 763,215
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLinePurple2"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">월별 사용자 예약 건수</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-delivery-fast text-info"></i> 3,500€
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="CountryChart2"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">오늘 사용자 예약 건수</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-send text-success"></i> 12,100K
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLineGreen2"></canvas>
								</div>
							</div>
						</div>
					</div>
					<!-- 그래프 끝 -->
					
					<!-- 테이블 시작 -->					
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">사업자 관리</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<thead class=" text-primary">
											<tr>
												<th>내용</th>
												<th>구분</th>
												<th class="text-center">건수</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>포인트 승인</td>
												<td>승인</td>
												<td class="text-center">5</td>
											</tr>
											<tr>
												<td>주차장 신청</td>
												<td>신청</td>
												<td class="text-center">32</td>
											</tr>
											<tr>
												<td>사업자 정보수정</td>
												<td>신청</td>
												<td class="text-center">15</td>
											</tr>
											<tr>
												<td>스팸 게시물</td>
												<td>필터</td>
												<td class="text-center">3</td>
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

</body>
</html>