<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
									<h4 class="card-title">쿠폰 검색</h4>
								</div>

								<form id="formList" method="POST"
									action="selectSearchCouponList.ad">
									<div class="card-body">
										<div class="table-responsive" style="overflow: hidden;" align="center">
											<table class="table tablesorter " id="" style="width: 40%">
												<tbody>
													<tr>
														<td align="right">상태구분</td>
														<td style="padding-left: 10%;">
															<div style="width: 60%;">
																<select class="custom-select nav-link dropdown-toggle"
																	id="selectStatus" name="selectStatus"
																	style="background-color: rgb(34, 42, 65);">
																	<option value="A" selected>전체</option>
																	<option value="I">신청중</option>
																	<option value="Y">발급완료</option>
																	<option value="N">발급취소</option>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td align="right">쿠폰구분</td>
														<td style="padding-left: 10%;">
															<div style="width: 60%;">
																<select class="custom-select nav-link dropdown-toggle"
																	id="selectCoupon" name="selectCoupon"
																	style="background-color: rgb(34, 42, 65);">
																	<option value="A" selected>전체</option>
																	<option value="O">오일할인</option>
																	<option value="P">퍼센트할인</option>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td align="right">아이디</td>
														<td style="padding-left: 10%;">
															<div class="row">
																<div class="form-group" style="margin-left: 4%; margin-top: 3%;">
																	<input type="text" class="form-control" id="memberId" 
																		name="memberId" placeholder="아이디를 입력해주세요" value="${memberId}">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td align="right">주차장명</td>
														<td style="padding-left: 10%;">
															<div class="row">
																<div class="form-group" style="margin-left: 4%; margin-top: 3%;">
																	<input type="text" class="form-control" id="parkingName" 
																		name="parkingName" placeholder="주차장을 입력해주세요" value="${parkingName}">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td colspan="2" align="center">
															<button type="submit"
																class="btn btn-info animation-on-hover" id="searchList">검색</button>
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
									<h4 class="card-title">쿠폰 검색결과</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table class="table tablesorter"  id="listTable">
											<thead class=" text-primary">
												<tr>
													<th class="text-center">번호</th>
													<th>사업자 아이디</th>
													<th>주차장명</th>
													<th>쿠폰명</th>
													<th class="text-center">쿠폰 구분</th>
													<th class="text-center">기간</th>
													<th class="text-center">총 개수</th>
													<th class="text-center">상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="c" items="${list}" varStatus="varstatus">
													<tr>
														<td class="text-center">${c.reqNo}</td>
														<td>${c.memberId}</td>
														<td>${c.parkingName}</td>
														<td>${c.couponName}</td>
														<td class="text-center">${c.couponType}</td>
														<td class="text-center">${c.couponStartDate} ~ ${c.couponEndDate}</td>
														<td class="text-center">${c.amount}</td>
														<c:if test="${c.couponReqStatus == '신청중'}">
															<td class="text-center">
																<button data-toggle="modal" onclick="selectNo(${varstatus.count - 1});"
																	data-target=".bd-example-modal-lg-2"
																	class="btn btn-info animation-on-hover btn-sm">승인</button>
																&nbsp;&nbsp;
																<button data-toggle="modal" onclick="selectNo(${varstatus.count - 1});"
																	data-target=".bd-example-modal-lg-1"
																	class="btn btn-warning animation-on-hover btn-sm">반송</button>
															</td>
														</c:if>
														<c:if test="${c.couponReqStatus == '반송'}">
															<td class="text-center">
																<button data-toggle="modal" onclick="selectRefuseReason(${varstatus.count - 1});"
																	data-target=".bd-example-modal-lg-7" style="width: 75%;"
																	class="btn btn-default animation-on-hover btn-sm">반송 완료</button>
															</td>
														</c:if>
														<c:if test="${c.couponReqStatus == '발급완료'}">
															<td class="text-center">
																발급 완료 &nbsp;&nbsp;
																<button data-toggle="modal" onclick="selectNo(${varstatus.count - 1});"
																	data-target=".bd-example-modal-lg-1"
																	class="btn btn-warning animation-on-hover btn-sm">반송</button>
															</td>
														</c:if>
													</tr>
												</c:forEach>								
											</tbody>
										</table>
										
										<!-- 페이징 버튼 영역 -->
										<div id="pagingArea" align="center">
											<!-- 첫번째 페이지 -->
											<c:if test="${pi.currentPage != 1}">
												<c:url var="blistFirst" value="selectSearchCouponList.ad">
													<c:param name="currentPage" value="1" />
													<c:param name="selectStatus" value="${selectStatus}" />
													<c:param name="selectCoupon" value="${selectCoupon}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="parkingName" value="${parkingName}" />
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
												<c:url var="blistBack" value="/selectSearchCouponList.ad">
													<c:param name="currentPage" value="${pi.currentPage-1}" />
													<c:param name="selectStatus" value="${selectStatus}" />
													<c:param name="selectCoupon" value="${selectCoupon}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="parkingName" value="${parkingName}" />
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
													<c:url var="blistCheck" value="selectSearchCouponList.ad">
														<c:param name="currentPage" value="${p}" />
														<c:param name="selectStatus" value="${selectStatus}" />
														<c:param name="selectCoupon" value="${selectCoupon}" />
														<c:param name="memberId" value="${memberId}" />
														<c:param name="parkingName" value="${parkingName}" />
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
												<c:url var="blistEnd" value="selectSearchCouponList.ad">
													<c:param name="currentPage" value="${pi.currentPage+1}" />
													<c:param name="selectStatus" value="${selectStatus}" />
													<c:param name="selectCoupon" value="${selectCoupon}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="parkingName" value="${parkingName}" />
												</c:url>
												<a href="${blistEnd}"><button
														class="btn btn-info animation-on-hover btn-sm">></button></a>
											</c:if>

											<!-- 끝 페이지 -->
											<c:if test="${pi.currentPage != pi.maxPage}">
												<c:url var="blistEnd2" value="selectSearchCouponList.ad">
													<c:param name="currentPage" value="${pi.maxPage}" />
													<c:param name="selectStatus" value="${selectStatus}" />
													<c:param name="selectCoupon" value="${selectCoupon}" />
													<c:param name="memberId" value="${memberId}" />
													<c:param name="parkingName" value="${parkingName}" />
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
	
		<!-- /////////////////////////////////// 모달 시작 /////////////////////////////////////////// -->
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
															placeholder="취소 사유를 입력해주세요" id="refuseReason"
															class="form-control form-control-success"></textarea></td>
												</tr>
												<tr>
													<td align="center">
														<button type="button"  id="deleteCoupon"
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
		
		<!-- 반송 > 보내기 버튼 클릭 시 reqNo 가져오기 -->
		<script>
			function selectNo(cu) {
				selectedNo = cu;
			}
			$(function() {
				$("#deleteCoupon").click(function() {
					var reqNo = $("#listTable td").parent().eq(selectedNo).children().eq(0).text();
					var refuseReason = $("#refuseReason").val();
					location.href = 'deleteCoupon.ad?reqNo='+ reqNo+'&refuseReason='+refuseReason;
				});
			});
		</script>
		<!-- 반송 > 보내기 버튼 클릭 시 reqNo 가져오기 -->
		
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
															class="btn btn-warning animation-on-hover" id="updateCoupon">예</button>&nbsp;&nbsp;
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
		
		<!-- 승인 > 예 버튼 클릭 시 reqNo 가져오기 -->
		<script>
			function selectNo(cu) {
				selectedNo = cu;
			}
			$(function() {
				$("#updateCoupon").click(function() {
					var reqNo = $("#listTable td").parent().eq(selectedNo).children().eq(0).text();
					location.href = 'updateCoupon.ad?reqNo='+ reqNo;
				});
			});
		</script>
		<!-- 승인 > 예 버튼 클릭 시 reqNo 가져오기 끝 -->
	
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
		
		<!-- 반송 완료 상세 보기 모달 --><div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-7" tabindex="-1"
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
											<table class="table tablesorter" id="ajaxModalTable" style="padding-bottom: 0px; color: white;">
												<tr>
													<td align="center"><b>쿠폰 반송 사유가 들어갑니다.</b></td>
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
			var reqNo = 0;
			function selectRefuseReason(no) {
				reqNo = $("#listTable td").parent().eq(no).children().eq(0).text();
				console.log("쿠폰번호: "+reqNo)
				
				$.ajax({
					url:"selectRefuseReason.ad",
					type:"get",
					data:{reqNo:reqNo},
					success:function(data){

						$select = $("#ajaxModalTable");
						$("#ajaxModalTable").empty(); 
						
						$select.append('<tbody>');
						$select.append('<tr>'
											+'<td align="center">'+data.refuseReason+'</b></td>'
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
	</c:if>
	
	<!-- 검색 후 값 유지 -->
	<input type="hidden" value="${selectStatus}" id="inputSelectStatus">
	<input type="hidden" value="${selectCoupon}" id="inputSelectCoupon">
	<script>
		$(function () {
			/* 자동 선택 - 상태구분 */
			for(var i=0; i<$("#selectStatus option").length; i++){
				if($("#inputSelectStatus").val() == $("#selectStatus option").eq(i).val()){
					$("#selectStatus").val($('#inputSelectStatus').val()).prop("selected", true);
				}							
			}
			/* 자동 선택 - 쿠폰구분 */
			for(var i=0; i<$("#selectCoupon option").length; i++){
				if($("#inputSelectCoupon").val() == $("#selectCoupon option").eq(i).val()){
					$("#selectCoupon").val($('#inputSelectCoupon').val()).prop("selected", true);
				}							
			}
		});
	</script>

</body>
</html>