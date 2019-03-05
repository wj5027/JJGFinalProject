<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			<h2 class="card-title">예약 내역</h2><br>
			<div style="padding-bottom: 0px; overflow: auto; height: 400px; border: 1px solid white; border-radius: 5px;">
            <table class="table tablesorter " id="">
				<tbody align="center" style="overflow-y:auto; overflow-x:hidden;">
					<c:if test="${ empty requestScope.reservList }">
						<tr>
							<th colspan="3">로그인을 해주세요!</th>
						</tr>
					</c:if>
					<c:if test="${ !empty requestScope.reservList }">
						<tr>
							<th>주차장</th>
							<th>날짜</th>
							<th>상태</th>
						</tr>
 						<c:forEach var="reserve" items="${ requestScope.reservList }" varStatus="st">
						<tr>
							<td>${ reserve.parkingName }</td>
							<td>
								${ reserve.reserveTime.substring(4, 6) }월 ${ reserve.reserveTime.substring(6, 8) }일<br>${ reserve.reserveTime.substring(8, 10) } : ${ reserve.reserveTime.substring(10, 12) }
							</td>
							<td>
								<c:if test="${ reserve.status eq 'Y' }">
									승인 대기
									<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".cancle_reserv" onclick="enrollNo(${ reserve.resNo });">취소</button>
								</c:if>
								<c:if test="${ reserve.status eq '승인' }">
									승인
									<c:if test="${ reserve.ChkDate eq 'true' }">
									<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".cancle_reserv" onclick="enrollNo(${ reserve.resNo });">취소</button>
									</c:if>
								</c:if>
								<c:if test="${ reserve.status eq '취소' }">
									취소
								</c:if>
								<c:if test="${ reserve.status eq '완료' }">
									완료
								</c:if>
								<c:if test="${ reserve.status eq '거절' }">
									거절
									<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".cancle_reason" onclick="cancelReason(${ reserve.resNo })">사유</button>
								</c:if>
							</td>
						</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			</div>
			<br>
			<div align="center">
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="listNoCheck" value="reserv.cu">
					<c:param name="pageNo" value="${ pi.currentPage - 1 }" />
				</c:url>
				<a href='${ listNoCheck }' style="color: white;">[이전]</a> &nbsp; &nbsp;
			</c:if>
			
			
			<c:if test="${ pi.currentPage >= 1 }">
			<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
				<c:if test="${p eq pi.currentPage}">
					<font color='white' size='4'><b>${ p }</b></font> &nbsp; &nbsp;
				</c:if>
				<c:if test="${p ne pi.currentPage}">
					<c:url var="listNoCheck" value="reserv.cu">
						<c:param name="pageNo" value="${p}" />
					</c:url>
					<a href='${ listNoCheck }' style="color: white;">${ p }</a> &nbsp; &nbsp;
				</c:if>
			</c:forEach>
			</c:if>
			
			
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="listNoCheck" value="reserv.cu">
					<c:param name="pageNo" value="${ pi.currentPage + 1 }'" />
				</c:url>
				<a href='${ listNoCheck }' style="color: white;">[다음]</a>
			</c:if>
			</div>
			
		  </div>
        </div>
      </div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 예약 취소 모달 -->
            <div class="modal fade cancle_reserv" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody id="ShowModal">
			                  <tr>
			                  	<td align="center"><br><br>
			                  		예약 취소 시 소모된 포인트는<br>
			                  		1시간 이내의 취소이거나<br>
			                  		예약 시간이 지났는데도 승인처리 되지 않은<br>
			                  		경우에만 환불처리 됩니다.<br><br>
			                  		정말로 환불 하시겠습니까?
			                  	<br><br><br></td>
			                  </tr>
			                  <tr><td align="center">
			                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelButton()">닫기</button>
			                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelReserv();">확인</button>
			                  </td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 예약 취소 사유 모달 -->
            <div class="modal fade cancle_reason" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody id="">
			            	  <tr align="center">
			            	  	<th style="color: white;">사유</th>
			            	  </tr>
			                  <tr>
			                  	<td align="center" id="reasonTable"></td>
			                  </tr>
			                  <tr><td align="center">
			                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="">닫기</button>
			                  </td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    </div>
  </div>
 
</body>
<script type="text/javascript">
	var resNo = 0;
	function enrollNo(enrollResNo) {
		resNo = enrollResNo;
	}
	function cancelButton() {
		resNo = 0;
	}
	function cancelReserv() {
		$.ajax({
			url:"updateCancelReserve.cu",
			type:"post",
			data:{resNo:resNo},
			success:function(data){
				console.log("예약 " + data);
				
				window.location.reload(); // 새로고침
			},
			error:function(status){
				console.log(status);
			}
			
		});
	}
	function cancelReason(selectResNo) {
		$.ajax({
			url:"selectCancelReason.cu",
			type:"post",
			data:{resNo:selectResNo},
			success:function(data){
				
				$("#reasonTable").html("");
				
				$("#reasonTable").append(data.substring(0, 16) + "<br><br>");
				
				$("#reasonTable").append(data.substring(19));
				
				$("#reasonTable").append("<br><br>");
			},
			error:function(status){
				console.log(status);
			}
			
		});
	}
</script>

</html>