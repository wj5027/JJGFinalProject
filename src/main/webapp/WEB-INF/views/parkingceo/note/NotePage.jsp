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
                <h4 class="card-title"> 쪽지함</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">현황을 보시려면 우측의 박스를 클릭해주세요</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect01" name="selectNote">
    						<option selected style="color: black;" value="insertParkingStatus">쪽지함을 선택해주세요</option>
    						<option value="insertParkingStatus" style="color: black;">주차장 등록 현황</option>
    						<option value="exchangeParkingStatus" style="color: black;">주차장 정보 신청 현황</option>
    						<option value="insertCouponStatus" style="color: black;">쿠폰 신청 현황</option>
    						<option value="insertExchangeMoneyStatus" style="color: black;">환전 신청 현황</option>
  						</select>
						</td>
                      </tr>
                                   <tr>
                      	<td align="center"><div style="color: white;">기간을 선택해주세요(기본 3개월)</div></td>
                      	<td><button class="btn btn-info btn-round btn-sm selectBtn" onclick="chkBtnValue(1);">오늘</button>
                      			<button class="btn btn-info btn-round btn-sm selectBtn" onclick="chkBtnValue(7);">1주일</button>
                      			<button class="btn btn-info btn-round btn-sm selectBtn" onclick="chkBtnValue(30);">1개월</button>
                      			<button class="btn btn-info btn-round btn-sm selectBtn" onclick="chkBtnValue(90);">3개월</button>
                      			<button class="btn btn-info btn-round btn-sm selectBtn" onclick="chkBtnValue(180);">6개월</button>
                      			<button class="btn btn-info btn-round btn-sm selectBtn" onclick="chkBtnValue(365);">1년</button>
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
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button" onclick="selectNoteBtn();">검색</button></td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        
        <!--  내 쪽지함 현황 리스트 -->
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">검색한 결과</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary" id="theadId">
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
                    <tbody id="tbodyId">
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
      
 
      <input type="hidden"  value="${loginUser.member_name }" id="hiddenMemberName">
      
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
	
	//페이징 처리할 변수 선언 및 기간 변수 선언
	var currentPage = 0;
	var btnValue = 90;
	
	//기간 버튼을 눌렀을시 값 변경되는 메소드
	function chkBtnValue(data){
		btnValue = data;
	}
	
	//검색 버튼 메소드
	function selectNoteBtn(data){
		var selectBox = $("#inputGroupSelect01 option:selected").val();
		/* currentPage = data; */
		$.ajax({
			url : "selectNoteList.pc",
			type : "post",
			data : {btnValue:btnValue,selectBox:selectBox,currentPage:currentPage},
			success: function(data){
				console.log(data);
				
				$theadId = $("#theadId");
				$theadId.html('');
				$tbodyId = $("#tbodyId");
				$tbodyId.html('');
				$theadTr = $("<tr>");
				//var memberName = $("#hiddenMemberName").val();
				
				if(data.hmap.listType == 'selectParkingList'){
					$member_nameTh = $("<th>").text("사업자 이름");
					$parking_nameTh = $("<th>").text("주차장 명");
					$parking_addressTh = $("<th>").text("주차장 주소");
					$parking_typeTh = $("<th>").text("주차장 유형");
					$parking_sizeTh = $("<th>").text("주차장 크기");
					$price_infoTh = $("<th>").text("요금 정보");
					$pay_typeTh = $("<th>").text("결제 방법");
					
					$theadTr.append($member_nameTh);
					$theadTr.append($parking_nameTh);
					$theadTr.append($parking_addressTh);
					$theadTr.append($parking_typeTh);
					$theadTr.append($parking_sizeTh);
					$theadTr.append($price_infoTh);
					$theadTr.append($pay_typeTh);
					
					$theadId.append($theadTr);
					
					for(var i in data.hmap.list){
						
					}
					
					
				}else if(data.hmap.listType == 'selectExchangeParkingList'){
					
				}else if(data.hmap.listType == 'selectCouponList'){
					
				}else{
					//selectExchangeMoneyList 일떄
					
				}
			},
			error:function(data){
				console.log("데이터 통신 실패");
			}
		});
	}
	

</script>

</html>