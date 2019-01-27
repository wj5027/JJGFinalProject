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
						<td><b>주차장</b></td>
						<td><b>예약번호</b></td>
						<td><b>상태</b></td>
					</tr>
					<tr>
						<td>a</td>
						<td>
							<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".check_reserv" onclick="#">확인</button>
						</td>
						<td>
							완료
							&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".cancle_reserv" onclick="#">취소</button>
						</td>
					</tr>
					<tr>
						<td>a</td>
						<td>
							<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".check_reserv" onclick="#">확인</button>
						</td>
						<td>
							완료
							&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".cancle_reserv" onclick="#">취소</button>
						</td>
					</tr>
					<tr>
						<td>a</td>
						<td>
							<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".check_reserv" onclick="#">확인</button>
						</td>
						<td>
							완료
							&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info btn-sm" data-toggle="modal" data-target=".cancle_reserv" onclick="#">취소</button>
						</td>
					</tr>
				</tbody>
			</table>
			
		  </div>
        </div>
      </div>
        <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 예약번호 확인 모달 -->
            <div class="modal fade check_reserv" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px;">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px;">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody>
			                  <tr>
			                  	<td align="center"><br>
			                  		예약 번호
			                  	<br><br></td>
			                  </tr>
			                  <tr>
			                  	<td align="center">
			                  		1156
			                  	</td>
			                  </tr>
			                  <tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 예약 취소 모달 -->
            <div class="modal fade cancle_reserv" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody>
			                  <tr>
			                  	<td align="center"><br><br><br>
			                  		예약이 취소되었습니다.
			                  	<br><br><br><br></td>
			                  </tr>
			                  <tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
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

</html>