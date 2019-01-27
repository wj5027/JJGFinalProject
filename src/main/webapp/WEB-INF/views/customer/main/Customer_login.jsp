<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>




<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
</head>

<body class="">
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    <div class="main-panel">
     <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">로그인</h4>
              </div>
              <div class="card-body">
                <!-- <form action=""> -->
                  	아이디 : <input type="text" class="form-control" name="userId"><br>
                  	비밀번호 : <input type="password" class="form-control" name="userPw"><br>
                    
                    <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="join();">회원가입</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" type="submit">로그인</button>
                    <br>
                    <button class="btn btn-info btn-sm" onclick="parkingceo();">사장님 페이지</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" onclick="#">비밀번호 찾기</button>
                    <br><br>
                    <button class="btn btn-info btn-sm" onclick="">카카오톡 로그인 자리</button>
                    <br><br>
                    <button class="btn btn-info btn-sm" onclick="">네이버 로그인 자리</button>
                    </div>
                    
                    <br><br><br><br>
                   	임시 : <br>
                   	<button onclick="parkingceo();">지주갑 사업자 관리 페이지</button><br>
                   	<button onclick="parkingceoLogin();">지주갑 사업자 관리 로그인 페이지</button><br>
					<button onclick="admin();">지주갑 관리자 페이지</button><br>
					<button onclick="customer();">지주갑 사용자 페이지</button><br>
					<button onclick="parkingceoTest();">사업자 데이트피커 테스트</button><br>
                 <!-- </form> -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<script type="text/javascript">

	function parkingceo(){
		location.href="parkingceoMain.pc";
	}
	
	function parkingceoLogin(){
		location.href="parkingceoLogin.pc";
	}

	function admin(){
		location.href="statisticsList.ad";
	}

	function join() {
		location.href="customer_join.cu";
	}
	
	function customer(){
		location.href="customer.cu";
	}
	
	function parkingceoTest(){
		location.href = "test.pc";
	}

</script>

</html>