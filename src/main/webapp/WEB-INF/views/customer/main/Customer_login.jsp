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
                <form action="allLogin.cu" method="post">
                  	아이디 : <input type="text" class="form-control" name="member_id" id="member_id"><br>
                  	비밀번호 : <input type="password" class="form-control" name="member_pwd" id="member_pwd"><br>
                    
                    <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm"  type="button" onclick="join();" style="width: 120px;">회원가입</button>
                    <button class="btn btn-info btn-sm" type="submit"  style="width: 120px;">로그인</button>
                    </div>
                    <div align="center" style="width: 100%">
                    <br>
                    <button class="btn btn-info btn-sm" type="button" onclick="parkingceoLogin();" style="width: 120px;">제휴 페이지</button>
                    <button class="btn btn-info btn-sm" type="button" onclick="" style="width: 120px;">비밀번호 찾기</button>
                    <br><br>
                    <button class="btn btn-info btn-sm" type="button" onclick="" style="width: 120px;">카카오톡 로그인</button>
                    <button class="btn btn-info btn-sm" type="button" onclick="" style="width: 120px;">네이버 로그인	</button>
                    </div>
                 </form>
                    
                    <br><br><br>
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