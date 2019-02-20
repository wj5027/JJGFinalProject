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
	var vtnValue = 90;
	
	//기간 버튼을 눌렀을때 값 변경 메소드
	function chkBtnValue(data){
		vtnValue = data;
		
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
				vtnValue:vtnValue,
				parkingSelectBox:parkingSelectBox,
				reverationSelectBox:reverationSelectBox},
			success : function(data){
				console.log(data);
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