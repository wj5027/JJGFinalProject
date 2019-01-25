<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	
</style>
</head>

<body class="">
  <div class="wrapper">
  <jsp:include page="/WEB-INF/views/parkingceo/common/Sidebar.jsp"></jsp:include>


    <div class="main-panel">
      <!-- Navbar -->
  		<jsp:include page="/WEB-INF/views/parkingceo/common/menubar.jsp"></jsp:include>
      <!-- End Navbar -->
      
      <div	 class="content">
      
      <!-- 내 주차장 검색 기능 -->
        <div class="row">
		  <div class="col-md-12" height="500px" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 주차장 정보 수정 신청</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td align="center"><div style="color: white;">[고객]님의 주차장을 선택해주세요</div></td>
                        <td>
							<div class="btn-group">
						  <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						    주차장
						  </button>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="#">주차장1</a>
						    <a class="dropdown-item" href="#">주차장2</a>
						    <a class="dropdown-item" href="#">주차장3</a>
						    <div class="dropdown-divider"></div>
						    <a class="dropdown-item" href="#">주차장4</a>
						  </div>
						</div>
						</td>
                      </tr>  
                      <tr>
                      	<td colspan="2" align="center"><button class="btn btn-info animation-on-hover" type="button">검색</button></td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
         <!-- 주차장 정보 입력 폼 --> 
         <div class="card">
		  <div class="card-body">
		    <form>
		    	<div class="form-group" align="center">
		    		<h4 class="card-title">주차장 유형</h4>
		    		<br>
		    		<input type="radio" name="type">&nbsp;<b style="color: white;">노상</b>
		    		&nbsp;&nbsp;&nbsp;&nbsp;
		    		<input type="radio" name="type">&nbsp;<b style="color: white;">노외</b>
		    	</div>
		    	
		      <div class="form-group">
		        <label for="ex1">주차장 명</label>
		        <input type="text" class="form-control" id="ex1" placeholder="주차장 이름을 입력해주세요"  name="parkingName" style="width: 300px;">
		      </div>
		      <div class="form-group">
		        <label for="ex2">연락처</label>
		        <input type="text" class="form-control" id="ex2" placeholder="연락처를 입력해주세요" style="width: 500px;">
		      </div>
		      <div class="form-group">
		        <label for="ex3">주차장 주소</label>
		        <br>
		        <button  class="btn btn-default btn-sm" id="ex3" type="button">검색하기</button>
		        <br>
		        <br>
		        <input type="text" class="form-control" placeholder="우편번호" style="width: 200px;">
		        <br>
		        <input type="text" class="form-control" placeholder="기본 주소" style="width: 600px;">
		        <br>
		        <input type="text" class="form-control" placeholder="상세 주소" style="width: 600px;">
		      </div>
		      	<div class="form-group">
		        <label for="ex4">주차 구획수</label>
		        <input type="text" class="form-control" id="ex4" placeholder="주차 구획수를 입력해주세요" style="width: 400px;">
		      </div>
		      <div class="form-check">
		      <label for="ex5">운영 요일</label>
		      <br>
		          <label class="form-check-label" id="ex5">
		              <input class="form-check-input" type="checkbox" value="weekday">
		              평일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" value="saturday">
		              토요일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		           <label class="form-check-label">
		              <input class="form-check-input" type="checkbox" value="holiday">
		              공휴일
		              <span class="form-check-sign">
		                  <span class="check"></span>
		              </span>
		          </label>
		      </div>
		      <br>
				<div align="center">
				<button type="submit" class="btn btn-info btn-sm" style="">신청하기</button>
				</div>
		    </form>
		  </div>
		</div>
          
          
		<!-- 이미지란 -->
       
      
    
      
      <!-- content -->
      </div>
    </div>
    
    
    
    
  </div>

  
</body>
<script type="text/javascript">

	function goMain(){
		location.href="parkingceoMain.pc";
	}

	function goExchangePage(){
		location.href = "parkingceoExchange.pc";
	}
	

</script>

</html>