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
              	<form action="insertParkinCeo.pc" method="post">
              		이름 <input type="text" class="form-control" name="member_name"><br>
              		아이디 <input type="text" class="form-control" name="member_id"><br>
                  	비밀번호 <input type="password" class="form-control" name="member_pwd"><br>
                  	비밀번호 확인 <input type="password" class="form-control" name="member_pwd2"><br>
                  	차번호 <input type="text" class="form-control" name="member_carNo"><br>
                  	사업자번호 <input type="text" class="form-control" name="business_no"><br>
                  	이메일 <input type="email" class="form-control" name="email" id="userEmail"><br>
                  	<div align="right" style="width: 100%">
                  		<button class="btn btn-info btn-sm" type="button" onclick="mailSender();">인증번호 발송</button>
                  	</div>
                  	이메일 인증번호 <input type="text" class="form-control" name="certificationNo" id="certificationNo"><br>
                  	<div align="right" style="width: 100%">
                  		<button class="btn btn-info btn-sm" type="button" id="checkEmail" onclick="chkCode();" disabled="disabled">확인</button>
                  	</div>
              	
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='ceoServiceTerm.pc'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" type="submit" id="insertParkingCeo" disabled="disabled">가입</button>
				</div>
				</form>
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
	

	
	//랜덤 코드 생성
	var randomCode = {};
	randomCode.random = function(n1,n2){
		return parseInt(Math.random()*(n2-n1 +1))+n1;
	};
	randomCode.authNo = function(n){
		var value= "";
		for(var i=0 ; i< n; i++){
			value += randomCode.random(0,9);
		}
		console.log(value);
		return value;
	}
	
	var checkCode = 0;
	
	//이메일 전송 ajax
	function mailSender(){
		window.alert("인증 메일을 보냈습니다. 확인해주세요");
		var code = randomCode.authNo(5);
		checkCode = code;
		var userEmail = $("#userEmail").val();
		
		$.ajax({
			url : "mailSender.pc",	
			type : "post",
			data:{code:code,
					userEmail:userEmail},
			success:function(data){
				if(data.sendMail == '성공'){
					$("#checkEmail").attr('disabled', false);
				}else{
					window.alert("죄송합니다, 이메일 전송에 실패했습니다.");
					window.reload();
				}
			},
			error:function(data){
				console.log("통신 실패!");				
			}
		});
	}
	
	//인증 코드 확인 메소드
	function chkCode(){
		if($("#certificationNo").val() == checkCode){
			alert("정상적으로 인증이 되었습니다.");
			$("#insertParkingCeo").attr('disabled', false);
		}else{
			alert("비정상적인 번호입니다. 재 확인해주세요");
			$("#insertParkingCeo").attr('disabled', true);
		}
	}


</script>

</html>