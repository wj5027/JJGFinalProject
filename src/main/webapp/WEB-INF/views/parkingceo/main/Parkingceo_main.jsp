<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	
</style>
</head>

<body class="">
  <div class="wrapper">
  <jsp:include page="/WEB-INF/views/parkingceo/common/Sidebar.jsp"></jsp:include>


    <div class="main-panel">
      <!-- Navbar -->
  		<jsp:include page="/WEB-INF/views/parkingceo/common/menubar.jsp"></jsp:include>
      <!-- End Navbar -->
      
      <div	 class="content">
      
      <!-- 내 주차장 검색 기능 -->
        <div class="row">
		  <div class="col-md-12" height="500px" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 주차장 별 간편 주차 현황</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">[고객]님의 주차장을 선택해주세요</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02">
    						<option selected style="color: black;">주차장을 선택해주세요</option>
    						<option value="1" style="color: black;">주차장1</option>
    						<option value="2" style="color: black;">주차장2</option>
    						<option value="3" style="color: black;">주차장3</option>
  						</select>
						</td>
                      </tr>  
                      <tr>
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button">검색</button></td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        
        <!--  내 주차장 현황 리스트 -->
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">내 주차장 현황</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                        <th>	입출차번호</th>
                        <th>회원 ID</th>
                        <th>회원 이름</th>
                        <th>차량번호</th>
                        <th>주차 시작 시간</th>
                        <th>요금</th>
                        <th>구분</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>asjk158</td>
                        <td>임수철</td>
                        <td>25-588가</td>
                        <td>15:54</td>
                        <td>3000</td>
                        <td>예약/일반</td>
                       </tr>
                    </tbody>
                    <tfoot>
                    	<tr>
                    	<th colspan="7"><div align="center"><button class="btn btn-info animation-on-hover" type="button">새로고침</button></div></th>
                    	</tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      
      	<!-- 간편 입출차 시스템 -->
    <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 간편 입/출차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">현재 [고객]님의 현재 주차 대수/전체 주차 대수</div></td>
                        <td align="center">
							100/150
						</td>
                      </tr>  
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="입차할 번호를 넣어주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-1" type="button">입차</button></td>
                      </tr>    
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="출차할 번호를 넣어주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-2" type="button">출차</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
      
      


<!-- 입차 모달 -->
<div class="modal fade bd-example-modal-lg-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
      <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 입차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">현재 입차한 [사용자]님의 차번호</div></td>
                        <td align="center">
							차번호쓰
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">[사용자 이름]</div></td>
                        <td align="center">
							임수철
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">입차 시간</div></td>
                        <td align="center">
							입차시간쓰
						</td>
                      </tr>   
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" placeholder="인증 번호를 입력해주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"> <button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-3" type="button">입력</button>
                      	</td>
                      </tr>
                      <tr>
                      	<td align="center" colspan="2"><button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td>
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
   <!--  출차 모달 -->   
 <div class="modal fade bd-example-modal-lg-2" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
 <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
      <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 출차 시스템</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center" width="500px"><div style="color: white;">현재 출차할 [사용자]님의 차번호</div></td>
                        <td align="center">
							차번호쓰
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">[사용자 이름]</div></td>
                        <td align="center">
							임수철
						</td>
                      </tr>
                       <tr>
                        <td align="center" width="500px"><div style="color: white;">입차시간 - 출차 시간</div></td>
                        <td align="center">
							입차시간 - 출차시간쓰
						</td>
                      </tr>   
                    	<tr>
                        <td align="center" width="500px"><div style="color: white;">결제금액</div></td>
                        <td align="center">
							결제금액쓰
						</td>
                      </tr>                 
                    </tbody>
                  </table>
                  <div align="center">
                  	<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-4" type="button" >현장 결제</button>
                  	<button type="button" class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-5" type="button" >포인트 결제</button>
                  	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  </div>
                  
                </div>
              </div>
            </div>
            </div>
    	</div>
  </div>
</div>     


	<!-- 인증번호 눌렀을시 -->
      <div class="modal fade bd-example-modal-lg-3" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>정상적으로 확인이 되었습니다.</b></td></tr>
						<tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>     


<!-- 현장 걸제 눌렀을시 -->
      <div class="modal fade bd-example-modal-lg-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>현장 결제를 진행합니다 확실하십니까?</b></td></tr>
						<tr><td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-6" type="button" >확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>






<!-- 포인트 결제 눌렀을시 -->
     <div class="modal fade bd-example-modal-lg-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>포인트 결제를 진행합니다 확실하십니까?</b></td></tr>
						<tr><td align="center"><button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-6" type="button">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>



<!-- 결제 확인 눌렀을시 -->
            <div class="modal fade bd-example-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>정상적으로 확인이 되었습니다.</b></td></tr>
						<tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>    
      
      <!-- content -->
      </div>
    </div>
    
    
    
    
  </div>

  
</body>
<script type="text/javascript">


	//페이지 이동 함수
	function goMain(){
		location.href="parkingceoMain.pc";
	}
	
	function goExchangePage(){
		location.href = "parkingceoExchange.pc";
	}
	
	function insertParkingPage(){
		location.href = "insertParkingPage.pc";
	}
	
	function goOilStatisticsPage(){
		location.href = "goOilStatisticsPage.pc";
	}
	
	function goParkingListStatisticsPage(){
		location.href = "goParkingListStatisticsPage.pc";
	}
	
	function goBestPakerStatisticsPage(){
		location.href = "goBestPakerStatisticsPage.pc";
	}
	
	function goParkingDetailListPage(){
		location.href = "goParkingDetailListPage.pc";
	}
	
	function goPromotionPage(){
		location.href = "goPromotionPage.pc";
	}
	
	function goExchangeMoneyPage(){
		location.href = "goExchangeMoneyPage.pc";
	}
	
	function goNotePage(){
		location.href = "goNotePage.pc";
	}

</script>

</html>