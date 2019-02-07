<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			        <div class="table-responsive"  style="overflow: hidden; padding-bottom: 0px;">
			          <table class="table tablesorter " id="" style="margin-bottom: 0px;">
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
      
      <!-- <script>
      /* @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 음성 인식 */
      	
      	$(function() {
      		const Recognition = window.SpeechRecognition || window.webkitSpeechRecognition;
      		console.log(Recognition);
    		if (!Recognition) {
    			alert('음성인식 서비스는 크롬 브라우저에서만 지원됩니다!');
    			return;
    		}
    		
    		this.recognition = new Recognition();
    		
    		console.log(this.recognition)
    		
    		this.recognition.lang = 'ko-KR';
    		
    		this.recognition.onresult = event => {
    			const text = event.results[0][0].transcript;

    			console.log('입력된 음성 : ', text); // text 변수에 인식된 음성을 text 형태로 변환한 문자가 들어있다.
    		};
    		
    		this.recognition.onresult = event => {
    			const text = event.results[0][0].transcript;
    			console.log('transcript', text);
    			this.setState({ text });
    		};

    		this.recognition.onspeechend = () => {
    			console.log('stopped');
    			this.setState({ show: true });
    		};

    		this.recognition.onnomatch = event => {
    			console.log('no match');
    			this.setState({ text: "Sorry, can't hear" });
    		};

    		this.recognition.onstart = () => {
    			console.log('음성 서비스 시작')
    			this.setState({
    				listening: true,
    			});
    		};
    		
    		this.recognition.onstart();
		});

      </script> -->
<script src="/jjg/resources/STTService/annyang.js"></script>
<script type="text/javascript">
/* 
--------------------진짜 음성인식 annyang (https://jeongchul.tistory.com/539을 참조함)
 */
 	function startSTT() {
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
 	                if (final_transcript == '서울') {
 	                	$("#STTResult").html("<h1>서울?</h1>");
					} else if (final_transcript == '근처 주차장') {
						
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

      
      