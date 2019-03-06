 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<html>




<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
</head>

     
<body class="">
  <div class="wrapper">
   <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>
 	<c:if test="${ empty loginUser }">
 	<script type='text/javascript'>
 	
 	</script>
	</c:if>
	<c:if test="${ !empty loginUser }">
	<script type='text/javascript'>
	
	
	</script>
	</c:if>
 
 
 
   
   
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=85185db0fc452125ec8070a4279f67bb&libraries=services,clusterer,drawing"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    		<!--@@@@@@@@@@@@@@@@@@@@@지도 띄우기@@@@@@@@@@@@@@@@@@@@@@@@@  -->
            <div class="map" style="position: relative;height: 90%; width: 90%;">
	          <div id="daumMap" style=" height: 100%; width: 100%; position: fixed; top: 54px; left: 0px; background-color: rgb(229, 227, 223);" >
	          </div>
	          </div>
	          
	          
	          
	          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@설명 div@@@@@@@@@@@@@@@@@@@@@@@@  -->
	          <div align="right" style="position:absolute; width: 130px;height: 200px;z-index:100000000;top: 11%;left: 65%;">
	          <button id="bttn" align="right" style="background-color:white; color:black; border-radius:10px; border:0.5px solid black; font-size:1.5em" onclick="togglebtn()">></button>
	          <div align="left" id="explaindiv" style="margin:1px; background-color:white; border-radius: 10px;">
	           <span align="center" style="margin:2px; color:black; font-size:0.7em;"><input type="checkbox" id="freemk" checked><img src='resources/common/img/freeparking.png' width="25px" height="25px"> &nbsp;<b>무료</b></span><br>
	          <span align="center" style="margin:2px; color:black; font-size:0.7em;"><input type="checkbox" id="greenmk" checked><img src='resources/common/img/greenMarker.png' width="25px" height="25px"> &nbsp;<b>1500원 이하</b></span><br>
	          <span align="center" style="margin:2px; color:black; font-size:0.7em;"><input type="checkbox" id="bluemk" checked><img src='resources/common/img/blueMarker.png' width="25px" height="25px"> &nbsp;<b>1500~3000</b></span><br>
	          <span align="center" style="margin:2px; color:black; font-size:0.7em;"><input type="checkbox" id="yellowmk"checked><img src='resources/common/img/yellowMarker.png' width="25px" height="25px"> &nbsp;<b>3000~5000</b></span><br>
	          <span align="center" style="margin:2px; color:black; font-size:0.7em;"><input type="checkbox" id="pinkmk" checked><img src='resources/common/img/pinkMarker.png' width="25px" height="25px"> &nbsp;<b>5000원 이상</b></span><br>
	          <span align="center" style="margin:2px; color:black; font-size:0.7em;"><img src='resources/common/img/muni.png' width="25px" height="25px"> &nbsp;<b>관리자에게 문의</b></span>
	          </div>
	          </div>
	        
	          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@상세보기 모달@@@@@@@@@@@@@@@@@@@@@@@@@  -->
	           <button id="detailparking" class="btn btn-link" data-toggle="modal" data-target=".bd-detail-modal-lg-6"></button>
	              <div class="modal fade bd-detail-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			 	  <div class="modal-dialog modal-lg" style="font-size: 0.7em; margin-top:80px;">
			    <div class="modal-content" style="background: white; color:black;">
			      <div class="modal-body1" style="padding-bottom: 0px;">
			        <div class="table-responsive" id="voiceSize" style="overflow: auto; padding-bottom: 0px;  ">
			          <table class="table tablesorter " style="margin-bottom: 0px;">
			            <tbody id="STTResult">
			            	  <tr>
			            	  	<td>
			            	  		<div style="width: 100%" align="right">
			            	  			<button type="button" class="btn btn-sm " id="selectCoupon" style="display: none;" onclick="">쿠폰받기</button>
			            	  		</div>
			            	  	</td>
			            	  </tr>
			                  <tr>
			                  <input id="pno" type="hidden" value="">
			                  <td align="left" colspan="5">- 주차장명 <br> <b style="font-size:1.5em;" id="pname"></b></td>
			                  <td align="right" colspan="6" style="padding:0px">총자리:<span id="allseat" style="display:inline">150</span><br><span style="color:red">남은자리:<span id="extraseat" style="display:inline">100</span></span></td>
			                  </tr>
			                  <tr ><td colspan="12" style="padding:0px"><hr></td></tr>
			                  <tr>
			                  <td colspan="3" lowspan="2"><img id="pimg1" src="resources/common/img/noimage.gif" width="100px" height="100px" style="border:1px solid black;" onclick="onparkingImgs()"/></td>
			                  <td colspan="9">
			                   				  <b>- 주소 :</b><span id="paddr"></span><br>
			                  				  <b>- 주차요금 </b>: 30분 ,<span id="price"></span>원<br>
			                  				  
			                  				  <b>- 운영시간</b><br>
			                  				        &emsp;   평  일 : <span id="time"></span><br>
			                  				       &emsp;   토요일 : <span id="stime"></span><br>
			                  				       &emsp;   공휴일 : <span id="gtime"></span>
			                  </td>
			                  </tr>
			                  <tr>
			                  <td align="center" colspan="3"><button type="button" class="btn btn-sm  " data-dismiss="modal" onclick="navi()">길찾기</button></td>
			                  <td align="center" colspan="3">
			                  	<!-- @@@@@@@@@@@@@@@@@@@@@@주차장 예약 신청 버튼@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			                  	<c:if test="${ empty loginUser }">
			                  		<button type="button" class="btn btn-sm " data-dismiss="modal" onclick="reservParking(1)" disabled>예약하기</button>
			                  	</c:if>
			                  	<c:if test="${ !empty loginUser }">
			                  		<button type="button" class="btn btn-sm " data-dismiss="modal" onclick="reservParking(1)">예약하기</button>
			                  		<button id="clickRequestReserve" class="btn btn-info btn-sm" data-toggle="modal" data-target=".reservParking" style="display: none;"></button>
			                  	</c:if>
			                  	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			                  </td>
			                  
			                  <!--@@@@@@@@@@@@@@@@@즐겨찾기@@@@@@@@@@@@@@@@@@@@@@@ -->
			                  <td align="center" colspan="3">
			                  <!--  -->
			                  <c:if test="${ empty loginUser }">
			                  <button  type="button" class="btn btn-sm " data-dismiss="modal" disabled>즐겨찾기</button>
			                  	</c:if>
			                  	<c:if test="${ !empty loginUser }">
			                  	<button id="favorite_btn" type="button" class="btn btn-sm  " data-dismiss="modal" onclick="favoriteReg()">즐겨찾기</button>
			                  	</c:if>
			                  </td>
			                    <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			                  </tr>
			                  <tr>

			                  <td align="center" colspan="3"><button type="button" class="btn btn-sm  " data-dismiss="modal" id="qna">문의</button></td>
			                  <td align="center" colspan="3"><button type="button" class="btn btn-sm  " data-dismiss="modal" id="review">후기</button></td>

			                  <td align="center" colspan="3"><button type="button" class="btn btn-sm  " data-dismiss="modal">닫기</button></td>
			                  <td><input type="hidden" id="member_id" name="member_id" value="">
                   				<input type="hidden" id="member_name" name="member_name" value="">
                   	                   	<input type="hidden" id="email" name="email" value=""><input type="hidden" id="pno" name="pno" value="">
                   	                   	<input type="hidden" id="pName" name="pName" value=""></td>
			                  <td></td>
			                  <td></td>
			                  </tr>
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
            <!--@@@@@@@@@@@@@@@@@@@@@2모달과 버튼  -->
	           
	           
	        <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 예약 신청 모달 -->
            <div class="modal fade reservParking" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px">
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px">
			          <form action="requestReserve.cu" id="submitReserveRequest" method="POST">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
			            <tbody id="">
			            	  <tr align="center">
			            	  	<th style="color: white;" colspan="2">
			            	  		<div id="reservName">ㅁㅁ 주차장 예약</div>
			            	  		<input type="hidden" id="reservParkingNo" name="reservParkingNo" value="">
			            	  		<input type="hidden" id="coopParkingYN" value="">
			            	  	</th>
			            	  </tr>
			            	  <tr align="center">
			            	  	<th style="color: white;">날짜</th>
			            	  	<th style="color: white;">시간</th>
			            	  </tr>
			                  <tr>
			                  	<td align="center">
								<div class="input-group date form_date col-md-5" data-date="" data-date-format="yy년 MM d일" data-link-field="weekdayStime" data-link-format="yy년 MM d일">
									<div style="width: 70%"><input class="form-control"  id="selectReservDate" name="selectedTime" size="16" type="text" placeholder="예약날짜"  readonly style="color: white; width: 110px; cursor: pointer !important;">
										<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
										<span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
									</div>
								</div>
								</td>
								<td align="center">
									<select class="custom-select nav-link dropdown-toggle" name="selectTime2" style="background-color: rgb(34, 42, 65); width: 95px;">
										<option value="01:00" selected>01:00</option>
										<option value="02:00">02:00</option>
										<option value="03:00">03:00</option>
										<option value="04:00">04:00</option>
										<option value="05:00">05:00</option>
										<option value="06:00">06:00</option>
										<option value="07:00">07:00</option>
										<option value="08:00">08:00</option>
										<option value="09:00">09:00</option>
										<option value="10:00">10:00</option>
										<option value="11:00">11:00</option>
										<option value="12:00">12:00</option>
										<option value="13:00">13:00</option>
										<option value="14:00">14:00</option>
										<option value="15:00">15:00</option>
										<option value="16:00">16:00</option>
										<option value="17:00">17:00</option>
										<option value="18:00">18:00</option>
										<option value="19:00">19:00</option>
										<option value="20:00">20:00</option>
										<option value="21:00">21:00</option>
										<option value="22:00">22:00</option>
										<option value="23:00">23:00</option>
										<option value="24:00">24:00</option>
									</select>
			                  	</td>
			                  </tr>
			                  <tr>
			                  	<td align="center">
			                  		차 번호 : 
			                  	</td>
			               		<td align="center">
			               			<input type="text" class="form-control" name="carNo" value="${ loginUser.member_carNo }" style="width: 80px;">
			               		</td>
			                  </tr>
			                  <tr>
			                  	<td align="center" style="color: white;">
			                  		사용 될 오일 : 
			                  	</td>
			                  	<td align="center" style="color: white;" id="reservOil">
			                  		2000L
			                  	</td>
			                  </tr>
			                  <tr>
			                  	<td align="center" colspan="2" style="color: red;">
			                  		주의! 예약시 오일은 2,000L가 계산됩니다.<br>
			                  		예약시간 1시간 이후이거나 취소를 하지 않고<br>
			                  		시간지 지났다면 환불이 불가능합니다.
			                  	</td>
			                  </tr>
			                  <tr>
			                  	<td align="center" colspan="2" id="requestButton">
				                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="">닫기</button>
				                  	<!-- @@@@@@@@@@@@@@@@@@@@@@주차장 예약 신청 버튼 -->
				                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				                  	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="reservParking(1)">신청</button>
				                  	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
				              	</td>
			                  </tr>      
			            </tbody>
			          </table>
			          </form>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

	           
	           
		<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@사진 띄위기 모달@@@@@@@@@@@@@@@@@@@@@@@@@@@2  -->
		<button id="onparkingImgsbtn" class="btn btn-link" data-toggle="modal" data-target=".bd-imgs-modal-lg-5"></button>
	              <div class="modal fade bd-imgs-modal-lg-5" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			 	  <div class="modal-dialog modal-lg" style="font-size: 0.7em; margin-top:0px; width:300px;">
			    <div class="modal-content" style="background: white; color:black;">
			      <div class="modal-body1" style="padding-bottom: 0px;">
			        <div class="table-responsive" id="voiceSize" style="overflow: auto; padding-bottom: 0px;  ">
			          <table class="table tablesorter " style="margin-bottom: 0px;">
			 			<tbody align="center">
			 			<tr>
			 			<td>
			 			<img id="pimg2" src="resources/common/img/noimage.gif" width="300px" height="150px" style="border:1px solid black;" />
			 			</td>
			 			</tr>
			 			<br/>
			 			<tr>
			 			<td>
			 			<img id="pimg3" src="resources/common/img/noimage.gif" width="300px" height="150px" style="border:1px solid black;" />
			 			</td>
			 			</tr>
			 			<br/>
			 			<tr>
			 			<td>
			 			<img id="pimg4" src="resources/common/img/noimage.gif" width="300px" height="150px" style="border:1px solid black;" o/>
			 			</td>
			 			</tr>
			 			<tr>
			 			  <td align="center" colspan="3"><button type="button" class="btn btn-sm  " data-dismiss="modal">닫기</button></td>
			 			  </tr>
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!--@@@@@@@@@@@@@@@@@@@@@@사진띄우기 모달@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->           

           
           
           
           
           <script type='text/javascript'>
           //사진 클릭시 사진 보여주기 함수
           
           function onparkingImgs(){
        	   $("#onparkingImgsbtn").click();
           }
           
           // 쿠폰 받기를 눌렀을 때
           function getCoupon(couponNo) {
        	   location.href="getCoupon.cu?couponNo=" + couponNo;
		   }
           
           
         	var  freemkFlag=1;
 	     	var  greenmkFlag=1;
 	        var  bluemkFlag=1;
 	        var  yellowmkFlag=1;
 	        var  pinkmkFlag=1;
 	        
 	        
 	        
           $("input:checkbox").change(checkedChange);
   		function checkedChange(){
   				clusterer.clear();
   				
   				
   			if($("#freemk").prop("checked")){
   				console.log("freemk 클릭");
   				freemkFlag=1;
   			}else{
   				console.log("freemk 클릭해제");
   				freemkFlag=0;
   			}
   			if($("#greenmk").prop("checked")){
   				console.log("greenmk 클릭");
   				greenmkFlag=1;
   			}else{
   				console.log("greenmk 클릭해제");
   				greenmkFlag=0;
   			}
   			if($("#bluemk").prop("checked")){
   				console.log("bluemk 클릭");
   				bluemkFlag=1;
   			}else{
   				console.log("bluemk 클릭해제");
   				bluemkFlag=0;
   			}
   			if($("#yellowmk").prop("checked")){
   				console.log("yellowmk 클릭");
   				yellowmkFlag=1;
   			}else{
   				console.log("yellowmk 클릭해제");
   				yellowmkFlag=0;
   			}
   			if($("#pinkmk").prop("checked")){
   				console.log("pinkmk 클릭");
   				pinkmkFlag=1;
   			}else{
   				console.log("pinkmk 클릭해제");
   				pinkmkFlag=0;
   			}
   			
   			
   			selectnearParking();
   			
   			
   			
   			
   			
   		}

           
           
       	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@즐겨찾기 등록 버튼 함수
      		function favoriteReg(){
      			var ppno= $("#pno").val();
      			var mno ="${loginUser.member_no}";
      			if($("#favorite_btn").text()=="즐겨찾기"){
      		 	$.ajax({
					url:"insertfavorite.cu",
					type:"post",
					data:{mno:mno,pno:ppno}, 
					success:function(data){
						if(data==1){
							$("#favorite_btn").text("즐겨찾기 해제");
							alert("즐겨찾기 등록 성공!");
							location.reload();
						}else{
							alert("즐겨찾기 등록 실패!");
						}
					
					},error:function(status){
						console.log(status);
					}
				 }); 
      			}else{
      			 	$.ajax({
						url:"deletefavorite.cu",
						type:"post",
						data:{mno:mno,pno:ppno}, 
						success:function(data){
							if(data==1){
								$("#favorite_btn").text("즐겨찾기");
								alert("즐겨찾기 해제 성공!");
								location.reload();
							}else{
							}
						
						},error:function(status){
							console.log(status);
						}
					 });
      			}
      			
      		}
      
           
           
           
           
           
           
           //설명창 토글 버튼 함수
           		var fla=1;
           		function togglebtn(){
           			if(fla==1){
           				$("#bttn").text("<");
           				$("#explaindiv").hide();
           				fla=0;
/*            				$("#explaindiv").attr('style','visibility:visible'); */
           			}
           			else{
           				$("#bttn").text(">");
           				$("#explaindiv").show();
           				fla=1;
           				/* $("#explaindiv").attr('style','visibility:hidden'); */
           			}
           			
           		}
           		
           		
           
           
           
           
           
           
		       	/* @@@@@@@@@@@@@@@@@@@@@@주차장 예약 신청 버튼 띄우기 */
		        function reservParking(parkingNo) {
		       		
		       		/* if (Number($("#reservOil").text().split("L")[0]) > 0 && $("#coopParkingYN").val() == 'Y') { */
		       			$("#requestButton").html("");
			       		
			       		$("#requestButton").append("<button type='button' class='btn btn-default' data-dismiss='modal' onclick=''>닫기</button>");
			       		$("#requestButton").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			       		$("#requestButton").append("<button type='button' class='btn btn-default' data-dismiss='modal' onclick='requestReserve(" + parkingNo + ")'>신청</button>");
			       		
			       		$("#clickRequestReserve").click();
					/* } else {
						alert("제휴 주차장이 아닙니다!")
					} */
		       		
		       	}
		       	
		       	// 주차장 예약
		       	function requestReserve(parkingNo) {
		       		$("#reservParkingNo").val(parkingNo);
		       		

		       		var today = new Date();
		       		var dd = today.getDate();
		       		var mm = today.getMonth()+1;
		       		var yyyy = today.getFullYear();
		       		
					
		       		if ($("#selectReservDate").val() == "") {
						alert("날짜를 선택해주세요!");
					} else {
						var selday = $("#selectReservDate").val();
			       		var sy = Number(selday.split(" ")[0].split("년")[0]) + 2000;
			       		var sm = Number(selday.split(" ")[1].split("월")[0]);
			       		var sd = Number(selday.split(" ")[2].split("일")[0]);
			       		
			       		console.log(sy + ", " + sm + ", " + sd);
			       		console.log(yyyy + ", " + mm + ", " + dd);
			       		
			       		if (sy > yyyy) {
			       			$("#submitReserveRequest").submit();
						} else {
							if (sy == yyyy) {
					       		if (sm > mm) {
									$("#submitReserveRequest").submit();
								} else {
						       		if (sm == mm) {
							       		if (sd >= dd) {
					       					$("#submitReserveRequest").submit();
										} else {
											alert("지난 시간은 선택할 수 없습니다!");
										}
									} else {
										alert("지난 시간은 선택할 수 없습니다!");
									}
								}
							} else {
								alert("지난 시간은 선택할 수 없습니다!");
							}
						}

					}
		       	}
		       	
		       	$('.form_date').datetimepicker({
		               language:  'ko',
		               weekStart: 1,
		               todayBtn:  1,
		       		autoclose: 1,
		       		todayHighlight: 1,
		       		startView: 2,
		       		minView: 2,
		       		forceParse: 0
		           });
		        /* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ */
		 	
            
            
             /*@@@@@@@@@@@@@@@@@지도 초기 셋팅 @@@@@@@@@@@@@@@@@@@@@@@@@  */
				var mapContainer = document.getElementById('daumMap'), // 지도를 표시할 div 
				mapOption = { 
				    center: new daum.maps.LatLng(37.4989756, 127.03291420000001),
				    draggable:true,
				    scrollwheel:true,// 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};
				
				var map = new daum.maps.Map(mapContainer, mapOption); 
			
				
				var mypositionMarker;
			        
				 var imageSrc = 'resources/common/img/soro.gif', // 마커이미지의 주소입니다    
				    imageSize = new daum.maps.Size(70, 70), // 마커이미지의 크기입니다
				    imageOption = {offset: new daum.maps.Point(50, 50)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
				 
				 
			        // 마커와 인포윈도우를 표시합니다
			        // 마커를 생성합니다
			    mypositionMarker = new daum.maps.Marker({  
			        map: map, 
			        position:new daum.maps.LatLng(37.4989756, 127.03291420000001),
			   		image: markerImage
			    }); 
			    
			        
			    
				
				var zoomlevel=3;
				 daum.maps.event.addListener(map, 'zoom_changed', function() {
					   	zoomlevel=map.getLevel();
					}); 
		 
		 
		 
		  /*@@@@@@@@@@@@@@@@@움직 일때 마다 내위치 마커 이동 @@@@@@@@@@@@@@@@@@@@@@@@@  */
		  /*02/24 검색 결과나 쿠폰 위치조회에서  요청이 있을 때 해당 request 값의 위치로 지도를 띄움 추가*/
				// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
				var count=1;
		  
        	    

				if (navigator.geolocation) {
				    console.log("지오로케이션사용");
				    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
				    navigator.geolocation.watchPosition(function(position) {
				        console.log("움직였음."+count);
				        var lat = position.coords.latitude, // 위도
				            lon = position.coords.longitude; // 경도
				        globalVarLat = position.coords.latitude;
				        globalVarLon = position.coords.longitude;
				        console.log(lat+","+lon);
				        var locPosition = new daum.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				          
				        mypositionMarker.setPosition(new daum.maps.LatLng(lat, lon));
				       
				        if(count==1){
				        	 map.setLevel(3, {anchor: new daum.maps.LatLng(lat, lon)});
				        	map.setCenter(locPosition); 
				        }
				        count++;
					/* displayMarker(locPosition, message); */
					
	
					});
				}
				
				
				
			
				
				if ('${ empty requestLat }' == 'true') {
					
				} else {
		    	    // 만약 검색이나 쿠폰의 위치 조회를 통해서 지도를 볼 때
		    	    // 위치정보를 받았을 경우 내 위치가 아닌 주차장의 위치로 화면을 이동시킴
					var moveLatLon = new daum.maps.LatLng('${ requestLat }', '${ requestlon }');
					map.panTo(moveLatLon);
				}
				
				
				
				
				
				
				
				
				
				//@@@@@@@@@@@@@@@@@내위치 잦기@@@@@@@@@@@@@@@@@
			    function span_myP(){
		        		
		        	    // 지도 중심을 부드럽게 이동시킵니다
		        	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		        	    
		        	    var moveLatLon = mypositionMarker.getPosition();
		        	    	map.panTo(moveLatLon);
		        	    
		        	    
		        }
		          
				
				//@@@@@@@@@@@@@@@@@@@@@네비게이션@@@@@@@@@@@@@@@@@@
				 Kakao.init('df9b4b2c505f7b6860e9e73d0c22e278');
		           var ppname=null;
		           var latt=null;
		           var loo=null;
		           var addr =null;
		           
				 	 function navi(){
				 		 	
					         Kakao.Navi.start({
					        	 name: ppname,
					             x: Number(loo),
					             y: Number(latt),
					             coordType: 'wgs84'
					        }); 
					    }
				
				
				
				
				var geocoder = new daum.maps.services.Geocoder();
				
				
				
				
				
				
				
				//클러스터 생성
				 var clusterer = new daum.maps.MarkerClusterer({
				        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				        gridSize:700,
				        averageCenter: false, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				        minLevel: 8 // 클러스터 할 최소 지도 레벨 
				    });
				
			// 지도가 이동, 확대, 축소로 인해 지도영역이 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
				 daum.maps.event.addListener(map, 'tilesloaded',selectnearParking);
				
       		 function selectnearParking() {
				//로그인되었으면 즐겨찾기 찾아와서 즐겨찾기 마커 등록
				 if("${! empty loginUser }"=="true"){
						 
						 var mno="${loginUser.member_no}";
					 $.ajax({
						        url:"selectfavorites.cu",
						        type:'GET',
						        data: {member_no:mno},
						        success:function(data){
						        	var favorites=data.favoritesP;
									
						        	////////////////
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
						    
						    
						   if(zoomlevel<8){
							   var markers=[];
								 clusterer.clear();
							$.ajax({
								url:"getnearParkings.cu",
								type:"get",
								data:{x0:x0,x1:x1,y0:y0,y1:y1}, 
								success:function(data){
								 	for(t in data.parkings){
								 		var pno=data.parkings[t].parking_NO;
										var lat =data.parkings[t].latitude;
										var lon =data.parkings[t].longitude;
										var type =data.parkings[t].operate_TYPE;
										var name =data.parkings[t].parking_NAME;
										var ntime = Number(data.parkings[t].parking_NTIME);//기본시간
										var nprice =Number(data.parkings[t].parking_NPRICE);//기본시간요금
										var atime=Number(data.parkings[t].parking_ATIME);//추가시간
										var aprice=Number(data.parkings[t].parking_APRICE);//추가시간요금
										var pinfo=data.parkings[t].price_INFO;//유료or무료
										var favoriteOX=0;
										var img=null;
										
										var allfair=0;
										
										var Platlng =new daum.maps.LatLng(lat, lon);
										
										if(pinfo=="유료"&&ntime>0){
											
										if(atime>0){	
										 if(ntime>30){
											 var em=Number(ntime/30);
											 allfair=Number(nprice/em);
										 }else{
											 var emptytime=Number(30-ntime);
											 var afairtime=Number(emptytime/atime);
											 var afair=Number(afairtime*aprice);
											 allfair=Number(nprice+afair);
										 }
										}
										else{
											if(ntime>30){
												 var em=Number(ntime/30);
												 allfair=Number(nprice/em);
												 
											 }else{
												 var em2 =Number(30/ntime);
												 allfair=Number(em2*nprice);
												 
											 }
											
										}
										}else{
											if(pinfo=="무료"){
												if(freemkFlag==0){
													img="nochecked";
												}else{
												img='resources/common/img/freeparking.png';
												}
											}
											 else if(atime>0){
												 if(atime>30){
													 var em=Number(atime/30);
													 allfair=Number(aprice/em);
													 
												 }else{
												// var emptytime=Number(30-ntime);
												//	 var afairtime=Number(emptytime/ntime);
												//	 var afair=Number(afairtime*nprice);
												//	 allfair=Number(nprice+afair); 
													 var em2 =Number(30/atime);
													 allfair=Number(em2*aprice);
												 }
												 
											 } 
											else{
												/* img='resources/common/img/muni.png'; */
											}
										}
										
										
							 	        
										if((0<=allfair) && (1500>allfair)){
											if(greenmkFlag==0){
												img="nochecked";
											}else{
											 img='resources/common/img/greenMarker.png';
											}
											}else if((1500<=allfair) && (3000>allfair)){
												if(bluemkFlag==0){
													img="nochecked";
												}else{
													 img='resources/common/img/blueMarker.png';
												}
											}else if((3000<=allfair) && (5000>allfair)){
												if(yellowmkFlag==0){
													img="nochecked";
												}else{
												img='resources/common/img/yellowMarker.png';
												}
												
											}else if(allfair>=5000){
												if(pinkmkFlag==0){
													img="nochecked";
												}else{
												img='resources/common/img/pinkMarker.png';
												}
											}
											else{
												/*  img='resources/common/img/muni.png';  */
											}
										
										if(img==null){
											/* img='resources/common/img/muni.png'; */
										}
										
										
									   for(var f in favorites)
										   {
										   		if(favorites[f]==pno){
										   			img='resources/common/img/favorite_on.png';
										   			favoriteOX=1;
										   		}
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
										if(favoriteOX==1){
											var Fmarker= new daum.maps.Marker({
									            position:new daum.maps.LatLng(lat, lon),
										 		image:parkingImg,
										 		map:map
									        });
											
							 	    	}else{
							 	    		var marker2= new daum.maps.Marker({
									            position:new daum.maps.LatLng(lat, lon),
										 		image:parkingImg
									        });
							 	    	}
										
										
										
										
										if(img=="nochecked"){
											console.log("체크안됌");
										}else{
										
								 		markers.push(marker2);
										
										daum.maps.event.addListener(marker2, 'click',makeclickListener(map,marker2,data.parkings[t],allfair,favoriteOX));
										}
								
								 		
								 		 
								 	}
								 	
								 	
								 	//로그인 시 마커 클릭했을떄 이벤트 등록
								 	function makeclickListener(map, marker, parking,price,favoriteOX) {
								 	    return function() {
								 	    	/*  pname allseat extraseat */
								 	    	$("#pno").val(parking.parking_NO);
								 	    	$("#detailparking").click();
								 	    	console.log(parking);
								 	    	ppname=parking.parking_NAME;
								 	    	addr =parking.address;
								 	    	 latt=parking.latitude;
								 	    	loo=parking.longitude;
								 	    	$("#pname").text(parking.parking_NAME);
								 	    	$("#allseat").text(parking.parking_SIZE);
								 	    	$("#extraseat").text(parking.left_SIZE);
								 	    	$("#price").text(Number(price));
								 	    	$("#time").text(parking.weekday_STIME+"~ 익일:"+parking.weekday_ETIME);
								 	    	$("#paddr").text(addr);
								 	    	$("#stime").text(parking.sat_STIME+"~ 익일:"+parking.sat_ETIME);
								 	    	$("#gtime").text(parking.holiday_STIME+"~ 익일:"+parking.holiday_ETIME);
								 	    	//이미지 불러오는 함수
								 	    	selectParkingImg(parking.parking_NO);
								 	    	
								 	    	if(favoriteOX==1){
								 	    		$("#favorite_btn").text("즐겨찾기 해제");
								 	    	}else{
								 	    		$("#favorite_btn").text("즐겨찾기");
								 	    	}
								 	 

								 	    	//게시판용
								 	    	$("#pno").val(parking.parking_NO);
								 	    	$("#pName").val(parking.parking_NAME);

								 	    	/* 예약기능 텍스트 추가 */
								 	    	$("#reservName").text(parking.parking_NAME + " 예약");

								 	    	// 쿠폰이 존재하는지 검색하는 Ajax parking.parking_NO를 이용
								 	    	$.ajax({
								 	    		url: "selectParkingCoupon.cu",
								 	    		type: "POST",
								 	    		data: {parkingNo:parking.parking_NO},
								 	    		success: function(data){
								 	    			console.log(data);
								 	    			if (data.couponName != '결과가 없어욤') {
								 	    				$("#selectCoupon").css("display" , "");
								 	    				$("#selectCoupon").attr("onclick", "getCoupon(" + data.couponNo + ")");
													} else {
														$("#selectCoupon").css("display" , "none");
														$("#selectCoupon").removeAttr("onclick");
													}
								 	    		},error:function(status){
								 	    			console.log(status);
								 	    			$("#selectCoupon").css("display" , "none");
													$("#selectCoupon").removeAttr("onclick");
								 	    		}
								 	    	});
								 	    	 
								 	    };
								 	}
							 clusterer.addMarkers(markers);
							
									},error:function(status){
									console.log(status);
								}
							 });
						 }
						        	
						        	
						        	
						        },
						        error:function(jqXHR, textStatus, errorThrown){
						            alert("에러 발생~~" + textStatus + " : " + errorThrown);
						        }
						    }); 
					 
					 }
					 if("${ empty loginUser }"=="true"){
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
						    
						    
						   if(zoomlevel<8){
							   var markers=[];
								 clusterer.clear();
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
										
										if(pinfo=="유료"&&ntime>0){
											
										if(atime>0){	
										 if(ntime>30){
											 var em=Number(ntime/30);
											 allfair=Number(nprice/em);
										 }else{
											 var emptytime=Number(30-ntime);
											 var afairtime=Number(emptytime/atime);
											 var afair=Number(afairtime*aprice);
											 allfair=Number(nprice+afair);
										 }
										}
										else{
											if(ntime>30){
												 var em=Number(ntime/30);
												 allfair=Number(nprice/em);
												 
											 }else{
												 var em2 =Number(30/ntime);
												 allfair=Number(em2*nprice);
												 
											 }
											
										}
										}else{
											if(pinfo=="무료"){
												if(freemkFlag==0){
													img="nochecked";
												}else{
												img='resources/common/img/freeparking.png';
												}
											}
											 else if(atime>0){
												 if(atime>30){
													 var em=Number(atime/30);
													 allfair=Number(aprice/em);
													 
												 }else{
												// var emptytime=Number(30-ntime);
												//	 var afairtime=Number(emptytime/ntime);
												//	 var afair=Number(afairtime*nprice);
												//	 allfair=Number(nprice+afair); 
													 var em2 =Number(30/atime);
													 allfair=Number(em2*aprice);
												 }
												 
											 } 
											else{
												/* img='resources/common/img/muni.png'; */
											}
										}
										
										if((0<=allfair) && (1500>allfair)){
											if(greenmkFlag==0){
												img="nochecked";
											}else{
											 img='resources/common/img/greenMarker.png';
											}
											}else if((1500<=allfair) && (3000>allfair)){
												if(bluemkFlag==0){
													img="nochecked";
												}else{
													 img='resources/common/img/blueMarker.png';
												}
											}else if((3000<=allfair) && (5000>allfair)){
												if(yellowmkFlag==0){
													img="nochecked";
												}else{
												img='resources/common/img/yellowMarker.png';
												}
												
											}else if(allfair>=5000){
												if(pinkmkFlag==0){
													img="nochecked";
												}else{
												img='resources/common/img/pinkMarker.png';
												}
											}
											else{
												/*  img='resources/common/img/muni.png';  */
											}
										
										if(img==null){
											/* img='resources/common/img/muni.png'; */
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
										
										if(img=="nochecked"){
											console.log("체크안됌");
										}else{
										
								 		markers.push(marker2);
										
										daum.maps.event.addListener(marker2, 'click',makeclickListener(map,marker2,data.parkings[t],allfair));
										}
								 		
								 		 
								 	}
								 	
								 	
								 	
								 	//노로그인 마커 클릭했을떄 이벤트 등록
								 	function makeclickListener(map, marker, parking,price) {
								 	    return function() {
								 	    	/*  pname allseat extraseat */
								 	    	$("#detailparking").click();
								 	    	console.log(parking);
								 	    	
								 	    	ppname=parking.parking_NAME;
								 	    	addr =parking.address;
								 	    	 latt=parking.latitude;
								 	    	loo=parking.longitude;
								 	    	$("#pname").text(parking.parking_NAME);
								 	    	$("#allseat").text(parking.parking_SIZE);
								 	    	$("#extraseat").text(parking.left_SIZE);
								 	    	$("#price").text(parseInt(price));
								 	    	$("#time").text(parking.weekday_STIME+"~ 익일:"+parking.weekday_ETIME);
								 	    	$("#paddr").text(addr);
								 	    	//이미지 불러오는 함수
								 	    	selectParkingImg(parking.parking_NO);
								 	    	
								 	  	 	$("#stime").text(parking.sat_STIME+"~ 익일:"+parking.sat_ETIME);
							 	    		$("#gtime").text(parking.holiday_STIME+"~ 익일:"+parking.holiday_ETIME);
								 	 		
								 	    	/* 예약기능 텍스트 추가 */
								 	    	$("#reservName").text(parking.parking_NAME + " 예약");

								 	    	 

								 	    	//게시판용

								 	    	$("#pno").val(parking.parking_NO);
								 	    	$("#pName").val(parking.parking_NAME);
								 	    	
								 	    	

								 	    };
								 	}
							 clusterer.addMarkers(markers);
							
									},error:function(status){
									console.log(status);
								}
							 });
					 }
					 
					 
					 }
					 }
       		 
       		 
       		 
       		 //마커를 클릭했을 떄 이미지 불러오는 함수
       		 
       		 function selectParkingImg(pno){
       			$.ajax({
       			           url: "selectParkingImg.cu",
       			           type: "POST",
       			           data: {pno:pno},
       			           success: function(data){
       			        	   console.log("주차장 사진");
       			        	   console.log(data);
       			        	 $("#pimg1").attr("src","resources/common/img/noimage.gif");
       			        	 $("#pimg2").attr("src","resources/common/img/noimage.gif");
       			        	 $("#pimg3").attr("src","resources/common/img/noimage.gif");
       			        	 $("#pimg4").attr("src","resources/common/img/noimage.gif");
       			        	   for(f in data.att){
       			        		   if(data.att[f].file_level==1){
       			        		   var hwak=data.att[f].origin_name.split(".")[1];
       			        		   $("#pimg1").attr("src","resources/common/parkingImage/"+data.att[f].change_name+"."+hwak);
       			        		   $("#pimg2").attr("src","resources/common/parkingImage/"+data.att[f].change_name+"."+hwak);
       			        		   }
       			        		   if(data.att[f].file_level==2){
       			        			 var hwak=data.att[f].origin_name.split(".")[1];
       			        			$("#pimg3").attr("src","resources/common/parkingImage/"+data.att[f].change_name+"."+hwak);
       			        		   }
       			        		if(data.att[f].file_level==3){
       			        		 	var hwak=data.att[f].origin_name.split(".")[1];
       			        			$("#pimg4").attr("src","resources/common/parkingImage/"+data.att[f].change_name+"."+hwak);
       			        		   }
       			        	   }
       			                         
       			           },error:function(status){
							console.log(status);
						}
       			      });


       			 
       			 
       			 
       			 
       		 }
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
       		 
				
			</script>
		
			  
			     
  
 
 
 <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@사이드바 자리입니다.  -->
 <!--@@@@@@@@@@@@@@@@@@@사이드바@@@@@@@@@@@@@@@@@@@@@@@@@  -->
 
<%--  <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="sidebar" style="background: rgb(49, 49, 49) !important; margin-top:50px; width:150px; font-size:0.7em;">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper" style="overflow: hidden; z-index:10000;">
        <div class="logo">
        
        
        
          <br>
          <br>
          
          <!-- <a id="userId" href="javascript:void(0)" class="simple-text logo-mini">
           	송현영
          </a> -->
          <div style="color:white;">
          <c:if test="${ empty loginUser }">
          	  <button class="btn btn-info btn-sm" onclick="location.href='customer_loginPage.cu'" style="font-size:0.7em;">로그인</button>
          </c:if>
          </div>
          <c:if test="${ !empty loginUser }">
          <div style="color:white;">
		      <span id="userId" >
		           ${ loginUser.member_name }
	          </span>
	          <span>님 환영합니다.</span>
	          </div>
	          <div style="font-size: 1em;color: wheat;">
	           <span>현재 보유오일 :</span>
	          <span id="oilmount">${ UserOilInfo }</span>
	          </div>
          </c:if>
          
          
          <!-- <a href="javascript:void(0)" class="simple-text logo-normal">
         	님 환영합니다.
          </a> -->
          <c:if test="${ empty loginUser }">
              
          </c:if>
          <c:if test="${ !empty loginUser }">
			  <!--정보수정  -->
	          <button class="btn btn-link" id="search-button" onclick="location.href='customerInfo.cu'" style="color: gray; font-size:0.7em; "><i class="tim-icons icon-badge"></i>&nbsp;&nbsp;내정보수정
	                  <span class="d-lg-none d-md-block"></span>
	          </button>
	          <!--로그아웃  -->
	          <button class="btn btn-link" id="search-button" onclick="location.href='customerLogOut.cu'" style="color: gray; font-size:0.7em;"><i class="tim-icons icon-button-power"></i>&nbsp;&nbsp;로그아웃
	                  <span class="d-lg-none d-md-block"></span>
	          </button>
          </c:if>
          
         
          
        </div>
        <ul class="nav">
          <li style="font-size:0.7em;" >
            <a href="./coupon.cu">
              <i class="tim-icons icon-chart-bar-32"></i>
            	쿠폰함
            </a>
          </li>
          <li style="font-size:0.7em;">
            <a href="./oil.cu">
              <i class="tim-icons icon-atom"></i>
              	오일
            </a>
          </li>
          <li style="font-size:0.7em;">
            <a href="./reserv.cu">
              <i class="tim-icons icon-satisfied"></i>
              	예약내역
            </a>
          </li>
          <li style="font-size:0.7em;">
            <a href="./customer.cu">
              <i class="tim-icons icon-single-copy-04"></i>
             	 지도
            </a>
          </li> 
          <li style="font-size:0.7em;">
          <a href="./customerNotice.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	공지사항
            </a>
          </li>
           <li style="font-size:0.7em;">
          <a href="./review.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 후기
            </a>
          </li>  
           <li style="font-size:0.7em;">
          <a href="./qna.cu">
              <i class="tim-icons icon-single-copy-04"></i>
              	내 문의
            </a>
          </li>           
        </ul>
        <script>
        $(function(){
         $(".nav").children("li").mouseover(function(){
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
</body>
 <script type="text/javascript">
	//네이버 로그인
  var naver_id_login = new naver_id_login("hEi80LKwFmVECmA2A2z0", "https://ec2-54-180-197-57.ap-northeast-2.compute.amazonaws.com/jjg/customer.cu");
  // 접근 토큰 값 출력
 // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    console.log(naver_id_login.getProfileData('email'));
    console.log(naver_id_login.getProfileData('name'));
  	console.log(naver_id_login.getProfileData('id'));
  
   var member_id=naver_id_login.getProfileData('id');
    var member_name=naver_id_login.getProfileData('name');
    var email = naver_id_login.getProfileData('email');
     console.log(member_id);
     console.log(member_name);
     console.log(email); 
      location.href="./naverLogin.cu?member_id="+member_id+"&member_name="+member_name+"&email="+email;
  
 
  }
	  
  $(function(){
	 $("#qna").click(function(){
		 var num = $("#pno").val();
		 console.log(num);
		var pName = $("#pName").val();
		console.log(pName);
		 location.href="./parkingQna.cu?num="+num+"&pName="+pName;
	
	 });
  });	 

  $(function(){
	 $("#review").click(function(){
		 var num = $("#pno").val();
		 console.log(num);
		 var pName = $("#pName").val();
			console.log(pName);
		
			location.href="./parkingReview.cu?num="+num+"&pName="+pName;
		
	 });
  });
  
  
</script>
</html>