<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<jsp:include page="../../common/bootInfo.jsp"></jsp:include><style>
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
									<h4 class="card-title">환전/환불 검색</h4>
								</div>
								
								<form id="formList" method="POST" action="selectSearchExchangeList.ad">
									<div class="card-body">
										<div class="table-responsive" style="overflow: hidden;">
											<table class="table tablesorter " id="">
												<tbody>
													<tr>
														<td>아이디</td>
														<td>
															<div class="row">
																<div class="form-group"  style="margin-left: 1.5%;">
																	<input type="text" class="form-control" id="memberId" style="width:80%; height: 60%;"
																		name="memberId" placeholder="아이디를 입력해주세요" value="${memberId}">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td>환전/환불 구분</td>
														<td>
															<div style="width: 15%;">
																<select class="custom-select nav-link dropdown-toggle"
																	id="status" name="status" style="background-color: rgb(34, 42, 65);">
																	<option value="A">전체</option>
																	<option value="E">환전</option>
																	<option value="R">환불</option>
																	<option value="Y">승인완료</option>
																	<option value="N">반송완료</option>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td>회원 구분</td>
														<td>
															<div style="width: 15%;">
																<select class="custom-select nav-link dropdown-toggle"
																	id="memberType" name="memberType" style="background-color: rgb(34, 42, 65);">
																	<option value="A">전체</option>
																	<option value="B">사업자</option>
																	<option value="U">사용자</option>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td>신청날짜</td>
														<td><input type="hidden" name="today" id="today">
															<div id="dayBtn" name="dayBtn">
																<button id="one" onclick="return one()"
																	class="btn btn-info animation-on-hover btn-sm">1일</button>
																&nbsp;&nbsp;
																<button id="seven" onclick="return seven()"
																	class="btn btn-info animation-on-hover btn-sm">7일</button>
																&nbsp;&nbsp;
																<button id="month" onclick="return month()"
																	class="btn btn-info animation-on-hover btn-sm">1개월</button>
																&nbsp;&nbsp;
																<button id="halfYear" onclick="return halfYear()"
																	class="btn btn-info animation-on-hover btn-sm">6개월</button>
																&nbsp;&nbsp;
																<button id="year" onclick="return year()"
																	class="btn btn-info animation-on-hover btn-sm">1년</button>
																&nbsp;&nbsp;
																<button id="detailDate" onclick="return detailDate()"
																	class="btn btn-warning animation-on-hover btn-sm">날짜 상세 검색</button>
															</div>
		
															<div class="row" id="datePicker"
																style="margin-top: 1%; visibility: hidden;">
																<div class="form-group" style="margin-left: 1.5%;">
																	<input type="date" class="form-control" value="" style="width:80%; height: 60%;"
																		id="startDate" name="startDate">
																</div>
																<div class="form-group">
																	&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">~</b>&nbsp;&nbsp;&nbsp;
																</div>
																<div class="form-group">
																	<input type="date" class="form-control" value="" style="width:80%; height: 60%;"
																		id="endDate" name="endDate">
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
								</form>
							</div>
						</div>
	
						<div class="col-md-12">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">환전/환불 검색 결과</h4>
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
													<th class="text-center">회원 구분</th>
													<th>아이디</th>
													<th class="text-center">신청 오일</th>
													<th class="text-center">신청 금액</th>
													<th class="text-center">신청일</th>
													<th>예금주</th>
													<th class="text-center">은행</th>
													<th>계좌번호</th>
													<th class="text-center">진행 상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="e" items="${list}" varStatus="varstatus">
													<tr class="listAreaTr">
														<td class="text-center">${e.exchangeNo}</td>														
														<c:if test="${e.memberType=='U'}">
															<td class="text-center">사용자</td>		
														</c:if>												
														<c:if test="${e.memberType=='B'}">
															<td class="text-center">사업자</td>		
														</c:if>
														<td>${e.memberId}</td>
														<td class="text-center">${e.oil}</td>
														<td class="text-center">${e.cash}</td>
														<td class="text-center">${e.applicationDate}</td>
														<td>${e.accountHolder}</td>
														<td class="text-center">${e.applicationBank}</td>
														<td>${e.applicationAccountNumber}</td>
														<td class="memberNoHide">${e.memberNo}</td>
														
														<c:if test="${e.status=='환전진행중'}">
															<td class="text-center">
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-4"
																	class="btn btn-info animation-on-hover btn-sm">환전 승인</button>
																&nbsp;&nbsp;
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-2"
																	class="btn btn-warning animation-on-hover btn-sm">환전 취소</button>
															</td>
														</c:if>
														<c:if test="${e.status=='환불진행중'}">
															<td class="text-center">
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-8"
																	class="btn btn-info animation-on-hover btn-sm">환불 승인</button>
																&nbsp;&nbsp;
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-2"
																	class="btn btn-warning animation-on-hover btn-sm">환불 취소</button>
															</td>
														</c:if>
														<c:if test="${e.status=='승인'}">
															<td class="text-center">승인 완료</td>
														</c:if>
														<c:if test="${e.status=='반송'}">
															<td class="text-center">
																<button data-toggle="modal" data-target=".bd-example-modal-lg-10" style="width: 72%;"
																	class="btn btn-default animation-on-hover btn-sm" onclick="cancelReasonDetail()">반송 완료</button>																
															</td>
														</c:if>
														<td class="statusHide">${e.status}</td>
													</tr>
												</c:forEach>													
											</tbody>
										</table>
										
										<!-- 페이징 버튼 영역 -->
										<div id="pagingArea" align="center">
											<!-- 첫번째 페이지 -->
											<c:if test="${pi.currentPage != 1}">
												<c:url var="blistFirst" value="selectSearchExchangeList.ad">
													<c:param name="currentPage" value="1" />
													<c:param name="status" value="${status}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="memberType" value="${memberType}" />
													<c:param name="today" value="${today}" />
													<c:param name="startDate" value="${startDate}" />
													<c:param name="endDate" value="${endDate}" />
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
												<c:url var="blistBack" value="/selectSearchExchangeList.ad">
													<c:param name="currentPage" value="${pi.currentPage-1}" />
													<c:param name="status" value="${status}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="memberType" value="${memberType}" />
													<c:param name="today" value="${today}" />
													<c:param name="startDate" value="${startDate}" />
													<c:param name="endDate" value="${endDate}" />
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
													<c:url var="blistCheck" value="selectSearchExchangeList.ad">
														<c:param name="currentPage" value="${p}" />
														<c:param name="status" value="${status}" />
														<c:param name="memberId" value="${memberId}" />
														<c:param name="memberType" value="${memberType}" />
														<c:param name="today" value="${today}" />
														<c:param name="startDate" value="${startDate}" />
														<c:param name="endDate" value="${endDate}" />
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
												<c:url var="blistEnd" value="selectSearchExchangeList.ad">
													<c:param name="currentPage" value="${pi.currentPage+1}" />
													<c:param name="status" value="${status}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="memberType" value="${memberType}" />
													<c:param name="today" value="${today}" />
													<c:param name="startDate" value="${startDate}" />
													<c:param name="endDate" value="${endDate}" />
												</c:url>
												<a href="${blistEnd}"><button
														class="btn btn-info animation-on-hover btn-sm">></button></a>
											</c:if>

											<!-- 끝 페이지 -->
											<c:if test="${pi.currentPage != pi.maxPage}">
												<c:url var="blistEnd2" value="selectSearchExchangeList.ad">
													<c:param name="currentPage" value="${pi.maxPage}" />
													<c:param name="status" value="${status}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="memberType" value="${memberType}" />
													<c:param name="today" value="${today}" />
													<c:param name="startDate" value="${startDate}" />
													<c:param name="endDate" value="${endDate}" />
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
				exchangeNo=0;
				oil=0;
				memberNo=0;
				$(".memberNoHide").hide();
				$(".statusHide").hide();
				
				/* hover 되었을 때 */
				$(".listAreaTr").mouseenter(function () {
					for (var i = 0; i < 11; i++) {
						$(this).children().eq(i).css({"background":"rgb(28, 28, 38)", "cursor":"pointer"});	
						exchangeNo = $(this).children().eq(0).text();	
						oil = $(this).children().eq(3).text();
						memberNo = $(this).children().eq(9).text();
						status = $(this).children().eq(11).text();
					}	
				/* hover 해제 되었을 때 */	
				}).mouseout(function () {	
					for (var i = 0; i < 11; i++) {
						$(this).children().eq(i).css({"background":"rgb(39, 41, 61)"});	
					}
				});
	
				/* 리스트 행 클릭 */
				for (var i = 0; i < 5; i++) {
					for (var j = 0; j < 10; j++) {
						$(".listAreaTr").eq(i).children().eq(j).click(function () {
							$("#clickModal").click();	
							console.log(exchangeNo)	
							
							/* ajax */										
							$.ajax({
								url:"detailExchangeMoney.ad",
								type:"get",
								data:{exchangeNo:exchangeNo},
								success:function(data){

									$select = $("#ajaxModalTable");
									$("#ajaxModalTable").empty(); 
									
									var eDate = new Date(data.applicationDate);
									var applicationDate = eDate.getFullYear() + '/' + ('0' + eDate.getMonth()).slice(-2) + '/' + ('0' + eDate.getDate()).slice(-2);
									
									$select.append('<tbody>');
									$select.append('<tr>'
														+'<td>번호</td>'
														+'<td style="margin-left:20%">'+data.exchangeNo+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>아이디</td>'
														+'<td>'+data.memberId+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>신청 오일</td>'
														+'<td>'+data.oil+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>신청 금액</td>'
														+'<td>'+data.cash+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>신청일</td>'
														+'<td>'+applicationDate+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>예금주</td>'
														+'<td>'+data.accountHolder+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>은행</td>'
														+'<td>'+data.applicationBank+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>계좌번호</td>'
														+'<td>'+data.applicationAccountNumber+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>진행 상태</td>'
														+'<td>'+data.status+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td colspan="2" align="center">'
														+'<button type="button" class="btn btn-info animation-on-hover" data-dismiss="modal">확인</button></td>'
														+'</tr>');
									$select.append('</tbody>');
								},error:function(status){
									console.log(status);
								}
							});							
						});
					}
				}
			});
		</script>
		<!-- 테이블 행 클릭 시 모달 끝 -->
		
	
		<!-- /////////////////////////////////// 모달  /////////////////////////////////////////// -->
		<!-- 상세보기 모달 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-1" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">환전/환불 신청자 개인정보 상세보기</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table class="table tablesorter" id="ajaxModalTable">
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
									<h4 class="card-title">환전/환불 승인 취소 사유</h4>
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
															placeholder="취소 사유를 입력해주세요" id="cancelReason"
															class="form-control form-control-success"></textarea></td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" id="deleteExchangeMoney"
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
		
		<!-- 반송 > 보내기 버튼 클릭  -->
		<script>
			function selectNo(cu) {
				selectedNo = cu;
			}
			$(function() {
				$("#deleteExchangeMoney").click(function() {
					var cancelReason = $("#cancelReason").val();
					location.href = 'deleteExchangeMoney.ad?exchangeNo='+exchangeNo+'&cancelReason='+cancelReason+'&oil='+oil+'&memberNo='+memberNo+'&status='+status;
				});
			});
		</script>
		<!-- 반송 > 보내기 버튼 클릭 시 끝 -->
	
		<!-- 환전승인버튼 클릭 시 모달 -->
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
													<td>정말로 환전 처리 하시겠습니까?</td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" data-target=".bd-example-modal-lg-3" data-toggle="modal" 
															class="btn btn-warning animation-on-hover" id="updateExchange">예</button>&nbsp;&nbsp;
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
		<!-- 환전승인버튼 클릭 시 모달 끝 -->
		
		<!-- 환불승인버튼 클릭 -->
		<script>
			$(function () {
				$("#updateExchange").click(function () {
					location.href='updateRefundExchangeMoney.ad?exchangeNo='+exchangeNo+'&oil='+oil+'&memberNo='+memberNo+'&status='+status;
				});
			});
		</script>
		<!-- 환불승인버튼 클릭 끝 -->
	
		<!-- 환전승인 버튼 -> 예 버튼 모달 -->
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
		<!-- 환전승인 버튼 -> 예 버튼 모달 끝 --> 
	
		<!-- 환불승인버튼 클릭 시 모달 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-8" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">환불 승인</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="modalTable" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>정말로 환불 처리 하시겠습니까?</td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" data-target=".bd-example-modal-lg-7" data-toggle="modal" 
															class="btn btn-warning animation-on-hover" id="updateRefund">예</button>&nbsp;&nbsp;
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
		<!-- 환불승인버튼 클릭 시 모달 끝 -->
		
		<!-- 환불승인버튼 클릭 -->
		<script>
			$(function () {
				$("#updateRefund").click(function () {					
					location.href='updateRefundExchangeMoney.ad?exchangeNo='+exchangeNo+'&oil='+oil+'&memberNo='+memberNo+'&status='+status;
				});
			});
		</script>
		<!-- 환불승인버튼 클릭 끝 -->
	
		<!-- 환불승인 버튼 -> 예 버튼 모달 -->
		<div class="modal fade bd-example-modal-lg-7" tabindex="-1"
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
										<td align="center"><b>정상적으로 환불 처리 되었습니다.</b></td>
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
		<!-- 환불승인 버튼 -> 예 버튼 모달 끝 --> 
				
		<!-- 반송 완료 상세 보기 모달 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-10" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">반송 사유</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<div id="answerModal">
											<table class="table tablesorter" id="ajaxCancelModalTable" style="padding-bottom: 0px; color: white;">
												<tr>
													<td align="center"><b>반송 사유가 들어갑니다.</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-default animation-on-hover" data-dismiss="modal"
															onclick="window.location.reload();">닫기</button></td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 반송 완료 상세 보기 모달 끝 -->
		
		<!-- 반송 사유 ajax -->
		<script>
			function cancelReasonDetail() {

				$.ajax({
					url:"cancelReasonDetail.ad",
					type:"get",
					data:{exchangeNo:exchangeNo},
					success:function(data){

						$select = $("#ajaxCancelModalTable");
						$("#ajaxCancelModalTable").empty(); 
						
						$select.append('<tbody>');
						$select.append('<tr>'
											+'<td align="center">'+data.cancelReason+'</b></td>'
											+'</tr>');
						$select.append('<tr>'
											+'<td align="center"><button type="button" class="btn btn-default animation-on-hover" data-dismiss="modal"'
											+'onclick="">닫기</button></b></td>'
											+'</tr>');
						$select.append('</tbody>');
					},error:function(status){
						console.log(status);
					}
				});
			}	
		</script>
		<!-- 반송 사유 ajax 끝 -->
		<!-- /////////////////////////////////// 모달 끝 /////////////////////////////////////////// -->
		
		<input type="hidden" value="${status}" id="inputStatus">
		<input type="hidden" value="${memberType}" id="inputMemberType">
		<!-- 검색 -->
		<script>
			$(function() {
				
				/* 자동 선택 - 환전 구분 */
				for(var i=0; i<$("#status option").length; i++){
					if($("#inputStatus").val() == $("#status option").eq(i).val()){
						$("#status").val($('#inputStatus').val()).prop("selected", true);
					}							
				}
				/* 자동 선택 - 회원 구분 */
				for(var i=0; i<$("#memberType option").length; i++){
					if($("#inputMemberType").val() == $("#memberType option").eq(i).val()){
						$("#memberType").val($('#inputMemberType').val()).prop("selected", true);
					}							
				}
				
				/* 구분 */
				$("#status").click(function() {
					var selected = $("#status option:selected").val();					
				});
	
				/* 아이디 */
				$("#memberId").click(function() {
					var memberId = $("#memberId").val();
				});
	
				/* 아이디 타입 */
				$("#memberType").click(function() {
					var memberType = $("#memberType").val();
				});
	
				/* 상세날짜 선택 */
				var startDate = "";
				var startArray = "";	        
				var start_date = "";
				$("#startDate").click(function() {
					startDate = $("#startDate").val();
					startArray = startDate.split('-');
					start_date = new Date(startArray[0], startArray[1], startArray[2]);
				});
				var endDate = "";
				var endArray = "";
				var end_date = "";
				$("#endDate").click(function() {
					endDate = $("#endDate").val();
					endArray = endDate.split('-');
					end_date = new Date(endArray[0], endArray[1], endArray[2]);
				});
	
				/* 날짜 상세 검색 버튼 */
				$("#detailDate").click(function() {
					$("#dayBtn").css("visibility", "hidden");
					$("#datePicker").css("visibility", "visible");
					today = "";
					return false;
				});
	
				/* 검색 버튼 */
				$("#searchList").click(function () {
					$("#startDate").click();
					$("#endDate").click();
					if(start_date.getTime() > end_date.getTime()) {
			            alert("종료날짜보다 시작날짜가 작아야합니다.");
			            return false;
			        }
				});
	
			});
		</script>
		<!-- 검색 끝 -->
	
		<!-- 테이블 날짜버튼 클릭 시 색상 변경 -->
		<script>
			$(function() {
				var d = new Date();
				var today = "";
	
				$("#one").click(function() {
					$("#one").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#seven").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#month").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#halfYear").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#year").attr("class", "btn btn-info animation-on-hover btn-sm");
	
					today = d.getFullYear() + '/' + ('0' + (d.getMonth() + 1)).slice(-2) + '/' + ('0' + (d.getDate() - 1)).slice(-2);
					console.log(today);
	
					$("#today").val(today);
	
					return false;
				});
				$("#seven").click(function() {
					$("#one").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#seven").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#month").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#halfYear").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#year").attr("class", "btn btn-info animation-on-hover btn-sm");
	
					var o = new Date(d.getFullYear(), d.getMonth() + 1, d.getDate() - 7); // 2월달 날짜계산 필요
					today = o.getFullYear() + '/' + ('0' + o.getMonth()).slice(-2) + '/' + ('0' + o.getDate()).slice(-2);
					console.log(today);
	
					$("#today").val(today);
	
					return false
				});
				$("#month").click(function() {
					$("#one").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#seven").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#month").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#halfYear").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#year").attr("class", "btn btn-info animation-on-hover btn-sm");
	
					var o = new Date(d.getFullYear(), d.getMonth(), d.getDate());
					today = o.getFullYear() + '/' + ('0' + o.getMonth()).slice(-2) + '/' + ('0' + o.getDate()).slice(-2);
					console.log(today);
	
					$("#today").val(today);
	
					return false
				});
				$("#halfYear").click(function() {
					$("#one").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#seven").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#month").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#halfYear").attr("class", "btn btn-warning animation-on-hover btn-sm");
					$("#year").attr("class", "btn btn-info animation-on-hover btn-sm");
	
					var o = new Date(d.getFullYear(),(d.getMonth() + 1) - 6, d.getDate());
					today = o.getFullYear() + '/' + ('0' + o.getMonth()).slice(-2) + '/' + ('0' + o.getDate()).slice(-2);
					console.log(today);
	
					$("#today").val(today);
	
					return false
				});
				$("#year").click(function() {
					$("#one").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#seven").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#month").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#halfYear").attr("class", "btn btn-info animation-on-hover btn-sm");
					$("#year").attr("class", "btn btn-warning animation-on-hover btn-sm");
	
					var o = new Date(d.getFullYear() - 1, d.getMonth() + 1,d.getDate());
					today = o.getFullYear() + '/' + ('0' + o.getMonth()).slice(-2) + '/' + ('0' + o.getDate()).slice(-2);
					console.log(today);
	
					$("#today").val(today);
	
					return false
				});
			});
		</script>
		<!-- 테이블 날짜버튼 클릭 시 색상 변경 끝 -->

	</c:if>
</body>
</html>