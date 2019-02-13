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
              	<form action="insertMember.cu" id="insertForm" method="post">
              		이름 <input type="text" class="form-control" name="member_name" id="member_name"><br>
              		아이디 <input type="text" class="form-control" name="member_id" id="member_id"><button onclick="return duplicationCheck()" class="btn btn-info btn-sm" id="idCk">중복확인</button><br>
                  	비밀번호 <input type="password" class="form-control" name="member_pwd" id="member_pwd"><br>
                  	비밀번호 확인 <input type="password" class="form-control" name="member_pwd2" id="member_pwd2"><br>
                
                  	차번호 <input type="text" class="form-control" name="member_carNo"><br>
                  	휴대폰 번호 <input type="text" class="form-control" name="phone"><br>                  	
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
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_join.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" type="submit" id="insertMember" >확인</button>
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<script type="text/javascript">
	var idCheckResult = 0;
	var emailCheckResult = 0;
	var pwdCheckResult = 0;
	
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
					
					emailCheckResult = 1;
					
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
		}else{
			alert("비정상적인 번호입니다. 재 확인해주세요");
			$("#insertMember").attr('disabled', true);
		}
	}
	
	//아이디 중복체크    
    function duplicationCheck(){
		var member_id = $("#member_id").val();
		console.log(member_id);
		
		$.ajax({
			url:"idCheck.cu",
			type:"post",
			data:{member_id:member_id},
			success:function(data){
				//alert(data);
			
				if(data == 1){
					alert("사용불가한 아이디입니다.");
				}else{
					alert("사용가능한 아이디입니다.");
					
					idCheckResult = 1;
				}
			
			},
			error:function(status){
				console.log(status);
			}
		});
		
		
		return false;
	}
	
	$(function(){
		$("#insertMember").click(function(){
			var pass=$("#member_pwd").val();
			var pass2=$("#member_pwd2").val();
			
			console.log(pass);
			console.log(pass2);
			
			if(pass != pass2){ 
				alert("비밀번호가 일치하지 않습니다.");
			}else{
				pwdCheckResult = 1;
				
				/* if(idCheckResult = 0){
					alert("아이디 중복체크를 해주세요");
				}else if(emailCheckResult = 0){
					alert("이메일 인증을 해주세요");
				}else if(idCheckResult = 1 && emailCheckResult = 1 && pwdCheckResult1 = 1){
					location.href="insertMember.cu";
					alert("회원가입이 완료되었습니다.");
					location.href="customer_loginPage.cu";
				}else{
					alert("입력 항목을 다시 확인 해 주세요");
				} */
				
				
			}
			
			//location.href="insertMember.cu";
			 if(idCheckResult == 1 && emailCheckResult == 1 && pwdCheckResult1 == 1){
				 alert("회원가입이 완료되었습니다");
				 $("#insertForm").submit();
			} 
			
		});
	});
	

	

</script>
</html>