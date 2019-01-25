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
    <div class="sidebar" style="background: rgb(49, 49, 49) !important;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <h3 align="center" style="margin-top:10px">지주갑</h3>
          <a href="javascript:void(0)" class="simple-text logo-mini">
            JJG
          </a>
          <a href="javascript:void(0)" class="simple-text logo-normal">
           ㅇㅇㅇ님 환영합니다
          </a>
        </div>
        <ul class="nav">
          <li class="active ">
            <a href="./coupon.cu">
              <i class="tim-icons icon-chart-bar-32"></i>
            	쿠폰함
            </a>
          </li>
          <li>
            <a href="./oil.cu">
              <i class="tim-icons icon-atom"></i>
              	오일
            </a>
          </li>
          <li>
            <a href="./reserv.cu">
              <i class="tim-icons icon-satisfied"></i>
              	예약내역
            </a>
          </li>
          <li>
            <a href="./map.cu">
              <i class="tim-icons icon-single-copy-04"></i>
             	 지도
            </a>
          </li> 
          <li>
          <a href="./customerNotice.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	공지사항
            </a>
          </li>
           <li>
          <a href="./review.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 후기
            </a>
          </li>  
           <li>
          <a href="./qna.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 문의
            </a>
          </li>           
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle d-inline">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div>
	            <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" style="color: white;"></i>
	            </button>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button class="btn btn-link" data-toggle="modal" data-target=".bd-example-modal-lg-6"><i class="fas fa-microphone-alt" style="color: white;"></i>
	            </button>
            </div>
            <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 음성 인식 모달 -->
            <div class="modal fade bd-example-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body">
			        <div class="table-responsive"  style="overflow: hidden;">
			          <table class="table tablesorter " id="">
			            <tbody>
			                  <tr><td align="center"><b><i class="fas fa-microphone-alt" style="color: white;"></i> &nbsp;&nbsp; : &nbsp;&nbsp; 안녕하세요??</b></td></tr>
			                  <tr>
			                  	<td align="center">
			                  		검색 결과
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
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
                <button class="btn btn-link" id="search-button" onclick="location.href='customerInfo.cu'" style="color: gray;"><i class="tim-icons icon-badge"></i>&nbsp;&nbsp;Info Edit
                  <span class="d-lg-none d-md-block"></span>
                </button>
              </li>
              <li class="search-bar input-group">
                <button class="btn btn-link" id="search-button" style="color: gray;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;LogOut
                  <span class="d-lg-none d-md-block"></span>
                </button>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
      
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