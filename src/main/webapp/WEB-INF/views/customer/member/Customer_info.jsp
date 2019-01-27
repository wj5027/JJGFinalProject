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
                <h4 class="card-title" align="center">내정보수정</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td width="80px">이름</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" name="name" value="홍길동" disabled>
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>아이디</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" name="userId" value="user01" disabled>
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>비밀번호</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="password" class="form-control" name="password">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>비밀번호 확인</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="password" class="form-control" name="password2">
                        		</div>
                        	</div>
                        </td>
                      </tr>
                      <tr>
                        <td>차번호</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" id="carNo">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>전화번호</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" name="phone">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>이메일</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="email" class="form-control" name="email">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                       </tbody>
                  </table>
                     
                      	<div align="center">
                      		<button class="btn btn-info btn-sm">수정</button>
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

</html>