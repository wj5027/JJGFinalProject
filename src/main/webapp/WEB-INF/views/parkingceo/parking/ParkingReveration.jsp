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
                <h4 class="card-title"> 예약 내역</h4>
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
						<select class="custom-select nav-link dropdown-toggle" id="inputGroupSelect02" name="reveration">
    						<option selected style="color: black;"  value="resAll">박스를 클릭해주세요</option>
    						<option value="resAll" style="color: black;">전체</option>
    						<option value="resOkay" style="color: black;">승인</option>
    						<option value="resReady" style="color: black;">승인대기</option>
    						<option value="resCancel" style="color: black;">승인거절</option>
    						<option value="resComplete" style="color: black;">입차완료</option>
    						<option value="resSelfCancel" style="color: black;">본인취소</option>
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
                       <li>기간을 선택하지 않으시면 기본 90일 이전 데이터가 조회됩니다.</li>
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
		var reverationSelectBox = $("#inputGroupSelect02 option:selected").val();
		$.ajax({
			url:"searchParkingReservation.pc",
			type:"post",
			data:{currentPage:currentPage,
				btnValue:btnValue,
				parkingSelectBox:parkingSelectBox,
				reverationSelectBox:reverationSelectBox},
			success : function(data){
				console.log(data);
				
				//thead 설정
				$theadId = $("#theadId");
				$theadId.html('');
				$tbodyId = $("#tbodyId");
				$tbodyId.html('');
				$tfootId = $("#tfootId");
				$tfootId.html('');
				$theadTr = $("<tr>");
				
				
				if(data.hmap.listType == 'resAll'){
					//전체 데이터 호출
					//thead th 설정
					$res_noTh = $("<th>").text("예약 번호");
					$res_idTh = $("<th>").text("예약자 아이디");
					$res_nameTh = $("<th>").text("예약자명");
					$res_phoneTh = $("<th>").text("휴대폰 번호");
					$res_carNoTh = $("<th>").text("차량번호");
					$res_request_dateTh = $("<th>").text("예약 신청 시간")
					$res_dateTh = $("<th>").text("주차장 예약 시작 시간");
					$res_apply_dateTh = $("<th>").text("예약 승인 시간");
					$res_statusTh = $("<th>").text("상태");
					$res_cancel_reasonTh = $("<th>").text("사업자 취소 사유");
					
					$theadTr.append($res_noTh);
					$theadTr.append($res_idTh);
					$theadTr.append($res_nameTh);
					$theadTr.append($res_phoneTh);
					$theadTr.append($res_carNoTh);
					$theadTr.append($res_request_dateTh);
					$theadTr.append($res_dateTh);
					$theadTr.append($res_apply_dateTh);
					$theadTr.append($res_statusTh);
					$theadTr.append($res_cancel_reasonTh);
					
					$theadId.append($theadTr);
					
					//tbody 설정
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						
						$res_noTd = $("<td>").text(data.hmap.list[i].RES_NO);
						$res_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						$res_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						$res_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$res_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$res_request_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_REQUEST_DATE.year)+"년 "
								+(data.hmap.list[i].RES_REQUEST_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_REQUEST_DATE.date + "일 " +
								data.hmap.list[i].RES_REQUEST_DATE.hours+"시 " +
								data.hmap.list[i].RES_REQUEST_DATE.minutes+"분");
						$res_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_DATE.year)+"년 "
								+(data.hmap.list[i].RES_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_DATE.date + "일 " +
								data.hmap.list[i].RES_DATE.hours+"시 " +
								data.hmap.list[i].RES_DATE.minutes+"분");
						if(data.hmap.list[i].hasOwnProperty('RES_APPLY_DATE') == false){
							$res_apply_dateTd = $("<td>").text("미승인");
						}else{
							$res_apply_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_APPLY_DATE.year)+"년 "
									+(data.hmap.list[i].RES_APPLY_DATE.month+1)+"월 "+
									data.hmap.list[i].RES_APPLY_DATE.date + "일 " +
									data.hmap.list[i].RES_APPLY_DATE.hours+"시 " +
									data.hmap.list[i].RES_APPLY_DATE.minutes+"분");
						}
						$res_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$res_cancel_reasonTd = $("<td>").text("사유 없음");
						}else{
							$res_cancel_reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);							
						}
						
						$tbodyTr.append($res_noTd);
						$tbodyTr.append($res_idTd);
						$tbodyTr.append($res_nameTd);
						$tbodyTr.append($res_phoneTd);
						$tbodyTr.append($res_carNoTd);
						$tbodyTr.append($res_request_dateTd);
						$tbodyTr.append($res_dateTd);
						$tbodyTr.append($res_apply_dateTd);
						$tbodyTr.append($res_statusTd);
						$tbodyTr.append($res_cancel_reasonTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					
					if(data.pi.listCount != 0){
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
					
					
				}else if (data.hmap.listType == 'resOkay'){
					//예약 승인 되었을시
					
					//thead th 설정
					$res_noTh = $("<th>").text("예약 번호");
					$res_idTh = $("<th>").text("예약자 아이디");
					$res_nameTh = $("<th>").text("예약자명");
					$res_phoneTh = $("<th>").text("휴대폰 번호");
					$res_carNoTh = $("<th>").text("차량번호");
					$res_request_dateTh = $("<th>").text("예약 신청 시간")
					$res_dateTh = $("<th>").text("주차장 예약 시작 시간");
					$res_apply_dateTh = $("<th>").text("예약 승인 시간");
					$res_statusTh = $("<th>").text("상태");
					$res_cancel_reasonTh = $("<th>").text("사업자 취소 사유");
					
					$theadTr.append($res_noTh);
					$theadTr.append($res_idTh);
					$theadTr.append($res_nameTh);
					$theadTr.append($res_phoneTh);
					$theadTr.append($res_carNoTh);
					$theadTr.append($res_request_dateTh);
					$theadTr.append($res_dateTh);
					$theadTr.append($res_apply_dateTh);
					$theadTr.append($res_statusTh);
					$theadTr.append($res_cancel_reasonTh);
					
					$theadId.append($theadTr);
					
					//tbody 설정
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						
						$res_noTd = $("<td>").text(data.hmap.list[i].RES_NO);
						$res_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						$res_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						$res_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$res_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$res_request_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_REQUEST_DATE.year)+"년 "
								+(data.hmap.list[i].RES_REQUEST_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_REQUEST_DATE.date + "일 " +
								data.hmap.list[i].RES_REQUEST_DATE.hours+"시 " +
								data.hmap.list[i].RES_REQUEST_DATE.minutes+"분");
						$res_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_DATE.year)+"년 "
								+(data.hmap.list[i].RES_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_DATE.date + "일 " +
								data.hmap.list[i].RES_DATE.hours+"시 " +
								data.hmap.list[i].RES_DATE.minutes+"분");
						if(data.hmap.list[i].hasOwnProperty('RES_APPLY_DATE') == false){
							$res_apply_dateTd = $("<td>").text("미승인");
						}else{
							$res_apply_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_APPLY_DATE.year)+"년 "
									+(data.hmap.list[i].RES_APPLY_DATE.month+1)+"월 "+
									data.hmap.list[i].RES_APPLY_DATE.date + "일 " +
									data.hmap.list[i].RES_APPLY_DATE.hours+"시 " +
									data.hmap.list[i].RES_APPLY_DATE.minutes+"분");
						}
						$res_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$res_cancel_reasonTd = $("<td>").text("사유 없음");
						}else{
							$res_cancel_reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);							
						}
						
						$tbodyTr.append($res_noTd);
						$tbodyTr.append($res_idTd);
						$tbodyTr.append($res_nameTd);
						$tbodyTr.append($res_phoneTd);
						$tbodyTr.append($res_carNoTd);
						$tbodyTr.append($res_request_dateTd);
						$tbodyTr.append($res_dateTd);
						$tbodyTr.append($res_apply_dateTd);
						$tbodyTr.append($res_statusTd);
						$tbodyTr.append($res_cancel_reasonTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					
					if(data.pi.listCount != 0){
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
					
					
				}else if(data.hmap.listType == 'resReady'){
					//예약 승인 대기중일시
					
					//thead th 설정
					$res_noTh = $("<th>").text("예약 번호");
					$res_idTh = $("<th>").text("예약자 아이디");
					$res_nameTh = $("<th>").text("예약자명");
					$res_phoneTh = $("<th>").text("휴대폰 번호");
					$res_carNoTh = $("<th>").text("차량번호");
					$res_request_dateTh = $("<th>").text("예약 신청 시간")
					$res_dateTh = $("<th>").text("주차장 예약 시작 시간");
					$res_apply_dateTh = $("<th>").text("예약 승인 시간");
					$res_statusTh = $("<th>").text("상태");
					$res_cancel_reasonTh = $("<th>").text("사업자 취소 사유");
					
					$theadTr.append($res_noTh);
					$theadTr.append($res_idTh);
					$theadTr.append($res_nameTh);
					$theadTr.append($res_phoneTh);
					$theadTr.append($res_carNoTh);
					$theadTr.append($res_request_dateTh);
					$theadTr.append($res_dateTh);
					$theadTr.append($res_apply_dateTh);
					$theadTr.append($res_statusTh);
					$theadTr.append($res_cancel_reasonTh);
					
					$theadId.append($theadTr);
					
					//tbody 설정
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						
						$res_noTd = $("<td>").text(data.hmap.list[i].RES_NO);
						$res_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						$res_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						$res_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$res_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$res_request_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_REQUEST_DATE.year)+"년 "
								+(data.hmap.list[i].RES_REQUEST_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_REQUEST_DATE.date + "일 " +
								data.hmap.list[i].RES_REQUEST_DATE.hours+"시 " +
								data.hmap.list[i].RES_REQUEST_DATE.minutes+"분");
						$res_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_DATE.year)+"년 "
								+(data.hmap.list[i].RES_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_DATE.date + "일 " +
								data.hmap.list[i].RES_DATE.hours+"시 " +
								data.hmap.list[i].RES_DATE.minutes+"분");
						if(data.hmap.list[i].hasOwnProperty('RES_APPLY_DATE') == false){
							$res_apply_dateTd = $("<td>").text("미승인");
						}else{
							$res_apply_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_APPLY_DATE.year)+"년 "
									+(data.hmap.list[i].RES_APPLY_DATE.month+1)+"월 "+
									data.hmap.list[i].RES_APPLY_DATE.date + "일 " +
									data.hmap.list[i].RES_APPLY_DATE.hours+"시 " +
									data.hmap.list[i].RES_APPLY_DATE.minutes+"분");
						}
						$res_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$res_cancel_reasonTd = $("<td>").text("사유 없음");
						}else{
							$res_cancel_reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);							
						}
						
						$tbodyTr.append($res_noTd);
						$tbodyTr.append($res_idTd);
						$tbodyTr.append($res_nameTd);
						$tbodyTr.append($res_phoneTd);
						$tbodyTr.append($res_carNoTd);
						$tbodyTr.append($res_request_dateTd);
						$tbodyTr.append($res_dateTd);
						$tbodyTr.append($res_apply_dateTd);
						$tbodyTr.append($res_statusTd);
						$tbodyTr.append($res_cancel_reasonTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					
					if(data.pi.listCount != 0){
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
					
					
				}else if(data.hmap.listType == 'resCancel'){
					//사업자 사유로 취소했을시
					
					//thead th 설정
					$res_noTh = $("<th>").text("예약 번호");
					$res_idTh = $("<th>").text("예약자 아이디");
					$res_nameTh = $("<th>").text("예약자명");
					$res_phoneTh = $("<th>").text("휴대폰 번호");
					$res_carNoTh = $("<th>").text("차량번호");
					$res_request_dateTh = $("<th>").text("예약 신청 시간")
					$res_dateTh = $("<th>").text("주차장 예약 시작 시간");
					$res_apply_dateTh = $("<th>").text("예약 승인 시간");
					$res_statusTh = $("<th>").text("상태");
					$res_cancel_reasonTh = $("<th>").text("사업자 취소 사유");
					
					$theadTr.append($res_noTh);
					$theadTr.append($res_idTh);
					$theadTr.append($res_nameTh);
					$theadTr.append($res_phoneTh);
					$theadTr.append($res_carNoTh);
					$theadTr.append($res_request_dateTh);
					$theadTr.append($res_dateTh);
					$theadTr.append($res_apply_dateTh);
					$theadTr.append($res_statusTh);
					$theadTr.append($res_cancel_reasonTh);
					
					$theadId.append($theadTr);
					
					//tbody 설정
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						
						$res_noTd = $("<td>").text(data.hmap.list[i].RES_NO);
						$res_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						$res_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						$res_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$res_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$res_request_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_REQUEST_DATE.year)+"년 "
								+(data.hmap.list[i].RES_REQUEST_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_REQUEST_DATE.date + "일 " +
								data.hmap.list[i].RES_REQUEST_DATE.hours+"시 " +
								data.hmap.list[i].RES_REQUEST_DATE.minutes+"분");
						$res_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_DATE.year)+"년 "
								+(data.hmap.list[i].RES_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_DATE.date + "일 " +
								data.hmap.list[i].RES_DATE.hours+"시 " +
								data.hmap.list[i].RES_DATE.minutes+"분");
						if(data.hmap.list[i].hasOwnProperty('RES_APPLY_DATE') == false){
							$res_apply_dateTd = $("<td>").text("미승인");
						}else{
							$res_apply_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_APPLY_DATE.year)+"년 "
									+(data.hmap.list[i].RES_APPLY_DATE.month+1)+"월 "+
									data.hmap.list[i].RES_APPLY_DATE.date + "일 " +
									data.hmap.list[i].RES_APPLY_DATE.hours+"시 " +
									data.hmap.list[i].RES_APPLY_DATE.minutes+"분");
						}
						$res_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$res_cancel_reasonTd = $("<td>").text("사유 없음");
						}else{
							$res_cancel_reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);							
						}
						
						$tbodyTr.append($res_noTd);
						$tbodyTr.append($res_idTd);
						$tbodyTr.append($res_nameTd);
						$tbodyTr.append($res_phoneTd);
						$tbodyTr.append($res_carNoTd);
						$tbodyTr.append($res_request_dateTd);
						$tbodyTr.append($res_dateTd);
						$tbodyTr.append($res_apply_dateTd);
						$tbodyTr.append($res_statusTd);
						$tbodyTr.append($res_cancel_reasonTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					
					if(data.pi.listCount != 0){
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
					
					
				}else if(data.hmap.listType == 'resComplete'){
					//예약회원이 입차했을시
					
					//thead th 설정
					$res_noTh = $("<th>").text("예약 번호");
					$res_idTh = $("<th>").text("예약자 아이디");
					$res_nameTh = $("<th>").text("예약자명");
					$res_phoneTh = $("<th>").text("휴대폰 번호");
					$res_carNoTh = $("<th>").text("차량번호");
					$res_request_dateTh = $("<th>").text("예약 신청 시간")
					$res_dateTh = $("<th>").text("주차장 예약 시작 시간");
					$res_apply_dateTh = $("<th>").text("예약 승인 시간");
					$res_statusTh = $("<th>").text("상태");
					$res_cancel_reasonTh = $("<th>").text("사업자 취소 사유");
					
					$theadTr.append($res_noTh);
					$theadTr.append($res_idTh);
					$theadTr.append($res_nameTh);
					$theadTr.append($res_phoneTh);
					$theadTr.append($res_carNoTh);
					$theadTr.append($res_request_dateTh);
					$theadTr.append($res_dateTh);
					$theadTr.append($res_apply_dateTh);
					$theadTr.append($res_statusTh);
					$theadTr.append($res_cancel_reasonTh);
					
					$theadId.append($theadTr);
					
					//tbody 설정
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						
						$res_noTd = $("<td>").text(data.hmap.list[i].RES_NO);
						$res_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						$res_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						$res_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$res_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$res_request_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_REQUEST_DATE.year)+"년 "
								+(data.hmap.list[i].RES_REQUEST_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_REQUEST_DATE.date + "일 " +
								data.hmap.list[i].RES_REQUEST_DATE.hours+"시 " +
								data.hmap.list[i].RES_REQUEST_DATE.minutes+"분");
						$res_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_DATE.year)+"년 "
								+(data.hmap.list[i].RES_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_DATE.date + "일 " +
								data.hmap.list[i].RES_DATE.hours+"시 " +
								data.hmap.list[i].RES_DATE.minutes+"분");
						if(data.hmap.list[i].hasOwnProperty('RES_APPLY_DATE') == false){
							$res_apply_dateTd = $("<td>").text("미승인");
						}else{
							$res_apply_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_APPLY_DATE.year)+"년 "
									+(data.hmap.list[i].RES_APPLY_DATE.month+1)+"월 "+
									data.hmap.list[i].RES_APPLY_DATE.date + "일 " +
									data.hmap.list[i].RES_APPLY_DATE.hours+"시 " +
									data.hmap.list[i].RES_APPLY_DATE.minutes+"분");
						}
						$res_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$res_cancel_reasonTd = $("<td>").text("사유 없음");
						}else{
							$res_cancel_reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);							
						}
						
						$tbodyTr.append($res_noTd);
						$tbodyTr.append($res_idTd);
						$tbodyTr.append($res_nameTd);
						$tbodyTr.append($res_phoneTd);
						$tbodyTr.append($res_carNoTd);
						$tbodyTr.append($res_request_dateTd);
						$tbodyTr.append($res_dateTd);
						$tbodyTr.append($res_apply_dateTd);
						$tbodyTr.append($res_statusTd);
						$tbodyTr.append($res_cancel_reasonTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					
					if(data.pi.listCount != 0){
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
					
					
				}else{
					//사용자 취소일시
					
					//thead th 설정
					$res_noTh = $("<th>").text("예약 번호");
					$res_idTh = $("<th>").text("예약자 아이디");
					$res_nameTh = $("<th>").text("예약자명");
					$res_phoneTh = $("<th>").text("휴대폰 번호");
					$res_carNoTh = $("<th>").text("차량번호");
					$res_request_dateTh = $("<th>").text("예약 신청 시간")
					$res_dateTh = $("<th>").text("주차장 예약 시작 시간");
					$res_apply_dateTh = $("<th>").text("예약 승인 시간");
					$res_statusTh = $("<th>").text("상태");
					$res_cancel_reasonTh = $("<th>").text("사업자 취소 사유");
					
					$theadTr.append($res_noTh);
					$theadTr.append($res_idTh);
					$theadTr.append($res_nameTh);
					$theadTr.append($res_phoneTh);
					$theadTr.append($res_carNoTh);
					$theadTr.append($res_request_dateTh);
					$theadTr.append($res_dateTh);
					$theadTr.append($res_apply_dateTh);
					$theadTr.append($res_statusTh);
					$theadTr.append($res_cancel_reasonTh);
					
					$theadId.append($theadTr);
					
					//tbody 설정
					
					for(var i in data.hmap.list){
						$tbodyTr = $("<tr>");
						
						$res_noTd = $("<td>").text(data.hmap.list[i].RES_NO);
						$res_idTd = $("<td>").text(data.hmap.list[i].MEMBER_ID);
						$res_nameTd = $("<td>").text(data.hmap.list[i].MEMBER_NAME);
						$res_phoneTd = $("<td>").text(data.hmap.list[i].PHONE);
						$res_carNoTd = $("<td>").text(data.hmap.list[i].CAR_NO);
						$res_request_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_REQUEST_DATE.year)+"년 "
								+(data.hmap.list[i].RES_REQUEST_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_REQUEST_DATE.date + "일 " +
								data.hmap.list[i].RES_REQUEST_DATE.hours+"시 " +
								data.hmap.list[i].RES_REQUEST_DATE.minutes+"분");
						$res_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_DATE.year)+"년 "
								+(data.hmap.list[i].RES_DATE.month+1)+"월 "+
								data.hmap.list[i].RES_DATE.date + "일 " +
								data.hmap.list[i].RES_DATE.hours+"시 " +
								data.hmap.list[i].RES_DATE.minutes+"분");
						if(data.hmap.list[i].hasOwnProperty('RES_APPLY_DATE') == false){
							$res_apply_dateTd = $("<td>").text("미승인");
						}else{
							$res_apply_dateTd = $("<td>").text((1900+data.hmap.list[i].RES_APPLY_DATE.year)+"년 "
									+(data.hmap.list[i].RES_APPLY_DATE.month+1)+"월 "+
									data.hmap.list[i].RES_APPLY_DATE.date + "일 " +
									data.hmap.list[i].RES_APPLY_DATE.hours+"시 " +
									data.hmap.list[i].RES_APPLY_DATE.minutes+"분");
						}
						$res_statusTd = $("<td>").text(data.hmap.list[i].STATUS);
						if(data.hmap.list[i].hasOwnProperty('CANCEL_REASON') == false){
							$res_cancel_reasonTd = $("<td>").text("사유 없음");
						}else{
							$res_cancel_reasonTd = $("<td>").text(data.hmap.list[i].CANCEL_REASON);							
						}
						
						$tbodyTr.append($res_noTd);
						$tbodyTr.append($res_idTd);
						$tbodyTr.append($res_nameTd);
						$tbodyTr.append($res_phoneTd);
						$tbodyTr.append($res_carNoTd);
						$tbodyTr.append($res_request_dateTd);
						$tbodyTr.append($res_dateTd);
						$tbodyTr.append($res_apply_dateTd);
						$tbodyTr.append($res_statusTd);
						$tbodyTr.append($res_cancel_reasonTd);
						
						$tbodyId.append($tbodyTr); 
					}
					
					//페이징
					
					if(data.pi.listCount != 0){
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