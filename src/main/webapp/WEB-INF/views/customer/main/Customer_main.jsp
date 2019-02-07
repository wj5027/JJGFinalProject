 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>




<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
</head>

     
<body class="">
  <div class="wrapper">
   <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=103820f64442cfd4cf984f298b7c8470"></script>
     <!--  <div class="row"> -->
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
				    console.log("지오로케이션사용");
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.watchPosition(function(position) {
				        console.log("움직였당");
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				          
				        mypositionMarker.setPosition(new daum.maps.LatLng(lat, lon));
				        map.setLevel(1, {anchor: new daum.maps.LatLng(lat, lon)});
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
				var adresses;
				$.ajax({
					url:"getnearParkings.cu",
					type:"post",
					success:function(data){
						console.log(data);
						for(parking in data.parkings){
							console.log(data.parkings[parking].ADDRESS);
						}
						
					},
					error:function(status){
						console.log(status);
					}
				});
				
				
				
				
				
			</script>
			     
			  <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
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