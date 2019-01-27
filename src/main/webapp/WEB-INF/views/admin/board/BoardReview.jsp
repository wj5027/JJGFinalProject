<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
								<h4 class="card-title">후기 검색</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<tbody>
											<tr>
												<td>아이디</td>
												<td>
													<div class="row">
														<div class="form-group" style="margin-left: 1.5%;">
															<input type="text" class="form-control" id=""
																placeholder="아이디를 입력해주세요">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>내용</td>
												<td>
													<div class="row">
														<div class="form-group" style="margin-left: 1.5%;">
															<input type="text" class="form-control" id=""
																placeholder="검색할 내용을 입력해주세요">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>등록일</td>
												<td>
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
													&nbsp;&nbsp;

													<div class="row">
														<div class="form-group" style="margin-left: 1.5%;">
															<input type="date" class="form-control" value="">
														</div>
														<div class="form-group">
															&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">~</b>&nbsp;&nbsp;&nbsp;
														</div>
														<div class="form-group">
															<input type="date" class="form-control" value="">
														</div>
													</div>
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
								<h4 class="card-title">후기 검색 결과</h4>
								<button id="clickModal" data-toggle="modal"
									data-target=".bd-example-modal-lg-1" type="button"
									style="display: none;"></button>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="listArea">
										<thead class=" text-primary">
											<tr>
												<th class="text-center">번호</th>
												<th>아이디</th>
												<th>주차장명</th>
												<th>주소</th>
												<th>내용</th>
												<th class="text-center">상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-center">1</td>
												<td>Niger</td>
												<td>니제르 주차장</td>
												<td>서울시 강남구 역삼동</td>
												<td>저렴한 요금에 잘 이용하고 갑니다.</td>
												<td class="text-center">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">상세보기</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-3"
														class="btn btn-warning animation-on-hover btn-sm">삭제</button>
												</td>
											</tr>		
											<tr>
												<td class="text-center">2</td>
												<td>Vancouver</td>
												<td>밴쿠버 주차장</td>
												<td>서울시 송파구 잠실동</td>
												<td>요금이 조금 비싼 것 같네요. 이용하는데에는 문제 없었습니다~</td>
												<td class="text-center">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">상세보기</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-3"
														class="btn btn-warning animation-on-hover btn-sm">삭제</button>
												</td>
											</tr>		
											<tr>
												<td class="text-center">3</td>
												<td>Gana</td>
												<td>가나 주차장</td>
												<td>서울시 강남구 대치동</td>
												<td>할인 받아서 이용 잘하고 갑니다~ 다음에 또 이용할게요!</td>
												<td class="text-center">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">상세보기</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-3"
														class="btn btn-warning animation-on-hover btn-sm">삭제</button>
												</td>
											</tr>											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- footer_admin -->
			<jsp:include page="../../common/footer_admin.jsp"></jsp:include>
			<!-- END footer_admin -->
		</div>
	</div>

	<!-- 상세보기 버튼 클릭 시 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-2" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="background: rgb(39, 41, 61);">
					<div class="modal-body" style="padding-bottom: 0px;">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">후기 상세보기</h4>
							</div>
							<div class="card-body" style="padding-bottom: 0px;">
								<div class="table-responsive"
									style="overflow: hidden; padding-bottom: 0px;">
									<table class="table tablesorter" id="modalTable"
										style="padding-bottom: 0px;">
										<tbody>
											<tr>
												<th>번호</th>
												<td>3</td>
											</tr>
											<tr>
												<th>아이디</th>
												<td>Gana</td>
											</tr>
											<tr>
												<th>주차장명</th>
												<td>가나 주차장</td>
											</tr>
											<tr>
												<th>주소</th>
												<td>서울시 강남구 대치동</td>
											</tr>
											<tr>
												<th>내용</th>
												<td>할인 받아서 이용 잘하고 갑니다~ 다음에 또 이용할게요!</td>
											</tr>
											<tr>
												<td align="center" colspan="2">
													<button type="button"
														class="btn btn-info animation-on-hover"
														data-dismiss="modal">닫기</button>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상세보기 버튼 클릭 시 모달 끝 -->

	<!-- 삭제 버튼 클릭 시 모달 -->
	<div class="modal fade bd-example-modal-lg-3" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="background: rgb(39, 41, 61);">
				<div class="modal-body" style="padding-bottom: 0px;">
					<div class="table-responsive"
						style="overflow: hidden; padding-bottom: 0px;">
						<table class="table tablesorter " id=""
							style="margin-bottom: 0px;">
							<tbody>
								<tr>
									<td colspan="2" align="center"><b>정말로 삭제 하시겠습니까?</b></td>
								</tr>
								<tr>
									<td align="center"><button type="button"
											class="btn btn-warning animation-on-hover">예</button></td>&nbsp;&nbsp;
									<td align="center"><button type="button"
											class="btn btn-info animation-on-hover" data-dismiss="modal"
											onclick="window.location.reload();">아니오</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 삭제 버튼 클릭 시 모달 끝 -->

	<!-- 테이블 날짜버튼 클릭 시 색상 변경 -->
	<script>
		$(function() {
			$("#one").click(
					function() {
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

</body>
</html>