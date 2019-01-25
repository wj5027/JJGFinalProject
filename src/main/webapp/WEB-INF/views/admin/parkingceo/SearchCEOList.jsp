<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<div class="col-md-12" height="500px">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">사업자 조회하기</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<tbody>
											<tr>
												<td>지역</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-info animation-on-hover dropdown-toggle"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false">전체</button>
														<div class="dropdown-menu dropdown-black">
															<a class="dropdown-item" href="#">서울</a> <a
																class="dropdown-item" href="#">대전</a> <a
																class="dropdown-item" href="#">대구</a> <a
																class="dropdown-item" href="#">부산</a>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>아이디</td>
												<td>
													<div class="row">
														<div class="form-group">
															<input type="text" class="form-control"
																id="exampleInputPassword1" placeholder="아이디를 입력해주세요">
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td>등록일</td>
												<td>
													<button class="btn btn-info animation-on-hover btn-sm">1일</button>
													&nbsp;&nbsp;
													<button class="btn btn-info animation-on-hover btn-sm">7일</button>
													&nbsp;&nbsp;
													<button class="btn btn-info animation-on-hover btn-sm">1개월</button>
													&nbsp;&nbsp;
													<button class="btn btn-info animation-on-hover btn-sm">6개월</button>
													&nbsp;&nbsp;
													<button class="btn btn-info animation-on-hover btn-sm">1년</button>
													&nbsp;&nbsp;

													<div class="row">
														<div class="form-group">
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
								<h4 class="card-title">사업자 조회하기</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive" style="overflow: hidden;">
									<table class="table tablesorter " id="">
										<thead class=" text-primary">
											<tr>
												<th>계정번호</th>
												<th>아이디</th>
												<th>이름</th>
												<th>전화번호</th>
												<th class="text-center">보유 포인트</th>
												<th>주소</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>Niger</td>
												<td>니제르</td>
												<td>010-1234-5678</td>
												<td class="text-center">7000</td>
												<td>서울시 강남구 역삼동</td>
												<td>특이사항 없음</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Red</td>
												<td>레드</td>
												<td>010-0001-5678</td>
												<td class="text-center">12000</td>
												<td>서울시 강남구 삼성동</td>
												<td>특이사항 없음</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Blue</td>
												<td>블루</td>
												<td>010-0012-5678</td>
												<td class="text-center">3200</td>
												<td>서울시 강남구 역삼동</td>
												<td>특이사항 없음</td>
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

</body>
</html>