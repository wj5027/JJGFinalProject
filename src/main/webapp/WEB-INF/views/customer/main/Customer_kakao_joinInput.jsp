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
                <h4 class="card-title"><b>지주갑 카카오톡 로그인 추가정보 입력</b></h4>
              </div>
              <div class="card-body">
              	<form action="insertKakao" method="post">
              		이름 <input type="text" class="form-control" name="userName" value="${ member_name }" readonly><br>
              		아이디 <input type="text" class="form-control" name="member_id" value="${ kakao_id }" readonly><br>
                  	비밀번호 <input type="password" class="form-control" name="member_pwd"><br>
                  	비밀번호 확인 <input type="password" class="form-control" name="member_pwd2"><br> 
                  	차번호 <input type="text" class="form-control" name="member_carNo"><br>
                  	전화번호<input type="text" class="form-control" name="phone"><br>
                  	이메일 <input type="email" class="form-control" name="email" id="userEmail"><br>
                  	<div align="right" style="width: 100%">
                  		<button class="btn btn-info btn-sm" type="button" onclick="mailSender();">인증번호 발송</button>
                  	</div>
                  	이메일 인증번호 <input type="text" class="form-control" name="certificationNo" id="certificationNo"><br>
                  	<div align="right" style="width: 100%">
                  		<button class="btn btn-info btn-sm" type="button" id="checkEmail" onclick="chkCode();" disabled="disabled">확인</button>
                  	</div>
              	</form>
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_loginPage.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" onclick="location.href='insertKakao.cu'">확인</button>
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