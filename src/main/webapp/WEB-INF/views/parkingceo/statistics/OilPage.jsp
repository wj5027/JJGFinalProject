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
                <h4 class="card-title"> 오일/환전 통계</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">검색 조건</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02">
    						<option selected style="color: black;">카테고리를 선택해주세요</option>
    						<option value="1" style="color: black;">오일만</option>
    						<option value="2" style="color: black;">환전만</option>
    						<option value="3" style="color: black;">오일/환전</option>
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
		
		<!-- 그래프 -->
      
 		<div class="card" style="height: 600px; width: 100%;">
 			<div class="card-body">
 			<canvas id="lineChartExample"></canvas>
 			
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
	
	function parkingceoLogin(){
		location.href="parkingceoLogin.pc";	
	}
	
	gradientChartOptionsConfiguration =  {
			  maintainAspectRatio: false,
			  legend: {
			        display: false
			   },

			   tooltips: {
			     backgroundColor: '#fff',
			     titleFontColor: '#333',
			     bodyFontColor: '#666',
			     bodySpacing: 4,
			     xPadding: 12,
			     mode: "nearest",
			     intersect: 0,
			     position: "nearest"
			   },
			   responsive: true,
			   scales:{
			     yAxes: [{
			       barPercentage: 1.6,
			           gridLines: {
			             drawBorder: false,
			               color: 'rgba(29,140,248,0.0)',
			               zeroLineColor: "transparent",
			           },
			           ticks: {
			             suggestedMin:50,
			             suggestedMax: 110,
			               padding: 20,
			               fontColor: "#9a9a9a"
			           }
			         }],

			     xAxes: [{
			       barPercentage: 1.6,
			           gridLines: {
			             drawBorder: false,
			               color: 'rgba(220,53,69,0.1)',
			               zeroLineColor: "transparent",
			           },
			           ticks: {
			               padding: 20,
			               fontColor: "#9a9a9a"
			           }
			         }]
			     }
			};

			var ctx = document.getElementById("lineChartExample").getContext("2d");

			var gradientStroke = ctx.createLinearGradient(0,230,0,50);

			gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
			gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
			gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors

			var data = {
			  labels: ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'],
			  datasets: [{
			    label: "Data",
			    fill: true,
			    backgroundColor: gradientStroke,
			    borderColor: '#d048b6',
			    borderWidth: 2,
			    borderDash: [],
			    borderDashOffset: 0.0,
			    pointBackgroundColor: '#d048b6',
			    pointBorderColor:'rgba(255,255,255,0)',
			    pointHoverBackgroundColor: '#d048b6',
			    pointBorderWidth: 20,
			    pointHoverRadius: 4,
			    pointHoverBorderWidth: 15,
			    pointRadius: 4,
			    data: [ 60,110,70,100, 75, 90, 80, 100, 70, 80, 120, 80],
			  }]
			};

			var myChart = new Chart(ctx, {
			  type: 'line',
			  data: data,
			  options: gradientChartOptionsConfiguration
			});
	

</script>

</html>