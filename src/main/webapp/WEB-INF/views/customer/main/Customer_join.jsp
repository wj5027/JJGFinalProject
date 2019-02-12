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
                <h4 class="card-title"><b>지주갑 회원가입 약관 동의</b></h4>
              </div>
              <div class="card-body">
              	<div align="center">
              		<br>
              		<input type="text" class="form-control" style="height: 200px;" value="이용 약관 1" readonly><br>
              	</div>
              	<div class="form-check form-check-inline" style="width: 100%" align="right">
              		<label class="form-check-label">
              			<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">위 약관에 동의합니다.
              			<span class="form-check-sign"></span>
              		</label>
              	</div>
              	<br>
              	<div align="center">
              	<br>
              		<input type="text" class="form-control" style="height: 200px;" value="이용 약관 2" readonly><br>
              	</div>
              	<div class="form-check form-check-inline" style="width: 100%" align="right">
              		<label class="form-check-label">
              			<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">위 약관에 동의합니다.
              			<span class="form-check-sign"></span>
              		</label>
              	</div>
              	<br>
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='customer_loginPage.cu'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" id="nextBtn" >확인</button>
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
	$(function(){
		$("#nextBtn").click(function(){
		
			if($("#inlineCheckbox1").is(":checked") && $("#inlineCheckbox2").is(":checked")){
				
				location.href="customer_joinInput.cu";
			}else{
				alert("모든 약관에 동의해주세요");
			}
		
		});		
		
	});
</script>
</html>