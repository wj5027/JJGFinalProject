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
								
								<form id="formList" method="POST" action="selectSearchParkingLotList.ad">
									<div class="card-body">
										<div class="table-responsive" style="overflow: hidden;">
											<table class="table tablesorter " id="">
												<tbody>
													<tr>
														<td>상태구분</td>
														<td>
															<div style="width: 15%;">
																<select class="custom-select nav-link dropdown-toggle"
																	id="parkingListStatus" name="parkingListStatus"
																	style="background-color: rgb(34, 42, 65);">
																	<option value="A" selected>전체</option>
																	<option value="I">변경중</option>
																	<option value="Y">변경완료</option>
																	<option value="N">변경취소</option>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td>아이디</td>
														<td>
															<div class="row">
																<div class="form-group"  style="margin-left: 1.5%;">
																	<input type="text" class="form-control" id="memberId" style="width:80%; height: 60%;"
																		name="memberId" placeholder="아이디를 입력해주세요">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td>지역</td>
														<td>
															<div class="row">
																<div class="form-group"  style="margin-left: 1.5%;">
																	<input type="text" class="form-control" id="parkingAddress" style="width:80%; height: 60%;"
																		name="parkingAddress" placeholder="지역을 입력해주세요">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td>주차장명</td>
														<td>
															<div class="row">
																<div class="form-group"  style="margin-left: 1.5%;">
																	<input type="text" class="form-control" id="parkingListName" style="width:80%; height: 60%;"
																		name="parkingListName" placeholder="주차장명을 입력해주세요">
																</div>
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
													<tr class="listAreaTr">
														<td class="text-center">${pl.parkingListNo}</td>
														<td class="parkingNo">${pl.parkingNo}</td>
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
														<td class="text-center">${pl.modifyDate}</td>
														<td class="text-center">														
															<c:if test="${pl.parkingListStatus=='변경중'}">
																<button data-toggle="modal" data-target=".bd-example-modal-lg-4" class="btn btn-info animation-on-hover btn-sm" 
																	onclick="detail(${varstatus.count - 1});">승인</button>&nbsp;&nbsp;	
																<button data-toggle="modal"
																	data-target=".bd-example-modal-lg-6"
																	class="btn btn-warning animation-on-hover btn-sm">반송</button>
															</c:if>
															<c:if test="${pl.parkingListStatus=='변경완료'}">
																승인완료
															</c:if>
															<c:if test="${pl.parkingListStatus=='반송'}">
																<button data-toggle="modal" data-target=".bd-example-modal-lg-10" style="width: 90%;"
																	class="btn btn-default animation-on-hover btn-sm" onclick="cancelReasonDetail()">반송 완료</button>								
															</c:if>
															<c:if test="${pl.parkingListStatus=='삭제완료'}">
																<button data-toggle="modal" data-target=".bd-example-modal-lg-12" style="width: 90%;"
																	class="btn btn-warning animation-on-hover btn-sm" onclick="">복구하기</button>								
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
				parkingListNo=0;
				parkingNo=0;
				
				/* parkingNo hide */
				$(".parkingNo").hide();
				
				/* hover 되었을 때 */
				$(".listAreaTr").mouseenter(function () {
					for (var i = 0; i < 10; i++) {
						$(this).children().eq(i).css({"background":"rgb(28, 28, 38)", "cursor":"pointer"});	
						parkingListNo = $(this).children().eq(0).text();	
						parkingNo = $(this).children().eq(1).text();	
					}	
				/* hover 해제 되었을 때 */	
				}).mouseout(function () {	
					for (var i = 0; i < 10; i++) {
						$(this).children().eq(i).css({"background":"rgb(39, 41, 61)"});	
					}
				});
	
				/* 리스트 행 클릭 */
				for (var i = 0; i < 5; i++) {
					for (var j = 0; j < 9; j++) {
						$(".listAreaTr").eq(i).children().eq(j).click(function () {
							$("#clickModal").click();	
							console.log("parkingListNo :"+parkingListNo)	
							console.log("parkingNo :"+parkingNo)	
							
							/* ajax */										
							$.ajax({
								url:"detailParkingLot.ad",
								type:"get",
								data:{parkingListNo:parkingListNo},
								success:function(data){
									console.log(data)
									$select = $("#ajaxModalTable");
									$("#ajaxModalTable").empty(); 
									
									var eDate = new Date(data.allianceDate);
									var allianceDate = eDate.getFullYear() + '/' + ('0' + eDate.getMonth()).slice(-2) + '/' + ('0' + eDate.getDate()).slice(-2);
									
									$select.append('<tbody>');
									$select.append('<tr>'
														+'<td>번호</td>'
														+'<td style="margin-left:20%">'+data.parkingListNo+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>사업자 아이디</td>'
														+'<td>'+data.memberId+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>주차장명</td>'
														+'<td>'+data.parkingListName+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>지역</td>'
														+'<td>'+data.parkingAddress.split(" ")[0]+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>주소</td>'
														+'<td>'+data.parkingAddress+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>평일운영시간</td>'
														+'<td>'+data.parkingListWeekdayStime+' ~ '+data.parkingListWeekdayEtime+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>주차구획수</td>'
														+'<td>'+data.parkingListParkingSize+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>유료/무료</td>'
														+'<td>'+data.parkingListPriceInfo+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>'+data.parkingListNtime+'분 당 가격</td>'
														+'<td>'+data.parkingListNprice+'원</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>지불방법</td>'
														+'<td>'+data.parkingListPayType+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>사업자 번호</td>'
														+'<td>'+data.phone+'</td>'
														+'</tr>');
									$select.append('<tr>'
														+'<td>신청일</td>'
														+'<td>'+allianceDate+'</td>'
														+'</tr>');
									if(data.parkingListStatus=='변경완료'){
										$select.append('<tr>'
												+'<td colspan="2" align="center">'
												+'<button type="button" class="btn btn-warning animation-on-hover"  data-target=".bd-example-modal-lg-2" data-toggle="modal">주차장 삭제</button>&nbsp;&nbsp;'
												+'<button type="button" class="btn btn-info animation-on-hover" data-dismiss="modal">닫기</button>'
												+'</tr>');
									}else{
										$select.append('<tr>'
												+'<td colspan="2" align="center">'
												+'<button data-toggle="modal" data-target=".bd-example-modal-lg-4" class="btn btn-info animation-on-hover">승인</button>&nbsp;&nbsp;'
												+'<button type="button" class="btn btn-warning animation-on-hover" data-dismiss="modal">닫기</button>'
												+'</tr>');
									}
									$select.append('</tbody>');
									
									/* parkingNo hide */
									$(".parkingNo").hide();
									
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
										<table class="table tablesorter" id="ajaxModalTable">
											<tbody>
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
															class="btn btn-warning animation-on-hover" id="deleteRemoveParkingLot">예</button>&nbsp;&nbsp;
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
		
		<!-- 삭제버튼 > 예 클릭 -->
		<script>
			$(function () {
				$("#deleteRemoveParkingLot").click(function () {
					location.href='deleteRemoveParkingLot.ad?parkingListNo='+parkingListNo+'&parkingNo='+parkingNo;
				});
			});
		</script>
		<!-- 삭제버튼 > 예 클릭 끝 -->
			
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
				
		<!-- 승인버튼 클릭 시 모달 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-4" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">주차장 승인</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="modalTable" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>정말로 승인 처리 하시겠습니까?</td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" data-target=".bd-example-modal-lg-5" data-toggle="modal" 
															class="btn btn-warning animation-on-hover" id="updateParkingLot">예</button>&nbsp;&nbsp;
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
		
		<!-- 승인버튼 클릭 -->
		<script>
			$(function () {
				$("#updateParkingLot").click(function () {
					location.href='updateParkingLot.ad?parkingListNo='+parkingListNo+'&parkingNo='+parkingNo;
				});
			});
		</script>
		<!-- 승인버튼 클릭 끝 -->
	
		<!-- 승인 버튼 -> 예 버튼 모달 -->
		<div class="modal fade bd-example-modal-lg-5" tabindex="-1"
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
										<td align="center"><b>정상적으로 승인 처리 되었습니다.</b></td>
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
			
		<!-- 복구버튼 클릭 시 모달 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-12" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">주차장 복구</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<table class="table tablesorter" id="modalTable" style="padding-bottom: 0px;">
											<tbody>
												<tr>
													<td>정말로 복구 하시겠습니까?</td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" data-target=".bd-example-modal-lg-13" data-toggle="modal" 
															class="btn btn-warning animation-on-hover" id="updateRecoverParkingLot">예</button>&nbsp;&nbsp;
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
		<!-- 복구버튼 클릭 시 모달 끝 -->
		
		<!-- 복구버튼 클릭 -->
		<script>
			$(function () {
				$("#updateRecoverParkingLot").click(function () {
					location.href='updateParkingLot.ad?parkingListNo='+parkingListNo+'&parkingNo='+parkingNo;
				});
			});
		</script>
		<!-- 복구버튼 클릭 끝 -->
	
		<!-- 복구 버튼 -> 예 버튼 모달 -->
		<div class="modal fade bd-example-modal-lg-13" tabindex="-1"
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
										<td align="center"><b>정상적으로 복구 되었습니다.</b></td>
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
		<!-- 복구 버튼 -> 예 버튼 모달 끝 --> 	
		
		<!-- 취소 사유 모달 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-6" tabindex="-1"
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
															placeholder="취소 사유를 입력해주세요" id="parkingListReason"
															class="form-control form-control-success"></textarea></td>
												</tr>
												<tr>
													<td align="center">
														<button type="button" id="deleteParkingLot"data-target=".bd-example-modal-lg-7" data-toggle="modal" 
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
			$(function() {
				$("#deleteParkingLot").click(function() {
					var parkingListReason = $("#parkingListReason").val();

					location.href = 'updateReturnParkingLot.ad?parkingListNo='+parkingListNo+'&parkingListReason='+parkingListReason;
				});
			});
		</script>
		<!-- 반송 > 보내기 버튼 클릭 시 끝 -->
				
		<!-- 반송 버튼 -> 보내기 버튼 모달 -->
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
										<td align="center"><b>정상적으로 반송 처리 되었습니다.</b></td>
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
		<!-- 반송 버튼 -> 보내기 버튼 모달 끝 -->
				
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
					url:"updateCancelReasonDetail.ad",
					type:"get",
					data:{parkingListNo:parkingListNo},
					success:function(data){

						$select = $("#ajaxCancelModalTable");
						$("#ajaxCancelModalTable").empty(); 
						
						$select.append('<tbody>');
						if(data.parkingListReason == null){
							$select.append('<tr>'
												+'<td align="center">반송 사유 없음</b></td>'
												+'</tr>');
						}else{
							$select.append('<tr>'
												+'<td align="center">'+data.parkingListReason+'</b></td>'
												+'</tr>');
						}
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
		<!-- ////////////////////////////////////// 모달 끝 //////////////////////////////////////// -->
		
		<!-- 테이블 날짜버튼 클릭 시 색상 변경 -->
		<script>
			$(function() {
				
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