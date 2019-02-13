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
           
                  	이메일 <input type="email" class="form-control" name="email" id="email"><br>
                
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
              	<form action="insertMember.cu" id="insertForm" method="post">
              		아이디 <input type="text" class="form-control" name="member_id" id="member_id"><br>
                
              	</form>
              	
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_login.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" >확인</button>
				</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
<script>
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
</script>      
</body>
</html>