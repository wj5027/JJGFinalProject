<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                        <td align="center"><div style="color: white;">주차장 명</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect01" style="width: 500px;" name="parking_no">
    						<c:if test="${not empty  CurrentParkinglist}">
    						<option selected style="color: black;" value=${CurrentParkinglist[0].parking_no } id="pakringOption1">주차장을 선택해주세요</option>
    						<c:set var="number" value="1"/>
    						<c:forEach var="list" items="${CurrentParkinglist }" varStatus="status">
    							<option value=${list.parking_no } style="color: black;">${list.parking_name }</option>
    						</c:forEach>
    						</c:if>
    						<c:if test="${empty CurrentParkinglist }">
    							<option selected style="color: black;" value="none">등록하신 주차장이 없습니다.</option>
    						</c:if>
  						</select>
						</td>
                      </tr>
                      <tr>
                        <td align="center"><div style="color: white;">우측의 박스를 클릭해주세요</div></td>
                        <td>
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02" name="selectParkingDetail">
    						<option selected style="color: black;"  value="inputCar">박스를 클릭해주세요</option>
    						<option value="inputCar" style="color: black;">입차만</option>
    						<option value="outputCar" style="color: black;">출차만</option>
    						<option value="inOutputCar" style="color: black;">입/출차</option>
  						</select>
						</td>
                      </tr>
                      <tr>
                      	<td align="center"><div style="color: white;">기간을 선택해주세요(기본 3개월)</div></td>
                      	<td><button class="btn btn-info btn-round btn-sm" onclick="chkBtnValue(1);">오늘</button>
                      			<button class="btn btn-info btn-round btn-sm" onclick="chkBtnValue(7);">1주일</button>
                      			<button class="btn btn-info btn-round btn-sm" onclick="chkBtnValue(30);">1개월</button>
                      			<button class="btn btn-info btn-round btn-sm" onclick="chkBtnValue(90);">3개월</button>
                      			<button class="btn btn-info btn-round btn-sm" onclick="chkBtnValue(180);">6개월</button>
                      			<button class="btn btn-info btn-round btn-sm" onclick="chkBtnValue(365);">1년</button>
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

        
        <!--  입출차 내역 리스트 -->
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
	
	function goReservationPage(){
		location.href="parkingceoReservation.pc";
	}
	
	
	//페이징 처리할 변수
	var currentPage = 1;
	//기본 버튼값 초기화
	var btnValue = 90;
	
	//기간 버튼을 눌렀을때 값 변경 메소드
	function chkBtnValue(data){
		btnValue = data;
		
	}
	
	//검색 버튼 메소드
	function selectNoteBtn(data){
		currentPage = data;
		var parkingSelectBox = $("#inputGroupSelect01 option:selected").val();
		var inOutputSelectBox = $("#inputGroupSelect02 option:selected").val();
		$.ajax({
			url:"searchParkingDetail.pc",
			type:"post",
			data:{currentPage:currentPage,
				btnValue:btnValue,
				parkingSelectBox:parkingSelectBox,
				inOutputSelectBox:inOutputSelectBox},
			success : function(data){
				console.log(data);
				
				$theadId = $("#theadId");
				$theadId.html('');
				$tbodyId = $("#tbodyId");
				$tbodyId.html('');
				$tfootId = $("#tfootId");
				$tfootId.html('');
				$theadTr = $("<tr>");
				
				//입차일시 설정
				if(data.hmap.listType == 'inputCar'){
					//thead 설정
					$member_idTh = $("<th>").text("사용자 아이디");
					$member_nameTh = $("<th>").text("사용자명");
					$member_phoneTh = $("<th>").text("사용자 휴대폰번호");
					$member_carNoTh = $("<th>").text("사용자 차번호");
					$parking_startTimeTh = $("<th>").text("주차 시작 시간");
					$parking_useTimeTh = $("<th>").text("주차 사용 시간")
					$parking_endTimeTh = $("<th>").text("주차 종료 시간");
					$parking_statusTh = $("<th>").text("주차 상태");
					$exit_payTh = $("<th>").text("정산 요금");
					$entry_typeTh = $("<th>").text("예약/일반");
					$pay_typeTh = $("<th>").text("예약번호");
					
					$theadTr.append($member_idTh);
					$theadTr.append($member_nameTh);
					$theadTr.append($member_phoneTh);
					$theadTr.append($member_carNoTh);
					$theadTr.append($parking_startTimeTh);
					$theadTr.append($parking_useTimeTh);
					$theadTr.append($parking_endTimeTh);
					$theadTr.append($parking_statusTh);
					$theadTr.append($exit_payTh);
					$theadTr.append($entry_typeTh);
					$theadTr.append($pay_typeTh);
					
					
					$theadId.append($theadTr);
					
					
					//tbody 설정
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						if(data.hmap.list[i].hasOwnProperty('MEMBER_ID') == false){
							$member_idTd = $("<td>").text("아이디 없음");
						}else{
							$member_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						}
						if(data.hmap.list[i].hasOwnProperty('MEMBER_NAME') == false){
							$member_nameTd = $("<td>").text("X");
						}else{
							$member_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						}
						$member_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$member_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$parking_startTimeTd =  $("<td>").text((1900+data.hmap.list[i].START_TIME.year)+"년 "
								+(data.hmap.list[i].START_TIME.month+1)+"월 "+
								data.hmap.list[i].START_TIME.date + "일 " +
								data.hmap.list[i].START_TIME.hours+"시 " +
								data.hmap.list[i].START_TIME.minutes+"분"
								);
						if(data.hmap.list[i].hasOwnProperty('HOURS')==false || data.hmap.list[i].hasOwnProperty('HOURS')== 0){
							$parking_useTimeTd = $("<td>").text("");	
						}else{
							$parking_useTimeTd = $("<td>").text(Math.floor(data.hmap.list[i].HOURS/60)+"시 "
									+data.hmap.list[i].HOURS%60+"분");
						}
						if(data.hmap.list[i].hasOwnProperty('END_TIME') == false){
							$parking_endTimeTd = $("<td>").text("출차시 입력됩니다.");							
						}else{
							$parking_endTimeTd = $("<td>").text((1900+data.hmap.list[i].END_TIME.year)+"년 "
									+(data.hmap.list[i].END_TIME.month+1)+"월 "+
									data.hmap.list[i].END_TIME.date + "일 " +
									data.hmap.list[i].END_TIME.hours+"시 " +
									data.hmap.list[i].END_TIME.minutes+"분"
									);
						}
						$parking_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('FEE') == false){
							$exit_payTd = $("<td>").text("");
						}else{
							$exit_payTd = $("<td>").text(data.hmap.list[i].FEE);							
						}
						$entry_typeTh = $("<td>").text(data.hmap.list[i].EE_TYPE);		
						if(data.hmap.list[i].hasOwnProperty('RES_NO') == false){							
							$pay_typeTd = $("<td>").text("");	
						}else{
							$pay_typeTd = $("<td>").text(data.hmap.list[i].RES_NO);
						}
						$tbodyTr.append($member_idTd);
						$tbodyTr.append($member_nameTd);
						$tbodyTr.append($member_phoneTd);
						$tbodyTr.append($member_carNoTd);
						$tbodyTr.append($parking_startTimeTd);
						$tbodyTr.append($parking_useTimeTd);
						$tbodyTr.append($parking_endTimeTd);
						$tbodyTr.append($parking_statusTd);
						$tbodyTr.append($exit_payTd);
						$tbodyTr.append($entry_typeTh);
						$tbodyTr.append($pay_typeTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					if(data.pi.listCount != 0){
						$pageTr = $('<tr>');
						$pageTh = $("<th colspan='11'>");
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
							$leftAtag = $('<a class="page-link">').text("<");
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
								$currentAtag = $('<a class="page-link">').text(i);
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
							$rightAtag = $('<a class="page-link">').text(">");
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
					
					
					
					//출차일시 설정
				}else if(data.hmap.listType == 'outputCar'){
					//thead 설정
					$member_idTh = $("<th>").text("사용자 아이디");
					$member_nameTh = $("<th>").text("사용자명");
					$member_phoneTh = $("<th>").text("사용자 휴대폰번호");
					$member_carNoTh = $("<th>").text("사용자 차번호");
					$parking_startTimeTh = $("<th>").text("주차 시작 시간");
					$parking_useTimeTh = $("<th>").text("주차 사용 시간")
					$parking_endTimeTh = $("<th>").text("주차 종료 시간");
					$parking_statusTh = $("<th>").text("주차 상태");
					$exit_payTh = $("<th>").text("정산 요금");
					$entry_typeTh = $("<th>").text("예약/일반");
					$pay_typeTh = $("<th>").text("예약번호");
					
					$theadTr.append($member_idTh);
					$theadTr.append($member_nameTh);
					$theadTr.append($member_phoneTh);
					$theadTr.append($member_carNoTh);
					$theadTr.append($parking_startTimeTh);
					$theadTr.append($parking_useTimeTh);
					$theadTr.append($parking_endTimeTh);
					$theadTr.append($parking_statusTh);
					$theadTr.append($exit_payTh);
					$theadTr.append($entry_typeTh);
					$theadTr.append($pay_typeTh);
					
					
					$theadId.append($theadTr);
					
					
					//tbody 설정
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						if(data.hmap.list[i].hasOwnProperty('MEMBER_ID') == false){
							$member_idTd = $("<td>").text("아이디 없음");
						}else{
							$member_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						}
						if(data.hmap.list[i].hasOwnProperty('MEMBER_NAME') == false){
							$member_nameTd = $("<td>").text("X");
						}else{
							$member_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						}
						$member_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$member_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$parking_startTimeTd =  $("<td>").text((1900+data.hmap.list[i].START_TIME.year)+"년 "
								+(data.hmap.list[i].START_TIME.month+1)+"월 "+
								data.hmap.list[i].START_TIME.date + "일 " +
								data.hmap.list[i].START_TIME.hours+"시 " +
								data.hmap.list[i].START_TIME.minutes+"분"
								);
						if(data.hmap.list[i].hasOwnProperty('HOURS')==false || data.hmap.list[i].hasOwnProperty('HOURS')== 0){
							$parking_useTimeTd = $("<td>").text("");	
						}else{
							$parking_useTimeTd = $("<td>").text(Math.floor(data.hmap.list[i].HOURS/60)+"시 "
									+data.hmap.list[i].HOURS%60+"분");
						}
						if(data.hmap.list[i].hasOwnProperty('END_TIME') == false){
							$parking_endTimeTd = $("<td>").text("출차시 입력됩니다.");							
						}else{
							$parking_endTimeTd = $("<td>").text((1900+data.hmap.list[i].END_TIME.year)+"년 "
									+(data.hmap.list[i].END_TIME.month+1)+"월 "+
									data.hmap.list[i].END_TIME.date + "일 " +
									data.hmap.list[i].END_TIME.hours+"시 " +
									data.hmap.list[i].END_TIME.minutes+"분"
									);
						}
						$parking_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('FEE') == false){
							$exit_payTd = $("<td>").text("");
						}else{
							$exit_payTd = $("<td>").text(data.hmap.list[i].FEE);							
						}
						$entry_typeTh = $("<td>").text(data.hmap.list[i].EE_TYPE);		
						if(data.hmap.list[i].hasOwnProperty('RES_NO') == false){							
							$pay_typeTd = $("<td>").text("");	
						}else{
							$pay_typeTd = $("<td>").text(data.hmap.list[i].RES_NO);
						}
						$tbodyTr.append($member_idTd);
						$tbodyTr.append($member_nameTd);
						$tbodyTr.append($member_phoneTd);
						$tbodyTr.append($member_carNoTd);
						$tbodyTr.append($parking_startTimeTd);
						$tbodyTr.append($parking_useTimeTd);
						$tbodyTr.append($parking_endTimeTd);
						$tbodyTr.append($parking_statusTd);
						$tbodyTr.append($exit_payTd);
						$tbodyTr.append($entry_typeTh);
						$tbodyTr.append($pay_typeTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					if(data.pi.listCount != 0){
						$pageTr = $('<tr>');
						$pageTh = $("<th colspan='11'>");
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
							$leftAtag = $('<a class="page-link">').text("<");
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
								$currentAtag = $('<a class="page-link">').text(i);
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
							$rightAtag = $('<a class="page-link">').text(">");
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
					
					
					
					//입출차 일시 설정
				}else{
					//thead 설정
					$member_idTh = $("<th>").text("사용자 아이디");
					$member_nameTh = $("<th>").text("사용자명");
					$member_phoneTh = $("<th>").text("사용자 휴대폰번호");
					$member_carNoTh = $("<th>").text("사용자 차번호");
					$parking_startTimeTh = $("<th>").text("주차 시작 시간");
					$parking_useTimeTh = $("<th>").text("주차 사용 시간")
					$parking_endTimeTh = $("<th>").text("주차 종료 시간");
					$parking_statusTh = $("<th>").text("주차 상태");
					$exit_payTh = $("<th>").text("정산 요금");
					$entry_typeTh = $("<th>").text("예약/일반");
					$pay_typeTh = $("<th>").text("예약번호");
					
					$theadTr.append($member_idTh);
					$theadTr.append($member_nameTh);
					$theadTr.append($member_phoneTh);
					$theadTr.append($member_carNoTh);
					$theadTr.append($parking_startTimeTh);
					$theadTr.append($parking_useTimeTh);
					$theadTr.append($parking_endTimeTh);
					$theadTr.append($parking_statusTh);
					$theadTr.append($exit_payTh);
					$theadTr.append($entry_typeTh);
					$theadTr.append($pay_typeTh);
					
					
					$theadId.append($theadTr);
					
					
					//tbody 설정
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						if(data.hmap.list[i].hasOwnProperty('MEMBER_ID') == false){
							$member_idTd = $("<td>").text("아이디 없음");
						}else{
							$member_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						}
						if(data.hmap.list[i].hasOwnProperty('MEMBER_NAME') == false){
							$member_nameTd = $("<td>").text("X");
						}else{
							$member_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						}
						$member_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$member_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$parking_startTimeTd =  $("<td>").text((1900+data.hmap.list[i].START_TIME.year)+"년 "
								+(data.hmap.list[i].START_TIME.month+1)+"월 "+
								data.hmap.list[i].START_TIME.date + "일 " +
								data.hmap.list[i].START_TIME.hours+"시 " +
								data.hmap.list[i].START_TIME.minutes+"분"
								);
						if(data.hmap.list[i].hasOwnProperty('HOURS')==false || data.hmap.list[i].hasOwnProperty('HOURS')== 0){
							$parking_useTimeTd = $("<td>").text("");	
						}else{
							$parking_useTimeTd = $("<td>").text(Math.floor(data.hmap.list[i].HOURS/60)+"시 "
									+data.hmap.list[i].HOURS%60+"분");
						}
						if(data.hmap.list[i].hasOwnProperty('END_TIME') == false){
							$parking_endTimeTd = $("<td>").text("출차시 입력됩니다.");							
						}else{
							$parking_endTimeTd = $("<td>").text((1900+data.hmap.list[i].END_TIME.year)+"년 "
									+(data.hmap.list[i].END_TIME.month+1)+"월 "+
									data.hmap.list[i].END_TIME.date + "일 " +
									data.hmap.list[i].END_TIME.hours+"시 " +
									data.hmap.list[i].END_TIME.minutes+"분"
									);
						}
						$parking_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('FEE') == false){
							$exit_payTd = $("<td>").text("");
						}else{
							$exit_payTd = $("<td>").text(data.hmap.list[i].FEE);							
						}
						$entry_typeTh = $("<td>").text(data.hmap.list[i].EE_TYPE);		
						if(data.hmap.list[i].hasOwnProperty('RES_NO') == false){							
							$pay_typeTd = $("<td>").text("");	
						}else{
							$pay_typeTd = $("<td>").text(data.hmap.list[i].RES_NO);
						}
						$tbodyTr.append($member_idTd);
						$tbodyTr.append($member_nameTd);
						$tbodyTr.append($member_phoneTd);
						$tbodyTr.append($member_carNoTd);
						$tbodyTr.append($parking_startTimeTd);
						$tbodyTr.append($parking_useTimeTd);
						$tbodyTr.append($parking_endTimeTd);
						$tbodyTr.append($parking_statusTd);
						$tbodyTr.append($exit_payTd);
						$tbodyTr.append($entry_typeTh);
						$tbodyTr.append($pay_typeTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징				
					if(data.pi.listCount != 0){
						$pageTr = $('<tr>');
						$pageTh = $("<th colspan='11'>");
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
							$leftAtag = $('<a class="page-link">').text("<");
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
								$currentAtag = $('<a class="page-link">').text(i);
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
							$rightAtag = $('<a class="page-link">').text(">");
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
					
					
				}
			},
			error : function(data){
				console.log("데이터 통신 실패");
			}
		});
	}
	
	
	//재귀호출
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