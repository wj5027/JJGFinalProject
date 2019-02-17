<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
									<h4 class="card-title">문의게시판 검색</h4>
								</div>

								<form id="formList" method="POST"
									action="selectSearchBoardQnAList.ad">
									<div class="card-body">
										<div class="table-responsive" style="overflow: hidden;">
											<table class="table tablesorter " id="">
												<tbody>
													<tr>
														<td>구분</td>
														<td>
															<div style="width: 20%;">
																<select class="custom-select nav-link dropdown-toggle"
																	id="selectStatus" name="selectStatus"
																	style="background-color: rgb(34, 42, 65);">
																	<option value="A" selected>전체</option>
																	<option value="N">답변 작성하기</option>
																	<option value="Y">답변 수정하기</option>
																</select>
															</div>
														</td>
													</tr>
													<tr>
														<td>아이디</td>
														<td>
															<div class="row">
																<div class="form-group" style="margin-left: 1.5%;">
																	<input type="text" class="form-control" id="memberId"
																		name="mId" placeholder="아이디를 입력해주세요">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td>제목</td>
														<td>
															<div class="row">
																<div class="form-group" style="margin-left: 1.5%;">
																	<input type="text" class="form-control" id="boardTitle"
																		name="bTitle" placeholder="제목을 입력해주세요">
																</div>
															</div>
														</td>
													</tr>
													<tr>
														<td>등록일</td>
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
																	<input type="date" class="form-control" value=""
																		id="startDate" name="startDate">
																</div>
																<div class="form-group">
																	&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">~</b>&nbsp;&nbsp;&nbsp;
																</div>
																<div class="form-group">
																	<input type="date" class="form-control" value=""
																		id="endDate" name="endDate">
																</div>
															</div></td>
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
									<h4 class="card-title">문의게시판 리스트</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table class="table tablesorter " id="listTable">
											<thead class=" text-primary">
												<tr>
													<th class="text-center">번호</th>
													<th>아이디</th>
													<th>제목</th>
													<th>내용</th>
													<th class="text-center">조회수</th>
													<th class="text-center">등록일</th>
													<th class="text-center">상태</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach var="qna" items="${list}" varStatus="varstatus">
												<tr>
													<td class="text-center">${qna.bno}</td>
													<td>${qna.mId}</td>
													<td>
														<c:set var = "bTitle" value = "${qna.bTitle}"/>
														${fn:substring(bTitle, 0, 15)}
														<c:if test="${fn:length(bTitle) > 15}">...</c:if>	
													</td>
													<td>
														<c:set var = "bContext" value = "${qna.bContext}"/>
														${fn:substring(bContext, 0, 20)}
														<c:if test="${fn:length(bContext) > 20}">...</c:if>	
													</td>
													<td class="text-center">${qna.bViews}</td>
													<td class="text-center">${qna.createDate}</td>
													<td class="text-center">
														<c:if test="${qna.cancelYN!=null}">
															<button data-toggle="modal" style="color: gray;"
																data-target=".bd-example-modal-lg-2"
																class="btn btn-default animation-on-hover btn-sm" onclick="answer(${varstatus.count - 1});">답변수정</button>&nbsp;&nbsp;
														</c:if>
														<c:if test="${qna.cancelYN==null}">
															<button data-toggle="modal"
																data-target=".bd-example-modal-lg-2"
																class="btn btn-default animation-on-hover btn-sm" onclick="answer(${varstatus.count - 1});">답변하기</button>&nbsp;&nbsp;
														</c:if>
														<c:if test="${qna.status == 'Y'}">
															<button data-toggle="modal"
																data-target=".bd-example-modal-lg-3"
																class="btn btn-warning animation-on-hover btn-sm" onclick="selectNo(${varstatus.count - 1});">삭제</button>
														</c:if>
														<c:if test="${qna.status == 'N'}">
															<button data-toggle="modal"
																data-target=".bd-example-modal-lg-6"
																class="btn btn-info animation-on-hover btn-sm" onclick="selectNo(${varstatus.count - 1});">복구</button>
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
												<c:url var="blistFirst" value="selectBoardQnA.ad">
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
												<c:url var="blistBack" value="/selectBoardQnA.ad">
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
													<c:url var="blistCheck" value="selectBoardQnA.ad">
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
												<c:url var="blistEnd" value="selectBoardQnA.ad">
													<c:param name="currentPage" value="${pi.currentPage+1}" />
												</c:url>
												<a href="${blistEnd}"><button
														class="btn btn-info animation-on-hover btn-sm">></button></a>
											</c:if>

											<!-- 끝 페이지 -->
											<c:if test="${pi.currentPage != pi.maxPage}">
												<c:url var="blistEnd2" value="selectBoardQnA.ad">
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

		<!-- /////////////////////////////////// 모달 /////////////////////////////////////////// -->
		<!--답변-->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-2" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content" style="background: rgb(39, 41, 61);">
						<div class="modal-body" style="padding-bottom: 0px;">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">문의에 대한 답변 작성</h4>
								</div>
								<div class="card-body" style="padding-bottom: 0px;">
									<div class="table-responsive" style="overflow: hidden; padding-bottom: 0px;">
										<div id="answerModal">
											<table class="table tablesorter" id="ajaxModalTable" style="padding-bottom: 0px; color: white;">
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
		
		<!-- 답변 -->
		<script>
			var bno = 0;
			function answer(qna) {
				bno = $("#listTable td").parent().eq(qna).children().eq(0).text();
				console.log("게시판번호: "+bno)
				
				$.ajax({
					url:"answerBoardQnA.ad",
					type:"get",
					data:{bno:bno},
					success:function(data){
						console.log(data.bno)
						$select = $("#ajaxModalTable");
						$("#ajaxModalTable").empty(); 
						
						$select.append('<tbody>');
						$select.append('<tr>'
											+'<td>번호</td>'
											+'<td style="margin-left:20%">'+data.bno+'</td>'
											+'</tr>');
						$select.append('<tr>'
											+'<td>아이디</td>'
											+'<td>'+data.mId+'</td>'
											+'</tr>');
						$select.append('<tr>'
											+'<td>제목</td>'
											+'<td>'+data.bTitle+'</td>'
											+'</tr>');
						$select.append('<tr>'
											+'<td>내용</td>'
											+'<td>'+data.bContext+'</td>'
											+'</tr>');
						$select.append('<tr>'
											+'<td colspan="2">답변 작성</td>'
											+'</tr>');
						
						/* 관리자 답변 미작성 시 */
						if(data.replyContext == null){
							$select.append('<tr>'
											+'<td colspan="2">'
											+'<textarea id="textareaId" rows="60" cols="5" style="resize: none;" placeholder="문의에 대한 답변을 입력해주세요" class="form-control form-control-success"></textarea>'											
											+'</td>'
											+'</tr>');
							$select.append('<tr>'
											+'<td align="right">'
											+'<button type="button" data-toggle="modal" data-target=".bd-example-modal-lg-4" id="answerBoard" class="btn btn-warning animation-on-hover" onclick="answerBoard('+data.bno+','+data.mno+');">답변하기</button>&nbsp;&nbsp;'		
											+'</td>'										
											+'<td align="left">'
											+'<button type="button" class="btn btn-info animation-on-hover" data-dismiss="modal">취소하기</button>'
											+'</td>'
											+'</tr>');
							
						/* 관리자 답변 작성 시 */
						}else{
							$select.append('<tr>'
											+'<td colspan="2">'
											+'<textarea id="updateTextareaId" rows="60" cols="5" style="resize: none;" placeholder="문의에 대한 답변을 입력해주세요" class="form-control form-control-success">'+data.replyContext+'</textarea>'											
											+'</td>'
											+'</tr>');	
							$select.append('<tr>'
											+'<td align="right">'
											+'<button type="button" data-toggle="modal" data-target=".bd-example-modal-lg-8" id="answerBoard" class="btn btn-warning animation-on-hover" onclick="answerUpdateBoard('+data.replyNo+');">수정하기</button>&nbsp;&nbsp;'		
											+'</td>'										
											+'<td align="left">'
											+'<button type="button" class="btn btn-info animation-on-hover" data-dismiss="modal">취소하기</button>'
											+'</td>'
											+'</tr>');						
						}
						$select.append('</tbody>');
					},error:function(status){
						console.log(status);
					}
				});
			}
		</script>
		<!-- 답변 끝 -->

		<!-- 답변 > 예 버튼 클릭 시 memberNo 가져오기 -->
		<script>
			/* 답변 등록 (insert) */
			function answerBoard(bno,mno) {
				var textareaId = $("#textareaId").val();
				if(textareaId==""){
					return false;
				}else{
					location.href='insertAnswerBoard.ad?bno='+bno+'&mno='+mno+'&textareaId='+textareaId;									
				}
			}
			
			/* 답변 수정 (update) */
			function answerUpdateBoard(replyNo) {
				var updateTextareaId = $("#updateTextareaId").val();
				
				location.href='updateAnswerBoard.ad?updateTextareaId='+updateTextareaId+'&replyNo='+replyNo;		
			}
		</script>
		<!-- 답변 > 예 버튼 클릭 시 memberNo 가져오기 끝 -->

		<!-- 답변 > 예 버튼 -->
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
													<td align="center" colspan="2"><b>글을 입력헤주세요.</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-info animation-on-hover"
															data-dismiss="modal">확인</button></td>
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
		<!-- 답변 > 예 버튼 끝 -->
		
		<!-- 답변 수정 > 예 버튼 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-8" tabindex="-1"
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
													<td align="center" colspan="2"><b>글이 수정되었습니다.</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-info animation-on-hover"
															data-dismiss="modal">닫기</button></td>
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
		<!-- 답변 수정 > 예 버튼 끝 -->

		<!-- 삭제 -->
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
										<td align="center" colspan="2"><b>해당 게시판을 삭제 시키시겠습니까?</b></td>
									</tr>
									<tr>
										<td align="center"><button type="button"
												id="deleteBoard" data-toggle="modal"
												data-target=".bd-example-modal-lg-5"
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
		<!-- 삭제 끝 -->

		<!-- 삭제 버튼 > 예 버튼 클릭 시 memberNo 가져오기 -->
		<script>
			function selectNo(qna) {
				console.log(qna)
				selectedNo = qna;
			}
			$(function() {
				$("#deleteBoard").click(function() {
					var boardNo = $("#listTable td").parent().eq(selectedNo).children().eq(0).text();

					location.href = 'deleteBoardQnA.ad?boardNo='+ boardNo;
				});
			});
		</script>
		<!-- 삭제 버튼 > 예 버튼 클릭 시 memberNo 가져오기 끝 -->

		<!-- 삭제 > 예 버튼 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-5" tabindex="-1"
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
													<td align="center" colspan="2"><b>정상적으로 삭제 되었습니다.</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-info animation-on-hover"
															data-dismiss="modal" onclick="location.href='selectBoardQnA.ad'">닫기</button></td>
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
		<!-- 삭제 > 예 버튼 끝 -->	
		
		<!-- 복구 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-6" tabindex="-1"
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
													<td align="center" colspan="2"><b>해당 게시판을 복구 시키시겠습니까?</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															id="updateRecoverBoard" data-toggle="modal"
															data-target=".bd-example-modal-lg-7"
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
		<!-- 복구 끝 -->

		<!-- 복구 > 예 버튼 클릭 시 memberNo 가져오기 -->
		<script>
			$(function () {
				$("#updateRecoverBoard").click(function () {
					var boardNo = $("#listTable td").parent().eq(selectedNo).children().eq(0).text();
					console.log(boardNo)
					
					location.href='updateRecoverBoardQnA.ad?boardNo='+boardNo;
				});
			});
		</script>
		<!-- 복구 > 예 버튼 클릭 시 memberNo 가져오기 끝 -->

		<!-- 복구 > 예 버튼 -->
		<div class="modalDetail">
			<div class="modal fade bd-example-modal-lg-7" tabindex="-1"
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
													<td align="center" colspan="2"><b>정상적으로 복구 되었습니다.</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-info animation-on-hover"
															data-dismiss="modal" onclick="location.href='selectBoardQnA.ad'">닫기</button></td>
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
		<!-- 복구 > 예 버튼 끝 -->	
		<!-- /////////////////////////////////// 모달 끝 /////////////////////////////////////////// -->
	</c:if>


	<!-- 검색 -->
	<script>
		var selectedNo = 0;
		$(function() {
			/* 구분 */
			$("#selectStatus").click(function() {
				var selected = $("#selectStatus option:selected").val();
				console.log(selected);
			});

			/* 아이디 */
			$("#memberId").click(function() {
				var memberId = $("#memberId").val();
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

</body>
</html>