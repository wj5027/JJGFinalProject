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
      <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>
      
      <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title" align="center">내 정보</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <form id="infoForm" action="changeMyInfo.cu" method="post">
                
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td width="80px">이름</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" name="member_name" value="${ list.member_name }" readOnly>
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>아이디</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" name="member_id" value="${ list.member_id }" readOnly>
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>비밀번호</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="password" class="form-control" id="password" name="member_pwd">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>비밀번호 확인</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="password" class="form-control" id="password2" name="password2">
                        		</div>
                        	</div>
                        </td>
                      </tr>
                      <tr>
                        <td>차번호</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" id="carNo" name="member_carNo" value="${ list.member_carNo }">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>전화번호</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" name="phone" value="${ list.phone }">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>이메일</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="email" class="form-control" name="email" id="userEmail" value="${ list.email }"><button onclick="return emailCheck()" class="btn btn-info btn-sm" id="emailCk">중복확인</button><br>
                        		</div>
                        	</div>
                        </td>
                        </tr>
                        
                       </tbody>
                      
                  </table>
                      </form>
                      	<div align="center">
                      		<button class="btn btn-info btn-sm" onclick="edit();">수정</button>
                      	</div>                  
                   
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
        
      <footer class="footer">
        <div class="container-fluid">
          <ul class="nav">
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                Creative Tim
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                About Us
              </a>
            </li>
            <li class="nav-item">
              <a href="javascript:void(0)" class="nav-link">
                Blog
              </a>
            </li>
          </ul>
          <div class="copyright">
            ©
            <script>
              document.write(new Date().getFullYear())
            </script> made with <i class="tim-icons icon-heart-2"></i> by
            <a href="javascript:void(0)" target="_blank">Creative Tim</a> for a better web.
          </div>
        </div>
      </footer>
    </div>
  </div>
 
</body>

<script>

//이메일 중복체크    
function emailCheck(){
	var email = $("#userEmail").val();
	console.log(email);
	
	$.ajax({
		url:"emailCheck.cu",
		type:"post",
		data:{email:email},
		success:function(data){
			//alert(data);
			
			if(data == 1){
				alert("이미 존재하는 이메일입니다.");
			
			}else{
				alert("사용가능한 이메일입니다.");
				
				emailCheckResult = 1;
			}

		},
		error:function(status){
			console.log(status);
		}
	});	
	return false;
}

	function edit(){
		var pass1 = $("#password").val();
		var pass2 = $("#password2").val();
		
		console.log(pass1);
		console.log(pass2);
		
		if(pass1 != pass2){
			alert("비밀번호가 일치하지 않습니다");
		}else{
			alert("회원정보가 수정되었습니다");
			$("#infoForm").submit();
		}
	}
</script>
</html>