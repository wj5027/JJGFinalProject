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
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button" onclick="selectNoteBtn(1);">검색</button></td>
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
                      </tr>
                    </thead>
                    <tbody id="tbodyId">
                      <tr>
                        <td align="center">결과값이 출력됩니다.</td>
                       </tr>
                    </tbody>
                    <tfoot id="tfootId">
                    	<tr>
                    		<th>
                    		
                    		</th>
                    	</tr>
                    </tfoot>
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
	function parkingceoLogin(){
		location.href="parkingceoLogin.pc";	
	}
	
	
	
	//페이징 처리할 변수 선언 및 기간 변수 선언
	var currentPage = 1;
	var btnValue = 90;
	
	//기간 버튼을 눌렀을시 값 변경되는 메소드
	function chkBtnValue(data){
		btnValue = data;
	}
	
	//검색 버튼 메소드
	function selectNoteBtn(data){
		var selectBox = $("#inputGroupSelect01 option:selected").val();
		currentPage = data;
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
				$tfootId = $("#tfootId");
				$tfootId.html('');
				$theadTr = $("<tr>");
				
				//회원 이름을 가져오기 위한 변수
				var memberName = $("#hiddenMemberName").val();
				
				//thead 설정
				if(data.hmap.listType == 'selectParkingList'){
					$member_nameTh = $("<th>").text("사업자 이름");
					$parking_nameTh = $("<th>").text("주차장 명");
					$parking_addressTh = $("<th>").text("주차장 주소");
					$parking_typeTh = $("<th>").text("주차장 유형");
					$parking_sizeTh = $("<th>").text("주차장 크기");
					$open_daysTh = $("<th>").text("운영 요일")
					$price_infoTh = $("<th>").text("요금 정보");
					$pay_typeTh = $("<th>").text("결제 방법");
					
					$theadTr.append($member_nameTh);
					$theadTr.append($parking_nameTh);
					$theadTr.append($parking_addressTh);
					$theadTr.append($parking_typeTh);
					$theadTr.append($parking_sizeTh);
					$theadTr.append($open_daysTh);
					$theadTr.append($price_infoTh);
					$theadTr.append($pay_typeTh);
					
					$theadId.append($theadTr);
					
					//tbody 리스트 설정
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						$member_nameTd = $("<td>").text(memberName);
						$parking_nameTd = $("<td>").text(data.hmap.list[i].PARKING_NAME);
						$parking_addressTd = $("<td>").text(data.hmap.list[i].ADDRESS);
						$parking_typeTd = $("<td>").text(data.hmap.list[i].PARKING_TYPE);
						$parking_sizeTd = $("<td>").text(data.hmap.list[i].PARKING_SIZE+"대");
						$open_daysTd = $("<td>").text(data.hmap.list[i].OPEN_DAYS);
						$price_infoTd = $("<td>").text(data.hmap.list[i].PRICE_INFO);
						$pay_typeTd = $("<td>").text(data.hmap.list[i].PAY_TYPE);
						
						$tbodyTr.append($member_nameTd);
						$tbodyTr.append($parking_nameTd);
						$tbodyTr.append($parking_addressTd);
						$tbodyTr.append($parking_typeTd);
						$tbodyTr.append($parking_sizeTd);
						$tbodyTr.append($open_daysTd);
						$tbodyTr.append($price_infoTd);
						$tbodyTr.append($pay_typeTd);
						
						$tbodyId.append($tbodyTr);
					}
					
					//페이징
					$pageTr = $('<tr>');
					$pageTh = $("<th colspan='8'>");
					$pageUl = $('<ul class="pagination pagination-lg justify-content-center">');
					$previousLi = $('<li class="page-item">');
					$previousA = $('<a class="page-link" onclick="firstPageMove(' +1+')" aria-label="Previous">');
					$previousHidden = $('<span aria-hidden="true">').text('<<');
					$previousSrOnly = $('<span class="sr-only">').text('Previous');
					
					$previousA.append($previousHidden);
					$previousA.append($previousSrOnly);
					$previousLi.append($previousA);
					$pageUl.append($previousLi);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisableLi = $('<li class="page-item">');
						$leftAtag = $('<a class="page-link" href="#">').text("<");
						$leftIconDisableLi.append($leftAtag);
						$pageUl.append($leftIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage-1);
						$leftIconAbleLi = $('<li class="page-item">');
						$leftAtag2 = $('<a class="page-link" onclick="beforePageMove('+currentPage+')">').text("<");
						$leftIconAbleLi.append($leftAtag2);
						$pageUl.append($leftIconAbleLi);
					}
					
					for(var i = data.pi.startPage ; i <= data.pi.endPage; i++){
						if(i == data.pi.currentPage){
							$currentIconAbleLi = $('<li class="page-item">');
							$currentAtag = $('<a class="page-link" href="#">').text(i);
							$currentIconAbleLi.append($currentAtag);
							$pageUl.append($currentIconAbleLi);
						}else{
							$currentIconAbleLi2 = $('<li class="page-item">');
							$currentAtag2 = $('<a class="page-link" onclick="onePageMove('+ i +')">').text(i);
							$currentIconAbleLi2.append($currentAtag2);
							$pageUl.append($currentIconAbleLi2);
						}
					}				
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisableLi = $('<li class="page-item">');
						$rightAtag = $('<a class="page-link" href="#">').text(">");
						$rightIconDisableLi.append($rightAtag);
						$pageUl.append($rightIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage+1);
						$rightIconAbleLi = $('<li class="page-item">');
						$rightAtag2 = $('<a class="page-link" onclick="nextPageMove('+currentPage+')">').text(">");
						$rightIconAbleLi.append($rightAtag2);
						$pageUl.append($rightIconAbleLi);
					}					

					$nextLi = $('<li class="page-item">');
					$nextA = $('<a class="page-link" onclick="lastPageMove(' +data.pi.maxPage	+')" aria-label="Next">');
					$nextHidden = $('<span aria-hidden="true">').text('>>');
					$nextSrOnly = $('<span class="sr-only">').text('Next');
					
					$nextA.append($nextHidden);
					$nextA.append($nextSrOnly);
					$nextLi.append($nextA);
					$pageUl.append($nextLi);
					$pageTh.append($pageUl);
					$pageTr.append($pageTh);
					
					$tfootId.append($pageTr);
					
					
					//selectExchangeParkingList일시
				}else if(data.hmap.listType == 'selectExchangeParkingList'){
					//thead 설정
					
						$member_nameTh = $("<th>").text("사업자 이름");
						$parking_nameTh = $("<th>").text("주차장 명");
						$open_daysTh = $("<th>").text("운영 요일");
						$price_infoTh = $("<th>").text("요금 정보");
						$pay_typeTh = $("<th>").text("결제 방법");
						$reasonTh = $("<th>").text("반송 사유");
						$statusTh = $("<th>").text("신청 상태");
						
						$theadTr.append($member_nameTh);
						$theadTr.append($parking_nameTh);
						$theadTr.append($open_daysTh);
						$theadTr.append($price_infoTh);
						$theadTr.append($pay_typeTh);
						$theadTr.append($reasonTh);
						$theadTr.append($statusTh);
						
						$theadId.append($theadTr);
						
						//tbody 리스트 설정
						for(var i in data.hmap.list){
							$tbodyTr = $("<tr>");
							$member_nameTd = $("<td>").text(memberName);
							$parking_nameTd = $("<td>").text(data.hmap.list[i].PARKING_LIST_NAME);
							$open_daysTd = $("<td>").text(data.hmap.list[i].PARKING_LIST_OPEN_DAYS);
							$price_infoTd = $("<td>").text(data.hmap.list[i].PARKING_LIST_PRICE_INFO);
							$pay_typeTd = $("<td>").text(data.hmap.list[i].PARKING_LIST_PAY_TYPE);
							if(data.hmap.list[i].hasOwnProperty('PARKING_LIST_REASON') == false){
								$reasonTd = $("<td>").text("");
							}else{
								$reasonTd = $("<td>").text(data.hmap.list[i].PARKING_LIST_REASON);
							}
							$statusTd = $("<td>").text(data.hmap.list[i].PARKING_LIST_STATUS);								
						
							
							$tbodyTr.append($member_nameTd);
							$tbodyTr.append($parking_nameTd);
							$tbodyTr.append($open_daysTd);
							$tbodyTr.append($price_infoTd);
							$tbodyTr.append($pay_typeTd);
							$tbodyTr.append($reasonTd);
							$tbodyTr.append($statusTd);
							
							$tbodyId.append($tbodyTr);
						}
						
						//페이징
						$pageTr = $('<tr>');
						$pageTh = $("<th colspan='6'>");
						$pageUl = $('<ul class="pagination pagination-lg justify-content-center">');
						$previousLi = $('<li class="page-item">');
						$previousA = $('<a class="page-link" onclick="firstPageMove(' +1+')" aria-label="Previous">');
						$previousHidden = $('<span aria-hidden="true">').text('<<');
						$previousSrOnly = $('<span class="sr-only">').text('Previous');
						
						$previousA.append($previousHidden);
						$previousA.append($previousSrOnly);
						$previousLi.append($previousA);
						$pageUl.append($previousLi);
						
						if(data.pi.currentPage <= 1){
							$leftIconDisableLi = $('<li class="page-item">');
							$leftAtag = $('<a class="page-link" href="#">').text("<");
							$leftIconDisableLi.append($leftAtag);
							$pageUl.append($leftIconDisableLi);
						}else{
							currentPage = (data.pi.currentPage-1);
							$leftIconAbleLi = $('<li class="page-item">');
							$leftAtag2 = $('<a class="page-link" onclick="beforePageMove('+currentPage+')">').text("<");
							$leftIconAbleLi.append($leftAtag2);
							$pageUl.append($leftIconAbleLi);
						}
						
						for(var i = data.pi.startPage ; i <= data.pi.endPage; i++){
							if(i == data.pi.currentPage){
								$currentIconAbleLi = $('<li class="page-item">');
								$currentAtag = $('<a class="page-link" href="#">').text(i);
								$currentIconAbleLi.append($currentAtag);
								$pageUl.append($currentIconAbleLi);
							}else{
								$currentIconAbleLi2 = $('<li class="page-item">');
								$currentAtag2 = $('<a class="page-link" onclick="onePageMove('+ i +')">').text(i);
								$currentIconAbleLi2.append($currentAtag2);
								$pageUl.append($currentIconAbleLi2);
							}
						}				
						
						if(data.pi.currentPage >= data.pi.maxPage){
							$rightIconDisableLi = $('<li class="page-item">');
							$rightAtag = $('<a class="page-link" href="#">').text(">");
							$rightIconDisableLi.append($rightAtag);
							$pageUl.append($rightIconDisableLi);
						}else{
							currentPage = (data.pi.currentPage+1);
							$rightIconAbleLi = $('<li class="page-item">');
							$rightAtag2 = $('<a class="page-link" onclick="nextPageMove('+currentPage+')">').text(">");
							$rightIconAbleLi.append($rightAtag2);
							$pageUl.append($rightIconAbleLi);
						}					

						$nextLi = $('<li class="page-item">');
						$nextA = $('<a class="page-link" onclick="lastPageMove(' +data.pi.maxPage	+')" aria-label="Next">');
						$nextHidden = $('<span aria-hidden="true">').text('>>');
						$nextSrOnly = $('<span class="sr-only">').text('Next');
						
						$nextA.append($nextHidden);
						$nextA.append($nextSrOnly);
						$nextLi.append($nextA);
						$pageUl.append($nextLi);
						$pageTh.append($pageUl);
						$pageTr.append($pageTh);
						
						$tfootId.append($pageTr);
						
					
				}else if(data.hmap.listType == 'selectCouponList'){
					//thead 설정
					
					$coupon_nameTh = $("<th>").text("쿠폰 이름");
					$parking_nameTh = $("<th>").text("신청한 주차장 명");
					$coupon_typeTh = $("<th>").text("쿠폰 타입");
					$start_dayTh = $("<th>").text("시작일");
					$end_dayTh = $("<th>").text("종료일");
					$amountTh = $("<th>").text("갯수");
					$reasonTh = $("<th>").text("반송 사유");
					$statusTh = $("<th>").text("신청 현황");
					
					$theadTr.append($coupon_nameTh);
					$theadTr.append($parking_nameTh);
					$theadTr.append($coupon_typeTh);
					$theadTr.append($start_dayTh);
					$theadTr.append($end_dayTh);
					$theadTr.append($amountTh);
					$theadTr.append($reasonTh);
					$theadTr.append($statusTh);
					
					$theadId.append($theadTr);
					
					//tbody 리스트 설정
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						$coupon_nameTd = $("<td>").text(data.hmap.list[i].COUPON_NAME);
						$parking_nameTd = $("<td>").text(data.hmap.list[i].PARKING_NAME);
						$coupon_typeTd = $("<td>").text(data.hmap.list[i].COUPON_TYPE);
						$start_dayTd = $("<td>").text((1900+data.hmap.list[i].COUPON_START_DATE.year)+"년 "
								+data.hmap.list[i].COUPON_START_DATE.month+"월 "
								+data.hmap.list[i].COUPON_START_DATE.date+"일");
						$end_dayTd = $("<td>").text((1900+data.hmap.list[i].COUPON_END_DATE.year)+"년 "
								+data.hmap.list[i].COUPON_END_DATE.month+"월 "
								+data.hmap.list[i].COUPON_END_DATE.date+"일");
						$amountTd = $("<td>").text(data.hmap.list[i].AMOUNT+"개");						
						if(data.hmap.list[i].hasOwnProperty('REFUSE_REASON') == false){
							$reasonTd = $("<td>").text("");
						}else{
							$reasonTd = $("<td>").text(data.hmap.list[i].REFUSE_REASON);
						}
						$statusTd = $("<td>").text(data.hmap.list[i].COUPON_REQ_STATUS);
						
						$tbodyTr.append($coupon_nameTd);
						$tbodyTr.append($parking_nameTd);
						$tbodyTr.append($coupon_typeTd);
						$tbodyTr.append($start_dayTd);
						$tbodyTr.append($end_dayTd);
						$tbodyTr.append($amountTd);
						$tbodyTr.append($reasonTd);
						$tbodyTr.append($statusTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					$pageTr = $('<tr>');
					$pageTh = $("<th colspan='8'>");
					$pageUl = $('<ul class="pagination pagination-lg justify-content-center">');
					$previousLi = $('<li class="page-item">');
					$previousA = $('<a class="page-link" onclick="firstPageMove(' +1+')" aria-label="Previous">');
					$previousHidden = $('<span aria-hidden="true">').text('<<');
					$previousSrOnly = $('<span class="sr-only">').text('Previous');
					
					$previousA.append($previousHidden);
					$previousA.append($previousSrOnly);
					$previousLi.append($previousA);
					$pageUl.append($previousLi);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisableLi = $('<li class="page-item">');
						$leftAtag = $('<a class="page-link" href="#">').text("<");
						$leftIconDisableLi.append($leftAtag);
						$pageUl.append($leftIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage-1);
						$leftIconAbleLi = $('<li class="page-item">');
						$leftAtag2 = $('<a class="page-link" onclick="beforePageMove('+currentPage+')">').text("<");
						$leftIconAbleLi.append($leftAtag2);
						$pageUl.append($leftIconAbleLi);
					}
					
					for(var i = data.pi.startPage ; i <= data.pi.endPage; i++){
						if(i == data.pi.currentPage){
							$currentIconAbleLi = $('<li class="page-item">');
							$currentAtag = $('<a class="page-link" href="#">').text(i);
							$currentIconAbleLi.append($currentAtag);
							$pageUl.append($currentIconAbleLi);
						}else{
							$currentIconAbleLi2 = $('<li class="page-item">');
							$currentAtag2 = $('<a class="page-link" onclick="onePageMove('+ i +')">').text(i);
							$currentIconAbleLi2.append($currentAtag2);
							$pageUl.append($currentIconAbleLi2);
						}
					}				
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisableLi = $('<li class="page-item">');
						$rightAtag = $('<a class="page-link" href="#">').text(">");
						$rightIconDisableLi.append($rightAtag);
						$pageUl.append($rightIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage+1);
						$rightIconAbleLi = $('<li class="page-item">');
						$rightAtag2 = $('<a class="page-link" onclick="nextPageMove('+currentPage+')">').text(">");
						$rightIconAbleLi.append($rightAtag2);
						$pageUl.append($rightIconAbleLi);
					}					

					$nextLi = $('<li class="page-item">');
					$nextA = $('<a class="page-link" onclick="lastPageMove(' +data.pi.maxPage	+')" aria-label="Next">');
					$nextHidden = $('<span aria-hidden="true">').text('>>');
					$nextSrOnly = $('<span class="sr-only">').text('Next');
					
					$nextA.append($nextHidden);
					$nextA.append($nextSrOnly);
					$nextLi.append($nextA);
					$pageUl.append($nextLi);
					$pageTh.append($pageUl);
					$pageTr.append($pageTh);
					
					$tfootId.append($pageTr);
					
				}else{
					//selectExchangeMoneyList 일떄
					
					//thead 설정

					$member_nameTh = $("<th>").text("사업자 이름");
					$oilTh = $("<th>").text("환전 오일");
					$exchangeMoneyTh = $("<th>").text("환전 액수");
					$application_dayTh = $("<th>").text("신청 날짜");
					$approval_dayTh = $("<th>").text("결과 날짜");
					$account_holderTh = $("<th>").text("예금주");
					$bankTh = $("<th>").text("신청 은행명");
					$account_numberTh = $("<th>").text("신청 계좌번호");
					$resaonTh = $("<th>").text("반송사유");
					$statusTh = $("<th>").text("신청 현황");
					
					$theadTr.append($member_nameTh);
					$theadTr.append($oilTh);
					$theadTr.append($exchangeMoneyTh);
					$theadTr.append($application_dayTh);
					$theadTr.append($approval_dayTh);
					$theadTr.append($account_holderTh);
					$theadTr.append($bankTh);
					$theadTr.append($account_numberTh);
					$theadTr.append($resaonTh);
					$theadTr.append($statusTh);
					
					$theadId.append($theadTr);
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						$member_nameTd = $("<td>").text(memberName);
						$oilTd = $("<td>").text(data.hmap.list[i].OIL);
						$exchangeMoneyTd = $("<td>").text(data.hmap.list[i].CASH);
						$application_dayTd = $("<td>").text((1900+data.hmap.list[i].APPLICATION_DATE.year)+"년 "
								+data.hmap.list[i].APPLICATION_DATE.month+"월 "
								+data.hmap.list[i].APPLICATION_DATE.date+"일");
						$approval_dayTd = $("<td>").text((1900+data.hmap.list[i].APPROVAL_DATE.year)+"년 "
								+data.hmap.list[i].APPROVAL_DATE.month+"월 "
								+data.hmap.list[i].APPROVAL_DATE.date+"일");
						$account_holderTd = $("<td>").text(data.hmap.list[i].ACCOUNT_HOLDER);
						$bankTd = $("<td>").text(data.hmap.list[i].ACCOUNT_HOLDER);
						$account_numberTd = $("<td>").text(data.hmap.list[i].ACCOUNT_HOLDER);
						
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$reasonTd = $("<td>").text("");
						}else{
							$reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);
						}
						$statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						
						$tbodyTr.append($member_nameTd);
						$tbodyTr.append($oilTd);
						$tbodyTr.append($exchangeMoneyTd);
						$tbodyTr.append($application_dayTd);
						$tbodyTr.append($approval_dayTd);
						$tbodyTr.append($account_holderTd);
						$tbodyTr.append($bankTd);
						$tbodyTr.append($account_numberTd);
						$tbodyTr.append($reasonTd);
						$tbodyTr.append($statusTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					$pageTr = $('<tr>');
					$pageTh = $("<th colspan='10'>");
					$pageUl = $('<ul class="pagination pagination-lg justify-content-center">');
					$previousLi = $('<li class="page-item">');
					$previousA = $('<a class="page-link" onclick="firstPageMove(' +1+')" aria-label="Previous">');
					$previousHidden = $('<span aria-hidden="true">').text('<<');
					$previousSrOnly = $('<span class="sr-only">').text('Previous');
					
					$previousA.append($previousHidden);
					$previousA.append($previousSrOnly);
					$previousLi.append($previousA);
					$pageUl.append($previousLi);
					
					if(data.pi.currentPage <= 1){
						$leftIconDisableLi = $('<li class="page-item">');
						$leftAtag = $('<a class="page-link" href="#">').text("<");
						$leftIconDisableLi.append($leftAtag);
						$pageUl.append($leftIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage-1);
						$leftIconAbleLi = $('<li class="page-item">');
						$leftAtag2 = $('<a class="page-link" onclick="beforePageMove('+currentPage+')">').text("<");
						$leftIconAbleLi.append($leftAtag2);
						$pageUl.append($leftIconAbleLi);
					}
					
					for(var i = data.pi.startPage ; i <= data.pi.endPage; i++){
						if(i == data.pi.currentPage){
							$currentIconAbleLi = $('<li class="page-item">');
							$currentAtag = $('<a class="page-link" href="#">').text(i);
							$currentIconAbleLi.append($currentAtag);
							$pageUl.append($currentIconAbleLi);
						}else{
							$currentIconAbleLi2 = $('<li class="page-item">');
							$currentAtag2 = $('<a class="page-link" onclick="onePageMove('+ i +')">').text(i);
							$currentIconAbleLi2.append($currentAtag2);
							$pageUl.append($currentIconAbleLi2);
						}
					}				
					
					if(data.pi.currentPage >= data.pi.maxPage){
						$rightIconDisableLi = $('<li class="page-item">');
						$rightAtag = $('<a class="page-link" href="#">').text(">");
						$rightIconDisableLi.append($rightAtag);
						$pageUl.append($rightIconDisableLi);
					}else{
						currentPage = (data.pi.currentPage+1);
						$rightIconAbleLi = $('<li class="page-item">');
						$rightAtag2 = $('<a class="page-link" onclick="nextPageMove('+currentPage+')">').text(">");
						$rightIconAbleLi.append($rightAtag2);
						$pageUl.append($rightIconAbleLi);
					}					

					$nextLi = $('<li class="page-item">');
					$nextA = $('<a class="page-link" onclick="lastPageMove(' +data.pi.maxPage	+')" aria-label="Next">');
					$nextHidden = $('<span aria-hidden="true">').text('>>');
					$nextSrOnly = $('<span class="sr-only">').text('Next');
					
					$nextA.append($nextHidden);
					$nextA.append($nextSrOnly);
					$nextLi.append($nextA);
					$pageUl.append($nextLi);
					$pageTh.append($pageUl);
					$pageTr.append($pageTh);
					
					$tfootId.append($pageTr);
					
					
				}
			},
			error:function(data){
				console.log("데이터 통신 실패");
			}
		});
	}
	
	function firstPageMove(data){
		selectNoteBtn(data);		
	}
	function beforePageMove(data){
		selectNoteBtn(data);		
	}
	function onePageMove(data){
		selectNoteBtn(data);		
	}
	function nextPageMove(data){
		selectNoteBtn(data);		
	}
	function lastPageMove(data){
		selectNoteBtn(data);		
	}
	
	

</script>

</html>