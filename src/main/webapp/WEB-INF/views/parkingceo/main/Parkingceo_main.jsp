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
							<div class="btn-group">
						  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    주차장
						  </button>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="#">주차장1</a>
						    <a class="dropdown-item" href="#">주차장2</a>
						    <a class="dropdown-item" href="#">주차장3</a>
						    <div class="dropdown-divider"></div>
						    <a class="dropdown-item" href="#">주차장4</a>
						  </div>
						</div>
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
						        <input type="text" value="입차할 번호를 넣어주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" type="button">입차</button></td>
                      </tr>    
                      <tr>
                      	<td>
                      	<div class="card" style="margin-top: 20px;">
						    <div class="card-body">
						      <div class="form-group has-success">
						        <input type="text" value="출차할 번호를 넣어주세요" class="form-control form-control-success" />
						      </div>
						    </div>
						  </div>
                      	</td>
                      	<td align="center"><button class="btn btn-info animation-on-hover" type="button">출차</button></td>
                      </tr>                 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
      
      	<button type="button" class="btn btn-info" data-toggle="modal" data-target=".bd-example-modal-lg-1">Large modal</button>

<div class="modal fade bd-example-modal-lg-1" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      ㅎㅇ
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
      <br>
    </div>
  </div>
</div>
      
      <!-- content -->
      </div>
    </div>
    
    
    
    
  </div>

  
</body>
<script type="text/javascript">

	function goMain(){
		location.href="parkingceoMain.pc";
	}


</script>

</html>