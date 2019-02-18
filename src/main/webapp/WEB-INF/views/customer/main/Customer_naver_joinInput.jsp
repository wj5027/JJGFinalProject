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
                <h4 class="card-title" align="center"><b>지주갑 네이버 로그인 추가정보 입력</b></h4>
              </div>
              <div class="card-body">
              	<form action="insertNaver.cu" id="naverForm" method="post">
              		이름 <input type="text" class="form-control" name="member_name" value="${ member_name }" readonly><br>
              		아이디 <input type="text" class="form-control" name="member_id" value="${ member_id }" readonly><br>
                  	비밀번호 <input type="password" class="form-control" name="member_pwd" id="member_pwd"><br>
                  	비밀번호 확인 <input type="password" class="form-control" name="member_pwd2" id="member_pwd2"><br>
                	차번호 <input type="text" class="form-control" name="member_carNo"><br>
                  	전화번호<input type="text" class="form-control" name="phone" id="phone" placeholder="'-'를 포함해서 입력해주세요"><br>
                  	이메일 <input type="email" class="form-control" name="email" id="userEmail" value="${ email }"><br>
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
                    <button class="btn btn-info btn-sm" type="submit" onclick="return insertNaver()" id="insertNaverBtn">확인</button>
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<script>
	
	var pwdCheckResult = 0;
	var emailCodeChkResult = 0;
	var phoneChk = 0;


	//랜덤코드 생성
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

	//유효성 검사
	function insertNaver(){
		

		//이메일 검사
		var regExp = /\w{4,}@\w{1,}.{1,3}/g;
		var email =  document.getElementById("userEmail").value;
		
		console.log(email);
		if(regExp.test(email)){ 
		//			   	alert("이메일 정상입력!!");
		   }else{ 
		   alert("email 입력 형식을 확인해주세요"); 
		   
		   return false;
		   } 
		
		
		
		//비밀번호 검사
		var pass= document.getElementById("member_pwd").value;
		var pass2=document.getElementById("member_pwd2").value;
		
		console.log("pass:"+pass);
		console.log(pass2);
		
		if(pass != pass2){ 
			alert("비밀번호가 일치하지 않습니다.");
			
			return false;
		}else{
	//		alert("비밀번호 확인 완료");
			pwdCheckResult = 1;
			
		}
		
		//핸드폰 번호
		var phone = document.getElementById("phone").value;
		var phoneNum = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		console.log(phone);
		console.log(phoneNum.test(phone));
		
		if(!(phoneNum.test(phone))){
			alert("전화번호 형식을 확인해주세요");
			
			return false;
		}else{
	//		alert("알맞은 전화번호 형식!!");
			phoneChk=1;
		}
		
		   return true;
		  

	}
	
	
	//이메일 전송 ajax
	function mailSender(){
		window.alert("인증 메일을 보냈습니다. 확인해주세요");
		var code = randomCode.authNo(5);
		checkCode = code;
		var userEmail = $("#userEmail").val();
		
		$.ajax({
			url : "mailSender.cu",	
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
		console.log(checkCode);
		if($("#certificationNo").val() == checkCode){
			alert("정상적으로 인증이 되었습니다.");
			$("#insertMember").attr('disabled', false);
			
			emailCodeChkResult = 1;
			
		}else{
			alert("비정상적인 번호입니다. 재 확인해주세요");
			$("#insertMember").attr('disabled', true);
		}
	}

	

	$(function(){
		$("#insertNaverBtn").click(function(){
			
			
			console.log(pwdCheckResult);
			console.log(emailCodeChkResult);
			console.log(phoneChk);
			
			if(pwdCheckResult == 1 && emailCodeChkResult == 1 && phoneChk == 1){
				alert("회원가입이 완료되었습니다");
				$("#naverForm").submit();
			}else{
				alert("입력하신 정보를 다시 한 번 확인해주세요");
				//return false;
			}; 
			
		
			
		});			
		
	}); 
</script>
</html>