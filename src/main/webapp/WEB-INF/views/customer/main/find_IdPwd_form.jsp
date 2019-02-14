<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>

<body class="">
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    <div class="main-panel">
     <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"><b>지주갑 아이디 찾기</b></h4>
              </div>
                <div class="card-body">
              	<form action="findId.cu" id="findIdForm" method="post">
           
                  	이메일 <input type="email" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요"><br>
                
              	</form>
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_loginPage.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" onclick="return checkId()" id="findIdBtn" >확인</button>
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
<div class="main-panel">
     <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"><b>지주갑 비밀번호 찾기</b></h4>
              </div>
              <div class="card-body">
              	<form action="findPwd.cu" id="insertFindingPwdForm" method="post">
              		아이디 <input type="text" class="form-control" name="member_id" id="member_id"><br>
              		이메일 <input type="email" class="form-control" name="email2" id="email2"><br>
              	</form>
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_login.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                     <button class="btn btn-info btn-sm" onclick="return chkPwd()" id="chkForPwd" >확인</button>
                  
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
 
<script type="text/javascript">

	//아이디찾기
	function checkId(){
		var email = $("#email").val();
		console.log(email);
		
		$.ajax({
			url:"findId.cu",
			type:"post",
			data:{email:email},
			success:function(data){
								
				if(data == ""){
					alert("존재하지 않는 이메일입니다");
				}else{
					alert("찾으시는 아이디는 "+data+"입니다");
				}
				
			},
			error:function(status){
				console.log(status);
			}
		});
		
		
		return false;
	}

 	function chkPwd(){
		var member_id = $("#member_id").val();
		var email = $("#email2").val();
		
		console.log(member_id);
		console.log(email);
		
		 var tempPwd="";
			
		  var text1 = "";
		  var text2 = "";
		
		     var alphabet = "abcdefghijklmnopqrstuvwxyz";
		     var num = "0123456789";

		     for( var i=0; i < 4; i++ )
		     {      
		         text1 += alphabet.charAt(Math.floor(Math.random() * alphabet.length));
		         text2 += num.charAt(Math.floor(Math.random() * num.length));
		     }
		     tempPwd = text1+text2;
		     
		    console.log(tempPwd);
		    
		    $.ajax({
				url:"findPwd.cu",
				type:"post",
				data:{member_id:member_id , email:email},
				success:function(data){
					//alert(data);
					if(data == 1){
						
						$.ajax({
							url : "sendTempPwd.cu",	
							type : "post",
							data:{tempPwd:tempPwd,
									email:email},
							success:function(data){
								if(data.sendMail == '성공'){
									//alert("임시비밀번호 발급성공");
									
									$.ajax({
										url : "setTempPwd.cu",	
										type : "post",
										data:{email:email, member_id:member_id,
												tempPwd:tempPwd},
										success:function(data){
											alert(data);
	
	
										},
										error:function(request, status, error){
											console.log("통신 실패!");	
										}
									});

								}
							}	,
								error:function(request, status, error){
									console.log("통신 실패!");	
								}
							});
						

					}else{
						alert("존재하지 않는 정보입니다.");
					}
				}
					,
					error:function(request, status, error){
						console.log("통신 실패!");	
					}
				});
						
						
						
	} 



		
</script>      
</body>
</html>