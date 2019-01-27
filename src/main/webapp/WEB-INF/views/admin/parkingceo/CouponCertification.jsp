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
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">쿠폰 관리</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<thead class=" text-primary">
											<tr>
												<th class="text-center">번호</th>
												<th>사업자 아이디</th>
												<th>지역</th>
												<th>주차장명</th>
												<th>쿠폰명</th>
												<th class="text-center">쿠폰 가격</th>
												<th>기간</th>
												<th>주소</th>
												<th class="text-center">상태</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="text-center">1</td>
												<td>Niger</td>
												<td>서울</td>
												<td>니제르 주차장</td>
												<td>10%할인 쿠폰</td>
												<td class="text-center">1000</td>
												<td>2019-01-25 ~ 2019-03-24</td>
												<td>서울시 강남구 역삼동</td>
												<td class="text-center">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-1"
														class="btn btn-warning animation-on-hover btn-sm">취소</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">2</td>
												<td>Red</td>
												<td>대전</td>
												<td>레드 주차장</td>
												<td>1000원 할인 쿠폰</td>
												<td class="text-center">1000</td>
												<td>2019-01-25 ~ 2019-02-24</td>
												<td>대전시 동구 용운동</td>
												<td class="text-center">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-1"
														class="btn btn-warning animation-on-hover btn-sm">취소</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">3</td>
												<td>Blue</td>
												<td>경기</td>
												<td>블루 주차장</td>
												<td>20%할인 쿠폰</td>
												<td class="text-center">1500</td>
												<td>2019-01-13 ~ 2019-04-12</td>
												<td>용인시 처인구 포곡읍</td>
												<td class="text-center">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-1"
														class="btn btn-warning animation-on-hover btn-sm">취소</button>
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

	<!-- 취소 사유 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-1" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="background: rgb(39, 41, 61);">
					<div class="modal-body" style="padding-bottom: 0px;">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">쿠폰 발급 취소 사유</h4>
							</div>
							<div class="card-body" style="padding-bottom: 0px;">
								<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
									<table class="table tablesorter" id="modalTable" style="padding-bottom: 0px;">
										<tbody>
											<tr>
												<td>취소 사유</td>
											</tr>
											<tr>
												<td><textarea rows="60" cols="5" style="resize: none;"
														placeholder="취소 사유를 입력해주세요"
														class="form-control form-control-success"></textarea></td>
											</tr>
											<tr>
												<td align="center">
													<button type="button"
														class="btn btn-warning animation-on-hover">보내기</button>&nbsp;&nbsp;
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
	<!-- 취소 사유 모달 끝 -->
	
	<!-- 승인버튼 클릭 시 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-2" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="background: rgb(39, 41, 61);">
					<div class="modal-body" style="padding-bottom: 0px;">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">쿠폰 발급</h4>
							</div>
							<div class="card-body" style="padding-bottom: 0px;">
								<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
									<table class="table tablesorter" id="modalTable" style="padding-bottom: 0px;">
										<tbody>
											<tr>
												<td>정말로 쿠폰 발급 하시겠습니까?</td>
											</tr>
											<tr>
												<td align="center">
													<button type="button" data-target=".bd-example-modal-lg-3" data-toggle="modal" 
														class="btn btn-warning animation-on-hover">예</button>&nbsp;&nbsp;
													<button type="button"
														class="btn btn-info animation-on-hover"
														data-dismiss="modal">아니오</button>
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
	<!-- 승인버튼 클릭 시 모달 끝 -->

	<!-- 승인 버튼 -> 예 버튼 모달 -->
	<div class="modal fade bd-example-modal-lg-3" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="background: rgb(39, 41, 61);">
				<div class="modal-body" style="padding-bottom: 0px;">
					<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
						<table class="table tablesorter " id="" style="margin-bottom: 0px;">
							<tbody>
								<tr>
									<td align="center"><b>정상적으로 쿠폰발급처리 되었습니다.</b></td>
								</tr>
								<tr>
									<td align="center"><button type="button"
											class="btn btn-default animation-on-hover" data-dismiss="modal"
											onclick="window.location.reload();">닫기</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 승인 버튼 -> 예 버튼 모달 끝. -->

</body>
</html>