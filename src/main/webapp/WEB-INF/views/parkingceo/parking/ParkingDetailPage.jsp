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
		  <div class="col-md-12" style="height: 500px;" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 입/출차 내역</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">우측의 박스를 클릭해주세요</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02">
    						<option selected style="color: black;">박스를 클릭해주세요</option>
    						<option value="1" style="color: black;">입차만</option>
    						<option value="2" style="color: black;">출차만</option>
    						<option value="3" style="color: black;">입/출차</option>
  						</select>
						</td>
                      </tr>
                      <tr>
                      	<td align="center"><div style="color: white;">기간을 선택해주세요(기본 3개월)</div></td>
                      	<td><button class="btn btn-info btn-round btn-sm">오늘</button>
                      			<button class="btn btn-info btn-round btn-sm">1주일</button>
                      			<button class="btn btn-info btn-round btn-sm">1개월</button>
                      			<button class="btn btn-info btn-round btn-sm">3개월</button>
                      			<button class="btn btn-info btn-round btn-sm">6개월</button>
                      			<button class="btn btn-info btn-round btn-sm">1년</button>
                      	</td>
                      </tr>
                                           <tr>
                      <td colspan="2">
                       <ul>
                        <li>박스를 클릭하지 않으시고 검색 버튼을 누르면 제일 상위 박스 카테고리가 검색됩니다.</li>
                       
                       </ul>
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

        
        <!--  입출차 내역 리스트 -->
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">검색한 결과</h4>
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