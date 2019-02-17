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
						<div class="col-md-12" height="500px">
							<div class="card ">
								<div class="card-header">
									<h4 class="card-title">필터 설정</h4>
								</div>
								<div class="card-body">
									<div class="table-responsive" style="overflow: hidden;">
										<table class="table tablesorter " id="" style="width: 50%"
											align="center">
											<tbody>
												<tr>
													<td colspan="3" align="center">
														<div class="form-group">
															<select multiple class="form-control" id="selectFilter" style="height: 200px;">																
																<c:forEach var="f" items="${list}" varStatus="varstatus">
																	<option style="font-size: 15px;" value="${varstatus.count}">${varstatus.count}. ${f.fContent} (등록일: ${f.fDate})</option>
																</c:forEach>
															</select>
														</div>
													</td>
												</tr>
												<tr>
													<td>필터 입력</td>
													<td>
														<div class="row">
															<div class="form-group">
																<input type="text" class="form-control" id="fContent"
																	style="margin-top: 3%" placeholder="금지할 단어를 입력해주세요">
															</div>
														</div>
													</td>
													<td align="right">
														<button data-toggle="modal" id="addModalBtn"
															data-target=".bd-example-modal-lg-2"
															class="btn btn-info animation-on-hover btn-sm">추가</button>
														&nbsp;&nbsp;
														<button data-toggle="modal" id="delModalBtn"
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
													<td align="center"><button type="button" id="addBtn"
															class="btn btn-default animation-on-hover"
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
										<td align="center"><button type="button" id="delBtn"
												class="btn btn-warning animation-on-hover"
												data-dismiss="modal">예</button></td>&nbsp;&nbsp;
										<td align="center"><button type="button"
												class="btn btn-info animation-on-hover" data-dismiss="modal">아니오</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 삭제 버튼 클릭 시 모달 끝 -->
		
		<!-- 삭제버튼 클릭 시 모달 -->
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
													<td align="center"><b>삭제되었습니다.</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-default animation-on-hover"
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
		<!-- 삭제버튼 클릭 시 모달 끝 -->
		
		<!-- 삭제버튼 클릭 시(아무값도 선택되지 않았울 때) 모달 -->
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
													<td align="center"><b>삭제할 단어를 선택주세요</b></td>
												</tr>
												<tr>
													<td align="center"><button type="button"
															class="btn btn-default animation-on-hover"
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
		<!-- 삭제버튼 클릭 시(아무값도 선택되지 않았울 때) 모달 끝 -->
		
		<!-- 스크립트에서 제어하기 위해 버튼을 숨겨서 만들어 놓는다. -->
		<button id="hiddenDelBtn" data-toggle="modal" data-target=".bd-example-modal-lg-5" type="button" style="display: none;"></button>
		<button id="hiddenDelResultBtn" data-toggle="modal" data-target=".bd-example-modal-lg-7" type="button" style="display: none;"></button>
		
		<!-- option value 값 개수 -->
		<input type="hidden" value="${listCount}" id="listCount">
		
		<!-- 필터 적용 -->
		<script>
			var num = parseInt($("#listCount").val()); // value값을 주기 위한 변수 선언
			$(function() {
				/* 추가 버튼 클릭 시 */
				$("#addModalBtn").click(function() {
					var fContent = $("#fContent").val(); // 입력한 값을 담는다.		
					
					/* 텍스트 입력 여부에 따른 모달 출력 */
					if(fContent.length > 0){
						$("#addModalBtn").attr('data-target','.bd-example-modal-lg-2');
						location.href='insertFilter.ad?fContent='+fContent;		
						$("#selectFilter").append('<option value='+num+'>'+ fContent+ '</option>');
						num++;
					}else{
						$("#addModalBtn").attr('data-target','.bd-example-modal-lg-4');		
					}
					
					$("#fContent").val(""); // 텍스트 안의 내용을 비워준다.		
				});
	
				/* 삭제 버튼 클릭 시 */
				$("#delBtn").click(function() { // 모달에서 삭제버튼 클릭 시
					var selectFilter = $("#selectFilter option:selected").val();
					var fContent = $("#selectFilter option:selected").text().split(" ")[1];
					console.log("fContent : "+fContent)
	
					/* 목록 선택 여부에 따른 모달 출력 */
					if(typeof selectFilter != "undefined"){
						$("#selectFilter option:selected").remove();
						location.href='deleteFilter.ad?fContent='+fContent;		
						$("#hiddenDelResultBtn").click();	
					}else{
						$("#hiddenDelBtn").click();	
					}
				});
			});
		</script>
		<!-- 필터 적용 끝 -->

	</c:if>
</body>
</html>