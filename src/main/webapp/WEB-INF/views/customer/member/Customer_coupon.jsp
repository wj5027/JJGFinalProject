<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=103820f64442cfd4cf984f298b7c8470"></script>
</head>

<body class="">
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    <div class="main-panel">
      <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>
      
      <div class="content">
        <div class="row">
          <div class="card-body">
            <table class="table tablesorter " id="">
				<tbody align="center">
					<c:if test="${ empty requestScope.CouponList }">
						<tr>
							<th colspan="3">로그인을 해주세요!</th>
						</tr>
					</c:if>
					<c:if test="${ !empty requestScope.CouponList }">
						<tr>
							<th>기간</th>
							<th>주차장명</th>
							<th></th>
							<th>할인</th>
						</tr>
						<c:forEach var="coupon" items="${ requestScope.CouponList }" varStatus="st">
						<tr>
							<td>${ coupon.startDay }~<br>${ coupon.endDay }</td>
							<td>어반 플레이스</td>
							<td>
								<button class="btn btn-info btn-sm" onclick="moveParkingSpot(${ coupon.latitude }, ${ coupon.longitude })">위치</button>
							</td>
							<td>
								<c:if test="${ coupon.couponOdiscount ne 0 }">
								${ coupon.couponOdiscount }오일
								</c:if>
								<c:if test="${ coupon.couponPdiscount ne 0 }">
								${ coupon.couponPdiscount.toString().substring(2) }%
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		  </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<script type="text/javascript">
	function moveParkingSpot(lat, lon) {
		location.href="moveParkingSpot.cu?requestLat=" + lat + "&requestlon=" + lon;
	}
</script>

</html>