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
	<c:if test="${empty sessionScope.loginUser }">
		<c:set var="message" value="해당 페이지는 관리자 이외에는 접근하실 수 없습니다." scope="request"></c:set>
		<jsp:forward page="../../common/errorPage.jsp"></jsp:forward>
	</c:if>

	<c:if test="${not empty sessionScope.loginUser }"> <!-- 관리자일때 and loginUser.memberType='A' -->
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
									<h4 class="card-title">사업자 검색</h4>
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
									<h4 class="card-title">사업자 검색 결과</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table class="table tablesorter " id="">
											<thead class=" text-primary">
												<tr>
													<th class="text-center">번호</th>
													<th>아이디</th>
													<th>이름</th>
													<th>전화번호</th>
													<th class="text-center">이메일</th>
													<th class="text-center">보유 포인트</th>
													<th class="text-center">상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="ceo" items="${list}">
													<tr>
														<td class="text-center">${ceo.memberNo}</td>
														<td>${ceo.memberId}</td>
														<td>${ceo.memberName}</td>
														<td>${ceo.phone}</td>
														<td class="text-center">${ceo.email}</td>
														<c:if test="${empty ceo.oil}">
														<td class="text-center">0</td>
														</c:if>
														<c:if test="${!empty ceo.oil}">
														<td class="text-center">${ceo.oil}</td>
														</c:if>
														<c:if test="${ceo.status == 'Y'}">
															<td class="text-center">
																<button data-toggle="modal"
																data-target=".bd-example-modal-lg-3"
																class="btn btn-warning animation-on-hover btn-sm">회원탈퇴</button>
															</td>
														</c:if>
														<c:if test="${ceo.status == 'N'}">
															<td class="text-center">
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-1"
																	class="btn btn-info animation-on-hover btn-sm">회원복구</button>
															</td>
														</c:if>
													</tr>
												</c:forEach>
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


		<!-- 회원 복구 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-1" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive"
										style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="modalTable"
											style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td align="center" colspan="2"><b>회원을 복구 시키시겠습니까?</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-warning animation-on-hover">예</button></td>&nbsp;&nbsp;
													<td align="center"><button type="button"
															class="btn btn-info animation-on-hover"
															data-dismiss="modal" onclick="window.location.reload();">아니오</button></td>
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
		<!-- 회원복구 끝 -->

		<!-- 회원탈퇴 -->
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
										<td align="center" colspan="2"><b>회원을 탈퇴 시키시겠습니까?</b></td>
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
		<!-- 회원탈퇴 끝 -->
	</c:if>

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