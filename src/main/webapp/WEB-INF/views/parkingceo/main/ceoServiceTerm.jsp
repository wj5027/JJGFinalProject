<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style type="text/css">
	#hiddenButton{
		display: none;
	}
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
      
      <!-- 로그인 영역 -->
        <div class="row">
		  <div class="col-md-12">
            <div class="card " style="width: 700px;  margin-left: auto; margin-right: auto;">
              <div class="card-header">
                <h4 class="card-title"><b>사장님 이용 약관 동의</b></h4>
              </div>
              <div class="card-body">
              	      <div class="form-group">
        		<label for="exampleFormControlTextarea1">사업자 이용약관</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="30">
제 1 조 (목적)
이 약관은 지주갑(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "주차장 관리 시스템"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.

 

제 2 조 (약관의 효력 및 변경)
① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.

 

제 3 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.

 

제 2 장 서비스 이용계약

 

제 4 조 (이용계약의 성립)
① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.

 

제 5 조 (이용신청)
① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.

 

제 6 조 (이용신청의 승낙)
① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
가. 서비스 관련 설비에 여유가 없는 경우
나. 기술상 지장이 있는 경우
다. 기타 사이트가 필요하다고 인정되는 경우
③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
나. 이용자 정보를 허위로 기재하여 신청한 경우
다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우
        
제 7 조 (이용자정보의 변경)
회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.

 

제 3 장 계약 당사자의 의무

 

제 8 조 (사이트의 의무)
① 사이트는 회원에게 각 호의 서비스를 제공합니다.
가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
나. 추가 도메인 등록시 개인정보 자동 입력
다. 도메인 등록, 관리를 위한 각종 부가서비스
② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.

 

제 9 조 (회원의 의무)
① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
가. 다른 회원의 ID를 부정하게 사용하는 행위
나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
마. 범죄와 결부된다고 객관적으로 판단되는 행위
바. 기타 관계법령에 위배되는 행위
② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.

 

제 4 장 서비스 제공 및 이용

 

제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)
① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.

 

제 11 조 (서비스 제한 및 정지)
① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.

 

제5장 계약사항의 변경, 해지

 

제 12 조 (정보의 변경)
회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.

 

제 13 조 (계약사항의 해지)
회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
② 정보통신윤리위원회가 이용해지를 요구한 경우
③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.

 

제6장 손해배상

 

제 14 조 (면책조항)
① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.

 

제 15 조 (관할법원)

 

서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.
        </textarea>
      			</div>
              	<div class="form-check form-check-inline" style="width: 100%" align="right">
              		<label class="form-check-label">
              			<input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">위 약관에 동의합니다.
              			<span class="form-check-sign"></span>
              		</label>
              	</div>
              	<br>
                   <div class="form-group">
        		<label for="exampleFormControlTextarea1">개인정보 수집 및 이용에 대한 안내</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="30">
        
        가. 개인정보의 수집, 이용 목적

공공데이터포털은 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 정해진 용도 이외로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
  ○. 포털 사이트 서비스 제공을 위한 회원관리
    • 필수 목적
      - 공공데이터의 제공 및 활용신청
      - 공공데이터 등록/관리를 위한 사용자 관리 등
    • 선택 목적
      - 공공데이터포털 및 데이터 활용 관련 정보 제공
      - 공공데이터 활용현황 조사
    • 선택 목적에 동의하지 않는 경우, 포털 및 데이터 활용 관련 정보 제공과 활용 현황조사 대상에서 제외됩니다.

  ○. 공공데이터 제공신청 처리
    • 필수 목적
      - 공공데이터 제공신청서에 포함된 개인정보는 제공신청 접수 및 처리기관에서 이용
      (공공데이터 제공신청서, 결정 통보서, 제공신청 처리와 관련된 서비스 등)
나. 수집하는 개인정보의 항목

공공데이터포털은 다음의 개인정보 항목을 수집하고 있습니다.
  ○. 공공데이터포털 회원정보
    • 회원가입 시 입력해야 하는 필수항목과 선택항목이 있으며, 선택항목은 입력하지 않으시더라도 서비스 이용에는 제한이 없습니다.
    • 일반회원가입
      - 필수항목 : 이름, 아이디, 비밀번호, 이메일, 휴대전화번호
      - 선택항목 : 인증서정보, 전화번호
    • 기관회원가입
      - 필수항목 : 이름, 아이디, 비밀번호, 이메일, 휴대전화번호, 인증서 등록, 사용자/기관/업종분류, 기관명
      , 사업자등록번호, 전화번호, 소속부서명
      - 선택항목 : 위치기반서비스 사업자 확인
    • 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
      - 항목 : 방문 일시, 서비스 이용기록, IP 주소

  ○. 공공데이터포털 제공 신청 정보
    - 필수항목 : 성명, 생년월일, 주소, 전화번호, 전자우편주소
    - 선택항목 : 사업자(법인, 단체) 등록번호
다. 개인정보의 처리 및 보유기간

공공데이터포털은 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다. 
  ○. 공공데이터포털 회원정보
    - 수집근거 : 정보주체의 동의
    - 보존기간 : 회원 탈퇴 의사 전까지(2년 경과 시 재동의)
    - 보존근거 : 정보주체의 동의에 의한 자료수집

  ○. 공공데이터 제공신청 처리정보
    - 수집근거 : 공공데이터의 제공 및 이용활성화에 관한 법률 제27조제1항 및 동법 시행령 제21조
    - 보존기간 : 10년
    - 보유근거 : 공공기록물 관리에 관한 법률 시행령 제26조제1항
라. 동의를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용

이용자는 "공공데이터포털"에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며, 동의 거부 시에는 회원가입, 공공데이터포털 서비스 이용이 제한됩니다.
        </textarea>
      			</div>
              	<div class="form-check form-check-inline" style="width: 100%" align="right">
              		<label class="form-check-label">
              			<input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="option2">위 약관에 동의합니다.
              			<span class="form-check-sign"></span>
              		</label>
              	</div>
              	<br>
              	<br>
                    
                <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm" onclick="location.href='parkingceoLogin.pc'">취소</button>&nbsp;&nbsp;&nbsp;
                    <button class="btn btn-info btn-sm" onclick="insertParkingCeoPage();">확인</button>
				</div>
              </div>
            </div>
          </div>
	  </div>
    </div>
  </div>
</div>
  
</body>


     <div class="modal fade bd-example-modal-lg-4" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: rgb(39,41,61);">
    <div class="modal-body">
                     <div class="table-responsive"  style="overflow: hidden;">
                  <table class="table tablesorter " id="">
                    <tbody>
						<tr><td align="center"><b>죄송합니다, 제공 동의를 체크해주세요.</b></td></tr>
						<tr><td align="center">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button></td></tr>      
      			</tbody>
      		</table>
      	</div>
      </div>
    </div>
  </div>
</div>


<div id="hiddenButton">
<button class="btn btn-info animation-on-hover" data-toggle="modal" data-target=".bd-example-modal-lg-4" type="button" id="modalBtn">현장 결제</button>
</div>


<!-- 로그인 페이지 이동 스크립트 -->
<script type="text/javascript">
	function join() {
		location.href="ceoServiceTerm.pc";
	}
</script>

<script type="text/javascript">


	//페이지 이동 함수
	function goMain(){
		location.href="parkingceoMain.pc";
	}
	
	function goExchangePage(){
		location.href = "parkingceoExchange.pc";
	}
	
	function insertParkingPage(){
		location.href = "insertParkingPage.pc";
	}
	
	function goOilStatisticsPage(){
		location.href = "goOilStatisticsPage.pc";
	}
	
	function goParkingListStatisticsPage(){
		location.href = "goParkingListStatisticsPage.pc";
	}
	
	function goBestPakerStatisticsPage(){
		location.href = "goBestPakerStatisticsPage.pc";
	}
	
	function goParkingDetailListPage(){
		location.href = "goParkingDetailListPage.pc";
	}
	
	function goPromotionPage(){
		location.href = "goPromotionPage.pc";
	}
	
	function goExchangeMoneyPage(){
		location.href = "goExchangeMoneyPage.pc";
	}
	
	function goNotePage(){
		location.href = "goNotePage.pc";
	}
	
	function insertParkingCeoPage(){
		if($("#inlineCheckbox1").is(":checked")==false){
			$("#modalBtn").click();
			return false;
		}
		if($("#inlineCheckbox2").is(":checked")==false){
			$("#modalBtn").click();
			return false;
		}
		
		
		location.href='ceoJoin.pc';
	}
	
	

</script>

</html>