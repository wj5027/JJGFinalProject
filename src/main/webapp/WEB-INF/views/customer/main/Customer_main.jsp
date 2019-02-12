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
				    center: new daum.maps.LatLng(39.0318, 125.7526),
				    draggable:true,
				    scrollwheel:true,// 지도의 중심좌표
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
				 message = '<div style="padding:5px;">초기위치</div>'; // 인포윈도우에 표시될 내용입니다
			        
				 var imageSrc = 'resources/common/img/soro.gif', // 마커이미지의 주소입니다    
				    imageSize = new daum.maps.Size(70, 70), // 마커이미지의 크기입니다
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
				var count=1;
				if (navigator.geolocation) {
				    console.log("지오로케이션사용");
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.watchPosition(function(position) {
				        console.log("움직였당");
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        
				        var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				          
				        mypositionMarker.setPosition(new daum.maps.LatLng(lat, lon));
				        map.setLevel(4, {anchor: new daum.maps.LatLng(lat, lon)});
				        if(count==1){
				        	map.setCenter(locPosition); 
				        }
				        count++;
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
				        minLevel: 8 // 클러스터 할 최소 지도 레벨 
				    });
				
				// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
				 daum.maps.event.addListener(map, 'tilesloaded', function() {
					 var markers=[];
					 clusterer.clear();
					 
					 /* 	현재 지도 영역 구하기. */
					 	var bounds = map.getBounds();
					 	  // 영역정보의 남서쪽 정보를 얻어옵니다 
					    var swLatlng = bounds.getSouthWest();//x0,y1
					    // 영역정보의 북동쪽 정보를 얻어옵니다 
					    var neLatlng = bounds.getNorthEast();//x1,y0
					    
					    var x0=Number(swLatlng.getLat());
					    var x1=Number(neLatlng.getLat());
					    var y0=Number(swLatlng.getLng());
					    var y1=Number(neLatlng.getLng());
					    
						$.ajax({
							url:"getnearParkings.cu",
							type:"get",
							data:{x0:x0,x1:x1,y0:y0,y1:y1}, 
							success:function(data){
							 	for(t in data.parkings){
									var lat =data.parkings[t].latitude;
									var lon =data.parkings[t].longitude;
									var type =data.parkings[t].operate_TYPE;
									var name =data.parkings[t].parking_NAME;
									var ntime = Number(data.parkings[t].parking_NTIME);//기본시간
									var nprice =Number(data.parkings[t].parking_NPRICE);//기본시간요금
									var atime=Number(data.parkings[t].parking_ATIME);//추가시간
									var aprice=Number(data.parkings[t].parking_APRICE);//추가시간요금
									var pinfo=data.parkings[t].price_INFO;//유료or무료
									var img=null;
									var allfair=0;
									
									var Platlng =new daum.maps.LatLng(lat, lon);
									
									
									
								 
									
									
									
									
									// console.log(pinfo+","+ntime); 
									if(pinfo=="유료"&&ntime>0){
										// console.log(name+"유료에 기본시간 0이상입니다"); 
										
									if(atime>0){	
									 if(ntime>30){
										 var em=Number(ntime/30);
										 allfair=Number(nprice/em);
										//  console.log("30분이상일떄"+allfair); 
									 }else{
										 var emptytime=Number(30-ntime);
										 var afairtime=Number(emptytime/atime);
										 var afair=Number(afairtime*aprice);
										 allfair=Number(nprice+afair);
										//  console.log("30분이하일때"+allfair); 
									 }
									}
									else{
										if(ntime>30){
											 var em=Number(ntime/30);
											 allfair=Number(nprice/em);
											 
											// console.log("30분이상일떄"+allfair); 
										 }else{
										// var emptytime=Number(30-ntime);
										//	 var afairtime=Number(emptytime/ntime);
										//	 var afair=Number(afairtime*nprice);
										//	 allfair=Number(nprice+afair); 
											 var em =Number(30/ntime);
											 allfair=Number(em*nprice);
											 
											 // console.log("추가 요금 구분없을때 30분이하일때"+allfair); 
										 }
										
									}
									}else{
										if(pinfo=="무료"){
											img='resources/common/img/free.png';
										}
										else{
											img='resources/common/img/muni.png';
										}
										
									}
									
									if((0<=allfair) && (3000>=allfair)){
										 img='resources/common/img/blueMarker.png';
										}else if((3000<=allfair) && (5000>=allfair)){
										  img='resources/common/img/greenMarker.png';
										}else if((5000<=allfair) && (10000>=allfair)){
											img='resources/common/img/yellowMarker.png';
										}else if(allfair>=10000){
											img='resources/common/img/pinkMarker.png';
										}
										else{
											img='resources/common/img/muni.png';
										}
									
									var parkingImgPath =img, // 마커이미지의 주소입니다    
								    imageSize = new daum.maps.Size(30, 30), // 마커이미지의 크기입니다
								    imageOption = {offset: new daum.maps.Point(30, 30)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
								    var parkingImg = new daum.maps.MarkerImage(parkingImgPath, imageSize, imageOption);
									//마커객체 생성
									var marker2= new daum.maps.Marker({
							            position:new daum.maps.LatLng(lat, lon),
								 		image:parkingImg
							        }); 
								
							
							 		markers.push(marker2);
							 		
							 		 
							 	}
							 		 
							 	
							 		 
							 		 
							 		 
									// 마커에 표시할 인포윈도우를 생성합니다 
				/* 				  
									  var infowindow2 = new daum.maps.InfoWindow({
										        content:"30분에 "+allfair+"원",
										        position:new daum.maps.LatLng(lat, lon)
										    }); 
								 	
								    //커스텀 오버레이
								    var customOverlay = new daum.maps.CustomOverlay({
								        map: map,
								        content: '<div>'+ntime+'분에'+nprice+'</div>',
								        position:new daum.maps.LatLng(lat, lon),
								    });
								    
								    customOverlay.setMap(map); 
								    
								    
								    
								 	// 마커에 click 이벤트를 등록합니다
								    daum.maps.event.addListener(marker2,'click',makeClickListener(map,marker2,infowindow2)); 
							    infowindow2.open(map,marker2); 
									 
							
								}
							 	
						geocoder.addressSearch(parkingadress, function(result, status) {

									    // 정상적으로 검색이 완료됐으면 
									     if (status === daum.maps.services.Status.OK) {

									        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

									        // 결과값으로 받은 위치를 마커로 표시합니다
									       
									        
									        
									       
										}else{
											console.log(parkingadress+"이거 문제임");
										}
									})	 
									*/
						 clusterer.addMarkers(markers);
							
								},error:function(status){
								console.log(status);
							}
						});
					  
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