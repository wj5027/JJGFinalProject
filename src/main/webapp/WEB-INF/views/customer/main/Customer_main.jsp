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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=103820f64442cfd4cf984f298b7c8470&libraries=services,clusterer,drawing"></script>
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
				// 지도 타입 변경 컨트롤을 생성한다
				var mapTypeControl = new daum.maps.MapTypeControl();

				// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
				map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

				// 지도에 확대 축소 컨트롤을 생성한다
				var zoomControl = new daum.maps.ZoomControl();

				// 지도의 우측에 확대 축소 컨트롤을 추가한다
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
				var mypositionMarker;
				 message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
			        
				 var imageSrc = 'resources/common/img/myPosition1.png', // 마커이미지의 주소입니다    
				    imageSize = new daum.maps.Size(50, 50), // 마커이미지의 크기입니다
				    imageOption = {offset: new daum.maps.Point(50, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
				 
				 
			        // 마커와 인포윈도우를 표시합니다
			        // 마커를 생성합니다
			    mypositionMarker = new daum.maps.Marker({  
			        map: map, 
			        position:new daum.maps.LatLng(39.0318, 125.7526),
			   		image: markerImage
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
				        map.setLevel(10, {anchor: new daum.maps.LatLng(lat, lon)});
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
				
				
				
				
				var geocoder = new daum.maps.services.Geocoder();
				//클러스터 생성
				 var clusterer = new daum.maps.MarkerClusterer({
				        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				        minLevel: 10 // 클러스터 할 최소 지도 레벨 
				    });
				 
				$.ajax({
					url:"getnearParkings.cu",
					type:"get",
					success:function(data){
						console.log(data);
						var markers=[];
					 	for(t in data.parkings){
							var lat =data.parkings[t].latitude;
							var lon =data.parkings[t].longitude;
							
							var marker= new daum.maps.Marker({
						            position:new daum.maps.LatLng(lat, lon)
						        });
							markers.push(marker);
						} 
					 	clusterer.addMarkers(markers);
/* 							geocoder.addressSearch(parkingadress, function(result, status) {

							    // 정상적으로 검색이 완료됐으면 
							     if (status === daum.maps.services.Status.OK) {

							        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

							        // 결과값으로 받은 위치를 마커로 표시합니다
							       
							        
							        
							       
								}else{
									console.log(parkingadress+"이거 문제임");
								}
							})	
 */							
						},error:function(status){
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