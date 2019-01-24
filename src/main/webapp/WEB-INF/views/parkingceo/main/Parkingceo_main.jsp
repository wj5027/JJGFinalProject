<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
</head>

<body class="">
  <div class="wrapper">
    <div class="sidebar" style="background: rgb(49, 49, 49) !important;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <h3 align="center" style="margin-top:10px">사업자 페이지</h3>
          <a href="javascript:void(0)" class="simple-text logo-mini">
            JJG
          </a>
          <a href="javascript:void(0)" class="simple-text logo-normal">
            지금 주차하러 갑니다
          </a>
        </div>
        <ul class="nav">
          <li class="active ">
            <a href="./dashboard.jsp">
              <i class="tim-icons icon-chart-bar-32"></i>
              <p>메인 페이지</p>
            </a>
          </li>
          <li>
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="tim-icons icon-atom"></i>
              <p>사업자 관리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b style="font-size: 15px">▽</b></p>    
            </a>
	        <div align="right" class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	          <a class="dropdown-item" href="#">사업자 조회</a>
	          <a class="dropdown-item" href="#">주차장 조회</a>
	          <a class="dropdown-item" href="#">환전 승인 및 조회</a>
	          <a class="dropdown-item" href="#">정보 수정 신청</a>
	          <a class="dropdown-item" href="#">쿠폰 관리</a>
	          <a class="dropdown-item" href="#">통계</a>
	        </div>
          </li>
          <li>
            <a href="./map.jsp">
              <i class="tim-icons icon-satisfied"></i>
              <p>회원 관리</p>
            </a>
          </li>
          <li>
            <a href="./notifications.jsp">
              <i class="tim-icons icon-single-copy-04"></i>
              <p>게시판 관리</p>
            </a>
          </li>          
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle d-inline">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:void(0)">Welcome</a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
                <button class="btn btn-link" id="search-button" style="color: gray;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;LogOut
                  <span class="d-lg-none d-md-block"></span>
                </button>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
      
      <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px" >
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 사업자 관리</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td>지역</td>
                        <td>
							<div class="btn-group">
								<button type="button"
									class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">전체</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">서울</a> 
									<a class="dropdown-item" href="#">대전</a> 
									<a class="dropdown-item" href="#">대구</a>
									<a class="dropdown-item" href="#">부산</a>
								</div>
							</div>
						</td>
                      </tr>  
                      <tr>
                        <td>아이디</td>
                        <td>
                  			<div class="row">
		                    	<div class="form-group">
                        			<input type="text" class="form-control" id="exampleInputPassword1" placeholder="아이디를 입력해주세요">
                        		</div>
                        	</div>
                        </td>
                      </tr>  
                      <tr>
                        <td>등록일</td>
                        <td>
                        	<button class="btn btn-primary btn-sm">1일</button> &nbsp;&nbsp;
                        	<button class="btn btn-primary btn-sm">7일</button> &nbsp;&nbsp;
                        	<button class="btn btn-primary btn-sm">1개월</button> &nbsp;&nbsp;
                        	<button class="btn btn-primary btn-sm">6개월</button> &nbsp;&nbsp;
                        	<button class="btn btn-primary btn-sm">1년</button> &nbsp;&nbsp;
                        	 
                  			<div class="row">
		                    	<div class="form-group">
		                    		<input type="date" class="form-control" value="">
		                    	</div>
		                    	<div class="form-group">&nbsp;&nbsp;&nbsp;<b style="font-size: 20px">~</b>&nbsp;&nbsp;&nbsp;</div>
		                   		<div class="form-group">
		                   			<input type="date" class="form-control" value="">
		                 		</div>
	                    	</div>
                        </td>
                      </tr>  
                      <tr>
                      	<td></td>
                      	<td style="padding-left: 30%">
                      		<button class="btn btn-primary">검색</button>
                      	</td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>

        
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title"> 사업자 관리</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <thead class=" text-primary">
                      <tr>
                        <th>
                          	계정번호
                        </th>
                        <th>
                          	아이디
                        </th>
                        <th>
                          	이름
                        </th>
                        <th>
                          	전화번호
                        </th>
                        <th class="text-center">
                          	보유 포인트
                        </th>
                        <th>
                          	주소
                        </th>
                        <th>
                          	비고
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          	1
                        </td>
                        <td>
                          	Niger
                        </td>
                        <td>
                          	니제르
                        </td>
                        <td>
                          	010-1234-5678
                        </td>
                        <td class="text-center">
                          	7000
                        </td>
                        <td>
                          	서울시 강남구 역삼동
                        </td>
                        <td>
                          	특이사항 없음
                        </td>
                      </tr>
                      <tr>
                        <td>
                          	2
                        </td>
                        <td>
                          	Red
                        </td>
                        <td>
                          	레드
                        </td>
                        <td>
                          	010-0001-5678
                        </td>
                        <td class="text-center">
                          	12000
                        </td>
                        <td>
                          	서울시 강남구 삼성동
                        </td>
                        <td>
                          	특이사항 없음
                        </td>
                      </tr>
                      <tr>
                        <td>
                          	3
                        </td>
                        <td>
                          	Blue
                        </td>
                        <td>
                          	블루
                        </td>
                        <td>
                          	010-0012-5678
                        </td>
                        <td class="text-center">
                          	3200
                        </td>
                        <td>
                          	서울시 강남구 역삼동
                        </td>
                        <td>
                          	특이사항 없음
                        </td>
                      </tr>
                    </tbody>
                  </table>
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