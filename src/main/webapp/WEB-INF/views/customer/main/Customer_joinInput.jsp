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
                <h4 class="card-title"><b>지주갑 회원가입</b></h4>
              </div>
              <div class="card-body">
              	<form action="">
              		이름 <input type="text" class="form-control" name="userName"><br>
              		아이디 <input type="text" class="form-control" name="userId"><br>
                  	비밀번호 <input type="password" class="form-control" name="userPw"><br>
                  	비밀번호 확인 <input type="password" class="form-control" name="userPw2"><br>
                  	차번호 <input type="text" class="form-control" name="carNo"><br>
                  	이메일 <input type="email" class="form-control" name="email"><br>
                  	<div align="right" style="width: 100%">
                  		<button class="btn btn-info btn-sm" onclick="#">인증번호 발송</button>
                  	</div>
                  	이메일 인증번호 <input type="text" class="form-control" name="certificationNo"><br>
              	</form>
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_join.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_loginPage.cu'">확인</button>
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
</body>

</html>