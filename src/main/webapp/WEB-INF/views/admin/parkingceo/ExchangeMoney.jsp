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
								<h4 class="card-title">환전 검색</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<tbody>
											<tr>
												<td>사업자 아이디</td>
												<td>
													<div class="row">
														<div class="form-group"  style="margin-left: 1.5%;">
															<input type="text" class="form-control" id=""
																placeholder="아이디를 입력해주세요">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>지역</td>
												<td>
													<div style="width: 15%;">
														<select class="custom-select nav-link dropdown-toggle"
															id="" style="background-color: rgb(34, 42, 65);">
															<option selected>전체</option>
															<option value="1">서울</option>
															<option value="2">대전</option>
															<option value="3">대구</option>
															<option value="4">부산</option>
														</select>
													</div>
												</td>
											</tr>
											<tr>
												<td>주차장명</td>
												<td>
													<div class="row">
														<div class="form-group" style="margin-left: 1.5%;">
															<input type="text" class="form-control" id=""
																placeholder="주차장 명을 입력해주세요">
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
								<h4 class="card-title">환전 승인 및 취소</h4>
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
												<th>사업자 아이디</th>
												<th>주차장명</th>
												<th>지역</th>
												<th>전화번호</th>
												<th class="text-center">환전신청 포인트</th>
												<th>등록일</th>
												<th>주소</th>
												<th class="text-center">상태</th>
											</tr>
										</thead>
										<tbody>
											<tr id="listAreaTr">
												<td class="text-center">1</td>
												<td>Niger</td>
												<td>니제르 주차장</td>
												<td>서울</td>
												<td>010-1234-5678</td>
												<td class="text-center">170000</td>
												<td>2017-01-25</td>
												<td>서울시 강남구 역삼동</td>
												<td class="text-center"><!--  onclick="event.cancelBubble=true;" -->
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-4"
														class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button data-toggle="modal"
														data-target=".bd-example-modal-lg-2"
														class="btn btn-warning animation-on-hover btn-sm">취소</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">2</td>
												<td>Red</td>
												<td>레드 주차장</td>
												<td>대전</td>
												<td>010-1234-5678</td>
												<td class="text-center">470000</td>
												<td>2008-12-27</td>
												<td>대전시 동구 용운동</td>
												<td class="text-center">
													<button class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button class="btn btn-warning animation-on-hover btn-sm">취소</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">3</td>
												<td>Blue</td>
												<td>블루 주차장</td>
												<td>경기</td>
												<td>010-1234-5678</td>
												<td class="text-center">827000</td>
												<td>2013-02-13</td>
												<td>용인시 처인구 포곡읍</td>
												<td class="text-center">
													<button class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button class="btn btn-warning animation-on-hover btn-sm">취소</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">4</td>
												<td>Gangnam</td>
												<td>강남 주차장</td>
												<td>강원</td>
												<td>010-1555-3111</td>
												<td class="text-center">448000</td>
												<td>2015-11-15</td>
												<td>속초시 대포동</td>
												<td class="text-center">
													<button class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button class="btn btn-warning animation-on-hover btn-sm">취소</button>
												</td>
											</tr>
											<tr>
												<td class="text-center">5</td>
												<td>Canada</td>
												<td>캐나다 주차장</td>
												<td>경기</td>
												<td>010-1234-5678</td>
												<td class="text-center">121000</td>
												<td>2009-10-30</td>
												<td>구리시 인창동</td>
												<td class="text-center">
													<button class="btn btn-info animation-on-hover btn-sm">승인</button>
													&nbsp;&nbsp;
													<button class="btn btn-warning animation-on-hover btn-sm">취소</button>
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

	<!-- 테이블 행 클릭 시 모달 -->
	<script>
		$(function () {
			$("#listArea td").mouseenter(function () { // hover 되었을 때
				$(this).parent().css({"background":"rgb(28, 28, 38)", "cursor":"pointer"});
			}).mouseout(function () { // 마우스가 위에 없을 때	
				$(this).parent().css({"background":"rgb(39, 41, 61)"});	
			});
			
			$("#listAreaTr").click(function () { // 클릭 했을 때
					$("#clickModal").click();						
			});
// 				var num = $(this).parent().children().eq(0).text(); // 각각의 글 번호를 가져온다. td 첫번째			
// 				console.log(num);				
<%-- 				location.href = "<%=request.getContextPath()%>/selectOne.no?num="+num; // 해당 글 번호를 같이 넘긴다.(ex. http://localhost:8001/jsp/selectOne.no?num=1) --%>
		});
	</script>

	<!-- 상세보기 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-1" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="background: rgb(39, 41, 61);">
					<div class="modal-body">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">사업자 개인정보 상세보기</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter" id="modalTable">
										<tbody>
											<tr>
												<td>번호</td>
												<td>1</td>
											</tr>
											<tr>
												<td>사업자 아이디</td>
												<td>Niger</td>
											</tr>
											<tr>
												<td>주차장명</td>
												<td>니제르 주차장</td>
											</tr>
											<tr>
												<td>지역</td>
												<td>서울</td>
											</tr>
											<tr>
												<td>전화번호</td>
												<td>010-1234-5678</td>
											</tr>
											<tr>
												<td>환전신청 포인트</td>
												<td>1710000</td>
											</tr>
											<tr>
												<td>등록일</td>
												<td>2017-01-25</td>
											</tr>
											<tr>
												<td>주소</td>
												<td>서울시 강남구 역삼동</td>
											</tr>
											<tr>
												<td>상태</td>
												<td>승인</td>
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
	<!-- 상세보기 모달 끝 -->


	<!-- 취소 사유 모달 -->
	<div class="modalDetail">
		<div class="modal fade bd-example-modal-lg-2" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="background: rgb(39, 41, 61);">
					<div class="modal-body" style="padding-bottom: 0px;">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">환전 승인 취소 사유</h4>
							</div>
							<div class="card-body" style="padding-bottom: 0px;">
								<div class="table-responsive"
									style="overflow: hidden; padding-bottom: 0px;">
									<table class="table tablesorter" id="modalTable"
										style="padding-bottom: 0px;">
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
		<div class="modal fade bd-example-modal-lg-4" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content" style="background: rgb(39, 41, 61);">
					<div class="modal-body" style="padding-bottom: 0px;">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">환전 승인</h4>
							</div>
							<div class="card-body" style="padding-bottom: 0px;">
								<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
									<table class="table tablesorter" id="modalTable" style="padding-bottom: 0px;">
										<tbody>
											<tr>
												<td>정말로 환전하시겠습니까?</td>
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
					<div class="table-responsive"
						style="overflow: hidden; padding-bottom: 0px;">
						<table class="table tablesorter " id=""
							style="margin-bottom: 0px;">
							<tbody>
								<tr>
									<td align="center"><b>정상적으로 환전 처리 되었습니다.</b></td>
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
	<!-- 승인 버튼 -> 예 버튼 모달 끝 --> 

	<!-- 테이블 날짜버튼 클릭 시 색상 변경 -->
	<script>
		$(function () {
			$("#one").click(function () {
				$("#one").attr("class","btn btn-warning animation-on-hover btn-sm");
				$("#seven").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#month").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#halfYear").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#year").attr("class","btn btn-info animation-on-hover btn-sm");
			});
			$("#seven").click(function () {
				$("#one").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#seven").attr("class","btn btn-warning animation-on-hover btn-sm");
				$("#month").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#halfYear").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#year").attr("class","btn btn-info animation-on-hover btn-sm");
			});
			$("#month").click(function () {
				$("#one").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#seven").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#month").attr("class","btn btn-warning animation-on-hover btn-sm");
				$("#halfYear").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#year").attr("class","btn btn-info animation-on-hover btn-sm");
			});
			$("#halfYear").click(function () {
				$("#one").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#seven").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#month").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#halfYear").attr("class","btn btn-warning animation-on-hover btn-sm");
				$("#year").attr("class","btn btn-info animation-on-hover btn-sm");
			});
			$("#year").click(function () {
				$("#one").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#seven").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#month").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#halfYear").attr("class","btn btn-info animation-on-hover btn-sm");
				$("#year").attr("class","btn btn-warning animation-on-hover btn-sm");
			});
		});
	</script>
	<!-- 테이블 날짜버튼 클릭 시 색상 변경 끝 -->

</body>
</html>