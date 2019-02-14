<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute bg-white">
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
	            <button class="btn btn-link" id="search-button" data-toggle="modal" data-target="#searchModal"><i class="tim-icons icon-zoom-split" style="color: black;"></i> 검색
	            </button>
	            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            <button class="btn btn-link" data-toggle="modal" data-target=".bd-example-modal-lg-6" onclick="startSTT();"><i class="fas fa-microphone-alt" style="color: black;"></i> 음성
	            </button>
            </div>
            <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 음성 인식 모달 -->
            <div class="modal fade bd-example-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px;">
			        <div class="table-responsive" id="voiceSize" style="overflow: auto; padding-bottom: 0px;">
			          <table class="table tablesorter " style="margin-bottom: 0px;">
			            <tbody id="STTResult">
			                  <tr><td align="center"><b><i class="fas fa-microphone-alt" style="color: white;"></i> &nbsp;&nbsp; - &nbsp;&nbsp; 검색결과</b></td></tr>
			                  <tr>
			                  	<td align="center" id="STTtext">
			                  		음성 키워드<br>
			                  		지역 이름&nbsp;&nbsp;&nbsp; ex)지역 서울<br>
			                  		근처 주차장<br><br><br>
			                  		※ 크롬 브라우저에서만 사용 가능합니다.
			                  	</td>
			                  </tr>
			                  <tr><td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="stopSTT();">닫기</button></td></tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
          </div>
          <!-- nav 바 상단 우측 땡댕땡 주석처리 -->
          <!--  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>  -->
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
          <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 텍스트 검색 모달 -->
            <div class="modal fade bd-search-modal-lg-6" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content" style="background: rgb(39,41,61);">
			      <div class="modal-body" style="padding-bottom: 0px;">
			        <div class="table-responsive" id="tableSize" style="overflow: auto; height: 400px; padding-bottom: 0px;">
			          <table class="table tablesorter " id="tableView" style="margin-bottom: 0px;">
			            <tbody id="searchTextResult" style="overflow-y:auto; overflow-x:hidden;">
			            	  <tr align="center">
			            	  	<th colspan="2">주차장 명 검색 결과</th>
			            	  </tr>
			                  <tr>
			                  	<td align="center"><b><i class="fas fa-microphone-alt" style="color: white;"></i> &nbsp;&nbsp; - &nbsp;&nbsp; 검색결과</b></td>
			                  </tr>
			                  <tr>
			                  	<td align="center"><button type="button" class="btn btn-default" data-dismiss="modal" onclick="">닫기</button></td>
			                  </tr>      
			            </tbody>
			          </table>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
		  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" id="closeSearchModal" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
              <input type="hidden" id="hiddenModal" class="btn btn-link" data-toggle="modal" data-target=".bd-search-modal-lg-6">
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
      
      <script type="text/javascript">
		// 텍스트 검색 스크립트
		$(function() {
			$("#inlineFormInputGroup").keypress(function(e) { 
			    if (e.keyCode == 13){
			    	var keyword = $("#inlineFormInputGroup").val();
			    	
			        $("#closeSearchModal").click();
			        
			        $.ajax({
			    		url:"searchTextParking.cu",
			    		type:"post",
			    		data:{keyword:keyword},
			    		success:function(data){
			    			$("#hiddenModal").click();
			    			
			    			var sortData = [];
			    			
			    			$.each(data, function(index, value){
			    	               sortData.push({key: index, value: value});
			    	        });
			    			
			    			sortData.sort(function(a, b){
			    	               /* return(a.key < b.key) ? -1 : (a.key > b.key) ? 1 : 0; */
			    	               return ((a.key < b.key) ? -1 : ((a.key > b.key) ? 1 : 0));
			    	        });
			    			
			    			console.log(sortData);
			    			
			    			var table = $("#searchTextResult");
			    			
			    			table.html("");
			    			
			    			table.append("<tr>"
				            	  	+ "<th>주차장 명</th>"
				            	  	+ "<th>기본 요금</th>"
					            	+ "</tr>");
			    			
			    			// 가까운 거리 순으로 정렬하고 싶으면 DB 쿼리문에서 땡겨와야 함 END 부분은 더 이상 수정 불가능
			    			if (sortData.length > 0) {
			    				var boolCheck = true; // 200000 체크용
			    				// 주차장 명 검색 결과
			    				table.append("<tr>"
				            	  	+ "<th colspan='2'>주차장 명 기준 검색 결과</th>"
					            	+ "</tr>");
			    				for (var i = 0; i < sortData.length; i++) {
			    					if (boolCheck) {
										if (sortData[i].key > 200000) {
											boolCheck = false;
						    				table.append("<tr>"
								            	  	+ "<th colspan='2'>주차장 주소 기준 검색 결과</th>"
									            	+ "</tr>");
										}
									}
			    					
				    				if (sortData[i].value.parking_NPRICE == '0') {
				    					table.append(
								            	"<tr>"
								            	+ "<td style='color: white;'>"
								            	+ sortData[i].value.parking_NAME
								            	+ "</td>"
								            	+ "<td style='color: white;'>"
								            	+ "정보 없음"
								            	+ "</td>"
								            	+ "</tr>"
								            	);
									} else {
										table.append(
								            	"<tr>"
								            	+ "<td style='color: white;'>"
								            	+ sortData[i].value.parking_NAME
								            	+ "</td>"
								            	+ "<td style='color: white;'>"
								            	+ sortData[i].value.parking_NPRICE
								            	+ "</td>"
								            	+ "</tr>"
								            	);
									}
			    					
								}
			    			
			    				$("#textSize").css("height", "400px");
							} else {
								table.append(
						            	"<tr align='center'>"
					                  	+ "<td align='center' colspan='2'>검색 결과가 없습니다!</td>"
						                + "</tr>"
				    					);
							}
			    				
			    			table.append(
					            	"<tr align='center'>"
				                  	+ "<td align='center' colspan='2'><button type='button' class='btn btn-default' data-dismiss='modal' onclick=''>닫기</button></td>"
					                + "</tr>"
			    					);
			    			
			    		},
			    		error:function(status){
			    			console.log(status);
			    		}
			    		
			    	});
			    }    
			});
		});
	  </script>

<script src="/jjg/resources/STTService/annyang.js"></script>
<script type="text/javascript">
/* 
--------------------진짜 음성인식 annyang (https://jeongchul.tistory.com/539을 참조함)
 */
 	function stopSTT() {
 		console.log("STT 서비스 종료");
 		annyang.abort();
	}
	
 	function startSTT() {
 		$("#voiceSize").css("height", "auto");
 		
 		$("#STTResult").html("");
 		
 		$("#STTResult").append("<tr><td align='center'><b><i class='fas fa-microphone-alt' style='color: white;'></i> &nbsp;&nbsp; - &nbsp;&nbsp; 검색결과</b></td></tr>"
 							+ "<tr><td align='center' id='STTtext'>"
        					+ "음성 키워드<br>지역 이름&nbsp;&nbsp;&nbsp; ex)지역 서울<br>근처 주차장<br><br><br>※ 크롬 브라우저에서만 사용 가능합니다."
        					+ "</td></tr>"
        					+ "<tr><td align='center'><button type='button' class='btn btn-default' data-dismiss='modal'  onclick='stopSTT();'>닫기</button></td></tr>");
 		
 	    annyang.start({ autoRestart: false, continuous: false })
 	    var recognition = annyang.getSpeechRecognizer();
 	    var final_transcript = '';
 	    recognition.interimResults = true;
 	    console.log("음성 인식 시작")
 	    recognition.onresult = function(event) {
 	        var interim_transcript = '';
 	        final_transcript = '';
 	        for (var i = event.resultIndex; i < event.results.length; ++i) {
 	            if (event.results[i].isFinal) {
 	                final_transcript += event.results[i][0].transcript;
 	                console.log("final_transcript="+final_transcript);
 	                if (final_transcript.substring(0, 2) == '지역') {
 	                	searchVoice(final_transcript.substring(3, 5), final_transcript.substring(0, 2));
					} else if (final_transcript == '근처 주차장') {
						searchVoice('XX', '근처 주차장');
					} else {
						$("#STTtext").text("올바른 키워드로 말해주세요!")
					}
 	                
 	                //annyang.trigger(final_transcript); //If the sentence is "final" for the Web Speech API, we can try to trigger the sentence
 	            } else {
 	                interim_transcript += event.results[i][0].transcript;
 	                console.log("interim_transcript="+interim_transcript);
 	            }
 	        }
 	    };
	}
</script>
<script type="text/javascript">
function searchVoice(keyword, type) {
	var table = $("#STTResult");
	
	if (type == '근처 주차장') {
		
		if (navigator.geolocation) {
			
			navigator.geolocation.getCurrentPosition(function(position) {
				
				var lati = position.coords.latitude;
				var longi = position.coords.longitude;
				
				var location = lati + "/" + longi;
				
				$.ajax({
					url:"searchVoiceParking.cu",
					type:"post",
					data:{keyword:location, type:type},
					success:function(data){
						console.log(data);
					},
					error:function(status){
						console.log(status);
					}
					
				});
			});
		}

	} else {
		console.log(keyword + "/" + type);
		
		$.ajax({
			url:"searchVoiceParking.cu",
			type:"post",
			data:{keyword:keyword, type:type},
			success:function(data){
				console.log(data);
				$("#voiceSize").css("height", "400px")
				table.html("");
				
				table.append("<tr align='center'>"
						+ "<th colspan='2'>"
						+ "<b><i class='fas fa-microphone-alt' style='color: white;'></i> &nbsp;&nbsp; - &nbsp;&nbsp;'" + type + " " + keyword + "'의 검색결과</b>"
						+ "</th>"
						+ "</tr>");
				
    			table.append("<tr>"
	            	  	+ "<th>주차장 명</th>"
	            	  	+ "<th>기본 요금</th>"
		            	+ "</tr>");
    			
    			var sortData = [];
    			
    			$.each(data, function(index, value){
    	               sortData.push({key: index, value: value});
    	        });
    			
    			sortData.sort(function(a, b){
    	               /* return(a.key < b.key) ? -1 : (a.key > b.key) ? 1 : 0; */
    	               return ((a.key < b.key) ? -1 : ((a.key > b.key) ? 1 : 0));
    	        });
    			
    			// 가까운 거리 순으로 정렬하고 싶으면 DB 쿼리문에서 땡겨와야 함 END 부분은 더 이상 수정 불가능
    			if (sortData.length > 0) {
    				var boolCheck = true; // 200000 체크용
    				// 주차장 명 검색 결과
    				table.append("<tr>"
	            	  	+ "<th colspan='2'>주차장 명 기준 검색 결과</th>"
		            	+ "</tr>");
    				for (var i = 0; i < sortData.length; i++) {
    					if (boolCheck) {
							if (sortData[i].key > 200000) {
								boolCheck = false;
			    				table.append("<tr>"
					            	  	+ "<th colspan='2'>주차장 주소 기준 검색 결과</th>"
						            	+ "</tr>");
							}
						}
    					
	    				if (sortData[i].value.parking_NPRICE == '0') {
	    					table.append(
					            	"<tr>"
					            	+ "<td style='color: white;'>"
					            	+ sortData[i].value.parking_NAME
					            	+ "</td>"
					            	+ "<td style='color: white;'>"
					            	+ "정보 없음"
					            	+ "</td>"
					            	+ "</tr>"
					            	);
						} else {
							table.append(
					            	"<tr>"
					            	+ "<td style='color: white;'>"
					            	+ sortData[i].value.parking_NAME
					            	+ "</td>"
					            	+ "<td style='color: white;'>"
					            	+ sortData[i].value.parking_NPRICE
					            	+ "</td>"
					            	+ "</tr>"
					            	);
						}
    					
					}
    			
    				$("#voiceSize").css("height", "400px");
				} else {
					table.append(
			            	"<tr align='center'>"
		                  	+ "<td align='center' colspan='2'>검색 결과가 없습니다!</td>"
			                + "</tr>"
	    					);
				}
				
				table.append("<tr align='center'>"
						+ "<td colspan='2'>"
						+ "<button type='button' class='btn btn-default' data-dismiss='modal' onclick=''>닫기</button>"
						+ "</td>"
						+ "</tr>");
			},
			error:function(status){
				console.log(status);
			}
			
		});
	}
	
	
}
</script>
<!-- <script type="text/javascript">
var lati;
var longi;
if (navigator.geolocation) {
	console.log("이것도 되는거야?");
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.watchPosition(function(position) {
        lati = position.coords.latitude; // 위도
        longi = position.coords.longitude; // 경도
    });
    console.log(lati + "/" + longi);
}
</script> -->

      
      