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
      
      <!-- 로그인 영역 -->
        <div class="row">
		  <div class="col-md-12">
            <div class="card " style="width: 500px; margin-left: auto; margin-right: auto;">
              <div class="card-header">
                <h4 class="card-title"><b>사장님 회원가입</b></h4>
              </div>
              <div class="card-body">
              	<form action="">
              		이름 <input type="text" class="form-control" name="userName"><br>
              		아이디 <input type="text" class="form-control" name="userId"><br>
                  	비밀번호 <input type="password" class="form-control" name="userPw"><br>
                  	비밀번호 확인 <input type="password" class="form-control" name="userPw2"><br>
                  	차번호 <input type="text" class="form-control" name="carNo"><br>
                  	사업자번호 <input type="text" class="form-control" name="businessNo"><br>
                  	이메일 <input type="email" class="form-control" name="email"><br>
                  	<div align="right" style="width: 100%">
                  		<button class="btn btn-info btn-sm" onclick="#">인증번호 발송</button>
                  	</div>
                  	이메일 인증번호 <input type="text" class="form-control" name="certificationNo"><br>
              	</form>
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='ceoServiceTerm.pc'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" onclick="location.href='parkingceoLogin.pc'">확인</button>
				</div>
              </div>
            </div>
          </div>
	    </div>
	  </div>
    </div>
  </div>
</div>
  
</body>

<!-- 로그인 페이지 이동 스크립트 -->
<script type="text/javascript">
	function join() {
		location.href="ceoServiceTerm.pc";
	}
</script>

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