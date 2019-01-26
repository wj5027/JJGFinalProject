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
								<h4 class="card-title">필터 설정</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="" style="width: 50%" align="center">
										<tbody>
											<tr>
												<td colspan="3" align="center">
													<div class="form-group">
														<select multiple class="form-control" id="" style="height: 200px">
															<option>욕설1</option>
															<option>욕설2</option>
															<option>욕설3</option>
															<option>욕설4</option>
															<option>욕설5</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td>필터 입력</td>
												<td>
													<div class="row">
														<div class="form-group">
															<input type="text" class="form-control" id="writerFilter" style="margin-top: 3%"
																placeholder="금지할 단어를 입력해주세요">
														</div>
													</div>
												</td>
												<td align="right">
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-info animation-on-hover btn-sm">추가</button>
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

	<!-- 추가버튼 클릭 시 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-2" tabindex="-1"
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
												<td align="center"><b>정상적으로 추가 되었습니다.</b></td>
											</tr>
											<tr>
												<td align="center"><button type="button"
														class="btn btn-default animation-on-hover"
														data-dismiss="modal" onclick="window.location.reload();">확인</button></td>
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
	<!-- 추가버튼 클릭 시 모달 끝 -->
	
	<!-- 추가버튼 클릭 시(아무값도 입력되지 않았울 때) 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-4" tabindex="-1"
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
												<td align="center"><b>글을 입력한 후 추가버튼을 눌러주세요</b></td>
											</tr>
											<tr>
												<td align="center"><button type="button"
														class="btn btn-default animation-on-hover"
														data-dismiss="modal" onclick="window.location.reload();">닫기</button></td>
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
	<!-- 추가버튼 클릭 시(아무값도 입력되지 않았울 때) 모달 끝 -->

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