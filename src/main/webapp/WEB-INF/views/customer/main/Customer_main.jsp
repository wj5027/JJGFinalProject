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
        
        
        
          <h3 align="center" style="margin-top:10px"><img src="/jjg/resources/common/img/logo.png" onclick="location.href='customer.cu'"></h3>
          
          
          <!-- <a id="userId" href="javascript:void(0)" class="simple-text logo-mini">
           	송현영
          </a> -->
          <div style="color:white;">
          <span id="userId" >
          	송현영
          </span>
          <span >님 환영합니다.</span>
          </div>
          <div style="font-size: 1em;color: wheat;">
           <span>현재 보유오일 :</span>
          <span id="oilmount">500000</span>
          </div>
          <!-- <a href="javascript:void(0)" class="simple-text logo-normal">
         	님 환영합니다.
          </a> -->
          
          <!--정보수정  -->
          <button class="btn btn-link" id="search-button" onclick="location.href='customerInfo.cu'" style="color: gray;"><i class="tim-icons icon-badge"></i>&nbsp;&nbsp;내정보수정
                  <span class="d-lg-none d-md-block"></span>
          </button>
          <!--로그아웃  -->
          <button class="btn btn-link" id="search-button" style="color: gray;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;로그아웃
                  <span class="d-lg-none d-md-block"></span>
          </button>
          <br>
         
          
        </div>
        <ul class="nav">
          <li >
            <a href="./coupon.cu">
              <i class="tim-icons icon-chart-bar-32"></i>
            	쿠폰함
            </a>
          </li>
          <li>
            <a href="./oil.cu">
              <i class="tim-icons icon-atom"></i>
              	오일
            </a>
          </li>
          <li>
            <a href="./reserv.cu">
              <i class="tim-icons icon-satisfied"></i>
              	예약내역
            </a>
          </li>
          <li>
            <a href="./map.cu">
              <i class="tim-icons icon-single-copy-04"></i>
             	 지도
            </a>
          </li> 
          <li>
          <a href="./customerNotice.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	공지사항
            </a>
          </li>
           <li>
          <a href="./review.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 후기
            </a>
          </li>  
           <li>
          <a href="./qna.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 문의
            </a>
          </li>           
        </ul>
        <script>
        $(function(){
         $(".nav").children("li").mouseover(function(){
        	 console.log("호버");
        	 $(this).attr("class","active");
        	 $(this).css("background","gray");
        	 
         }).mouseout(function(){
        	 $(this).attr("class","null");
        	 $(this).css("background","rgb(49,49,49)");
         })
        	
        });
        
        </script>
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div>
	            <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" style="color: white;"></i>
	            </button>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button class="btn btn-link" data-toggle="modal" data-target=".bd-example-modal-lg-6"><i class="fas fa-microphone-alt" style="color: white;"></i>
	            </button>
            </div>
            <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 음성 인식 모달 -->
            <div class="modal fade bd-example-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body">
			        <div class="table-responsive"  style="overflow: hidden;">
			          <table class="table tablesorter " id="">
			            <tbody>
			                  <tr><td align="center"><b><i class="fas fa-microphone-alt" style="color: white;"></i> &nbsp;&nbsp; : &nbsp;&nbsp; 안녕하세요??</b></td></tr>
			                  <tr>
			                  	<td align="center">
			                  		검색 결과
			                  	</td>
			                  </tr>
			                  <tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button></td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
          </div>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button> 
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li class="search-bar input-group">
              <!--   <button class="btn btn-link" id="search-button" onclick="location.href='customerInfo.cu'" style="color: gray;"><i class="tim-icons icon-badge"></i>&nbsp;&nbsp;내정보수정
                  <span class="d-lg-none d-md-block"></span>
                </button> -->
              </li>
              <li class="search-bar input-group">
              <!--   <button class="btn btn-link" id="search-button" style="color: gray;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;로그아웃
                  <span class="d-lg-none d-md-block"></span>
                </button> -->
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
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=103820f64442cfd4cf984f298b7c8470"></script>
         <div class="content">
        <div class="row">
          <div class="card-body" style="padding: 0px;">
            <div class="map" style="position: relative; overflow: hidden;">
	          <div id="daumMap" style="height: 100%; width: 100%; position: absolute; top: 0px; left: 0px; background-color: rgb(229, 227, 223);">
	          </div>
            </div>
            <script>
            /*@@@@@@@@@@@@@@@@@지도 초기 셋팅 @@@@@@@@@@@@@@@@@@@@@@@@@  */
				var mapContainer = document.getElementById('daumMap'), // 지도를 표시할 div 
				mapOption = { 
				    center: new daum.maps.LatLng(39.0318, 125.7526), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};
				
				var map = new daum.maps.Map(mapContainer, mapOption); 
				var mypositionMarker;
				 message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			        
			        // 마커와 인포윈도우를 표시합니다
			        // 마커를 생성합니다
			    mypositionMarker = new daum.maps.Marker({  
			        map: map, 
			        position:new daum.maps.LatLng(39.0318, 125.7526)
			    }); 
			    
			    var iwContent = message, // 인포윈도우에 표시할 내용
			        iwRemoveable = true;

			    // 인포윈도우를 생성합니다
			    var infowindow = new daum.maps.InfoWindow({
			        content : iwContent,
			        removable : iwRemoveable
			    });
			    
			    // 인포윈도우를 마커위에 표시합니다 
			    infowindow.open(map, mypositionMarker);
			    // 지도 중심좌표를 접속위치로 변경합니다
			    map.setCenter(new daum.maps.LatLng(39.0318, 125.7526));
		 /*@@@@@@@@@@@@@@@@@지도 초기 셋팅 @@@@@@@@@@@@@@@@@@@@@@@@@  */
				
		 
		 
		 
		 
		 
		  /*@@@@@@@@@@@@@@@@@움직 일때 마다 내위치 마커 이동 @@@@@@@@@@@@@@@@@@@@@@@@@  */
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				if (navigator.geolocation) {
				    
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.watchPosition(function(position) {
				        console.log("움직였당");
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				          
				        mypositionMarker.setPosition(new daum.maps.LatLng(lat, lon));
				        map.setCenter(locPosition);
					/* displayMarker(locPosition, message); */
				            
				      });
				    
				}
		/*@@@@@@@@@@@@@@@@@움직 일때 마다 내위치 마커 이동 @@@@@@@@@@@@@@@@@@@@@@@@@  */
		 /* else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
				    
				    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
				        message = 'geolocation을 사용할수 없어요..'
				        
				    displayMarker(locPosition, message);
				} */

			/* 	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
				function displayMarker(locPosition, message) {

				    // 마커를 생성합니다
				    var marker = new daum.maps.Marker({  
				        map: map, 
				        position: locPosition
				    }); 
				    
				    var iwContent = message, // 인포윈도우에 표시할 내용
				        iwRemoveable = true;

				    // 인포윈도우를 생성합니다
				    var infowindow = new daum.maps.InfoWindow({
				        content : iwContent,
				        removable : iwRemoveable
				    });
				    
				    // 인포윈도우를 마커위에 표시합니다 
				    infowindow.open(map, marker);
				    
				    // 지도 중심좌표를 접속위치로 변경합니다
				    map.setCenter(locPosition);      
				}     */
				
			</script>
          </div>

        </div>
      </div>
				
				
				
    
    
    
    
      
     <!--  <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">내정보수정</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table tablesorter " id="">
                    <tbody>
                      <tr>
                        <td>이름</td>
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
                      <tr>
                      	<td></td>
                      	<td style="padding-left: 30%">
                      		<button class="btn btn-info dropdown-toggle">수정</button>
                      	</td>
                      </tr>                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> -->
     <!--    
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
      </footer> -->
    </div>
  </div>
 
</body>

</html>