<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="../../common/bootInfo.jsp"></jsp:include>
<style>
input[type="date"]::-webkit-calendar-picker-indicator, input[type="date"]::-webkit-inner-spin-button
	{
	display: none;
	appearance: none;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	color: rgba(0, 0, 0, 0);
	opacity: 1;
	display: block;
	background:
		url(https://mywildalberta.ca/images/GFX-MWA-Parks-Reservations.png)
		no-repeat;
	width: 20px;
	height: 20px;
	border-width: thin;
}
</style>
</head>
<body>
	<c:if test="${empty sessionScope.loginUser }">
		<c:set var="message" value="해당 페이지는 관리자 이외에는 접근하실 수 없습니다."
			scope="request"></c:set>
		<jsp:forward page="../../common/errorPage.jsp"></jsp:forward>
	</c:if>
	
	<c:if test="${not empty sessionScope.loginUser and loginUser.member_type=='A'}">
		<div class="wrapper">
			<div class="sidebar" style="background: rgb(49, 49, 49) !important;">
				<!-- sidebar_admin -->
				<jsp:include page="../../common/sidebar_admin.jsp"></jsp:include>
				<!-- END sidebar_admin -->
	
				<div class="content">
					<div class="row">
				
						<!-- 검색 결과가 없을 때 출력되는 모달. -->
						<c:if test="${nullCheck=='nullCheck'}">
							<div style="margin: 5% 20%; position: absolute; z-index: 10;">
								<div align="center" class="alert alert-default alert-dismissible fade show" role="alert" style="width: 400px; height: 80px; padding-top: 6%; font-size: 20px;">
						  			<strong>검색결과</strong>가 없습니다.
						  				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						      			<i class="tim-icons icon-simple-remove"></i>
						  			</button>
								</div>
							</div>
						</c:if>
						<!-- 검색 결과가 없을 때 출력되는 모달 끝 -->
						
						<div class="col-md-12" height="500px">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">주차장 검색</h4>
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
															<div class="form-group"  style="margin-left: 1.5%;">
																<input type="text" class="form-control" id="parkingName"
																	name="parkingName" placeholder="주차장 명을 입력해주세요">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>등록일</td>
													<td>
														<button id="one" class="btn btn-info animation-on-hover btn-sm">1일</button>
														&nbsp;&nbsp;
														<button id="seven" class="btn btn-info animation-on-hover btn-sm">7일</button>
														&nbsp;&nbsp;
														<button id="month" class="btn btn-info animation-on-hover btn-sm">1개월</button>
														&nbsp;&nbsp;
														<button id="halfYear" class="btn btn-info animation-on-hover btn-sm">6개월</button>
														&nbsp;&nbsp;
														<button id="year" class="btn btn-info animation-on-hover btn-sm">1년</button>
														&nbsp;&nbsp;
	
														<div class="row">
															<div class="form-group"  style="margin-left: 1.5%;">
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
									<h4 class="card-title">주차장 전체 리스트</h4>
									<button id="clickModal" data-toggle="modal" data-target=".bd-example-modal-lg-1" type="button" style="display: none;"></button>
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
													<th>주소</th>
													<th class="text-center">주차구획수</th>
													<th class="text-center">사업자 번호</th>
													<th class="text-center">신청일</th>
													<th class="text-center">상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="pl" items="${list}" varStatus="varstatus">
													<tr>
														<td class="text-center">${pl.parkingListNo}</td>
														<td>${pl.memberId}</td>
														<td>${pl.parkingListName}</td>
														<td>
															${fn:split(pl.parkingAddress,' ')[0]}
														</td>
														<td>															
															<c:set var = "parkingAddress" value = "${pl.parkingAddress}"/>
															${fn:substring(parkingAddress, 0, 15)}
															<c:if test="${fn:length(parkingAddress) > 15}">...</c:if>	
														</td>
														<td class="text-center">${pl.parkingListParkingSize}</td>
														<td class="text-center">${pl.phone}</td>
														<td class="text-center">${pl.allianceDate}</td>
														<td class="text-center">														
															<c:if test="${pl.parkingListStatus=='N'}">
																<button data-toggle="modal" data-target=".bd-example-modal-lg-2" class="btn btn-info animation-on-hover btn-sm" 
																	onclick="detail(${varstatus.count - 1});">승인</button>&nbsp;&nbsp;	
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-8"
																	class="btn btn-warning animation-on-hover btn-sm">반송</button>
															</c:if>
															<c:if test="${pl.parkingListStatus=='Y'}">
																승인완료
															</c:if>
														</td>													
													</tr>
												</c:forEach>
											</tbody>
										</table>

										<!-- 페이징 버튼 영역 -->
										<div id="pagingArea" align="center">

											<!-- 첫번째 페이지 -->
											<c:if test="${pi.currentPage != 1}">
												<c:url var="blistFirst" value="selectParkingLotList.ad">
													<c:param name="currentPage" value="1" />
												</c:url>
												<a href="${blistFirst}"><button
														class="btn btn-info animation-on-hover btn-sm"><<</button></a>
											</c:if>
											<c:if test="${pi.currentPage == 1}">
												<button disable
													class="btn btn-info animation-on-hover btn-sm"><<</button>
											</c:if>

											<c:if test="${pi.currentPage <= 1}">
												<button disabled
													class="btn btn-info animation-on-hover btn-sm"><</button>
											</c:if>
											<c:if test="${pi.currentPage > 1}">
												<c:url var="blistBack" value="/selectParkingLotList.ad">
													<c:param name="currentPage" value="${pi.currentPage-1}" />
												</c:url>
												<a href="${blistBack}"><button
														class="btn btn-info animation-on-hover btn-sm"><</button></a>
											</c:if>

											<!-- 숫자부분 -->
											<c:forEach var="p" begin="${pi.startPage}"
												end="${pi.endPage}">
												<c:if test="${p eq pi.currentPage}">
													<button disabled
														class="btn btn-info animation-on-hover btn-sm">${p}</button>
												</c:if>
												<c:if test="${p ne pi.currentPage}">
													<c:url var="blistCheck" value="selectParkingLotList.ad">
														<c:param name="currentPage" value="${p}" />
													</c:url>
													<a href="${blistCheck}"><button
															class="btn btn-info animation-on-hover btn-sm">${p}</button></a>
												</c:if>
											</c:forEach>

											<c:if test="${pi.currentPage >= pi.maxPage }">
												<button disable
													class="btn btn-info animation-on-hover btn-sm">></button>
											</c:if>
											<c:if test="${pi.currentPage < pi.maxPage}">
												<c:url var="blistEnd" value="selectParkingLotList.ad">
													<c:param name="currentPage" value="${pi.currentPage+1}" />
												</c:url>
												<a href="${blistEnd}"><button
														class="btn btn-info animation-on-hover btn-sm">></button></a>
											</c:if>

											<!-- 끝 페이지 -->
											<c:if test="${pi.currentPage != pi.maxPage}">
												<c:url var="blistEnd2" value="selectParkingLotList.ad">
													<c:param name="currentPage" value="${pi.maxPage}" />
												</c:url>
												<a href="${blistEnd2}"><button
														class="btn btn-info animation-on-hover btn-sm">>></button></a>
											</c:if>
											<c:if test="${pi.currentPage == pi.maxPage}">
												<button disable
													class="btn btn-info animation-on-hover btn-sm">>></button>
											</c:if>
										</div>
										<!-- 페이징 버튼 영역 끝 -->
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
				}).click(function () { // 클릭 했을 때
					$("#clickModal").click();	
	// 				var num = $(this).parent().children().eq(0).text(); // 각각의 글 번호를 가져온다. td 첫번째			
	// 				console.log(num);				
	<%-- 				location.href = "<%=request.getContextPath()%>/selectOne.no?num="+num; // 해당 글 번호를 같이 넘긴다.(ex. http://localhost:8001/jsp/selectOne.no?num=1) --%>
				});
			});
		</script>
	
		<!-- 상세보기 모달 1 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-1" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">주차장 상세보기</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table class="table tablesorter" id="modalTable">
											<tbody>
												<tr>
													<td>번호</td>
													<td>5</td>
												</tr>
												<tr>
													<td>사업자 아이디</td>
													<td>Canada</td>
												</tr>
												<tr>
													<td>주차장 명</td>
													<td>캐나다 주차장</td>
												</tr>
												<tr>
													<td>지역</td>
													<td>경기</td>
												</tr>
												<tr>
													<td>전화번호</td>
													<td>010-1234-5678</td>
												</tr>
												<tr>
													<td>거래완료 포인트</td>
													<td>821000</td>
												</tr>
												<tr>
													<td>등록일</td>
													<td>2009-10-30</td>
												</tr>
												<tr>
													<td>주소</td>
													<td>구리시 인창동</td>
												</tr>
												<tr>
													<td>상태</td>
													<td>승인</td>
												</tr>
												<tr>
													<td align="center" colspan="2">
														<button type="button" class="btn btn-warning animation-on-hover"  data-target=".bd-example-modal-lg-2" data-toggle="modal">주차장 삭제</button>&nbsp;&nbsp;
														<button type="button" class="btn btn-warning animation-on-hover"  data-target=".bd-example-modal-lg-4" data-toggle="modal">제휴 승인</button>&nbsp;&nbsp; <!-- 제휴 취소 상태일 때 승인버튼만 활성화 -->
														<button type="button" class="btn btn-warning animation-on-hover"  data-target=".bd-example-modal-lg-6" data-toggle="modal">제휴 취소</button>&nbsp;&nbsp; <!-- 제휴 승인 상태일 때 취소버튼만 활성화 -->
														<button type="button" class="btn btn-info animation-on-hover" data-dismiss="modal">닫기</button>
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
			
		<!-- ////////////////////////////////////// 삭제 //////////////////////////////////////// -->
		<!-- 주차장 삭제버튼 클릭 시 모달 2 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-2" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">주차장 삭제</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>정말로 주차장을 삭제 하시겠습니까?</td>
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
		<!-- 주차장 삭제버튼 클릭 시 모달 끝 -->
			
		<!-- 주차장 삭제버튼 클릭 > 예 버튼 클릭 시 모달 3 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-3" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>주차장이 삭제되었습니다.</td>
												</tr>
												<tr>
													<td align="center"><button type="button" onclick="location.href='parkingLotList.ad'"
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
		<!-- 주차장 삭제버튼 클릭 > 예 버튼 클릭 시 모달 끝 -->
		<!-- ////////////////////////////////////// 삭제 //////////////////////////////////////// -->
				
		<!-- ////////////////////////////////////// 제휴 승인 //////////////////////////////////////// -->
		<!-- 제휴 승인 버튼 클릭 시 모달 4 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-4" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">주차장 삭제</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>제휴 승인 하시겠습니까?</td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" data-target=".bd-example-modal-lg-5" data-toggle="modal" 
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
		<!-- 제휴 승인 버튼 클릭 시 모달 끝 -->
			
		<!-- 제휴 승인 버튼 클릭 > 예 버튼 클릭 시 모달 5 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-5" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>승인 처리 되었습니다.</td>
												</tr>
												<tr>
													<td align="center"><button type="button" onclick="location.href='parkingLotList.ad'"
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
		<!-- 제휴 승인 버튼 클릭 > 예 버튼 클릭 시 모달 끝 -->
		<!-- ////////////////////////////////////// 제휴 승인 //////////////////////////////////////// -->
				
		<!-- ////////////////////////////////////// 제휴 취소 //////////////////////////////////////// -->
		<!-- 제휴 승인 버튼 클릭 시 모달 6 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-6" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">제휴 취소</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>제휴 취소 하시겠습니까?</td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" data-target=".bd-example-modal-lg-7" data-toggle="modal" 
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
		<!-- 제휴 승인 버튼 클릭 시 모달 끝 -->
			
		<!-- 제휴 승인 버튼 클릭 > 예 버튼 클릭 시 모달 7 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-7" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>취소 처리 되었습니다.</td>
												</tr>
												<tr>
													<td align="center"><button type="button" onclick="location.href='parkingLotList.ad'"
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
		<!-- 제휴 승인 버튼 클릭 > 예 버튼 클릭 시 모달 끝 -->
		<!-- ////////////////////////////////////// 제휴 취소 //////////////////////////////////////// -->
		
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
	</c:if>
</body>
</html>