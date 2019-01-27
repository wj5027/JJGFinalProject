<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<tr>
						<td colspan="2"><b>기간</b></td>
						<td colspan="2"><b>지역</b></td>
						<td colspan="2"><b>주차장명</b></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td colspan="2">19/01/02~<br>19/01/10</td>
						<td colspan="2">서울</td>
						<td colspan="2">어반 플레이스</td>
						<td colspan="2">
							<button class="btn btn-info btn-sm" onclick="#">위치</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">19/02/01~<br>19/02/11</td>
						<td colspan="2">서울</td>
						<td colspan="2">동해 빌딩 주차장</td>
						<td colspan="2">
							<button class="btn btn-info btn-sm" onclick="#">위치</button>
						</td>
					</tr>
				</tbody>
			</table>
		  </div>
        </div>
      </div>
    </div>
  </div>
 
</body>

</html>