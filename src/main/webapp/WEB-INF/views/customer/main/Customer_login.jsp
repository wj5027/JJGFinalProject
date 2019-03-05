<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>


<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
</head>

<body class="">
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    <div class="main-panel">
     <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">로그인</h4>
              </div>
              <div class="card-body">
                <form action="allLogin.cu" method="post">
                  	아이디 : <input type="text" class="form-control" name="member_id" id="member_id"><br>
                  	비밀번호 : <input type="password" class="form-control" name="member_pwd" id="member_pwd"><br>
                    
                    <div align="center" style="width: 100%">
                    <button class="btn btn-info btn-sm"  type="button" onclick="join();" style="width: 120px;">회원가입</button>
                    <button class="btn btn-info btn-sm" type="submit"  style="width: 120px;">로그인</button>
                    </div>
                    <div align="center" style="width: 100%">
                    <br>
                    <button class="btn btn-info btn-sm" type="button" onclick="parkingceoLogin();" style="width: 120px;">제휴 페이지</button>
                    <button class="btn btn-info btn-sm" type="button" onclick="findIdPwd();" style="width: 120px;">ID/PW 찾기</button>
                    <br><br>
                                   
                   <!--  <a href="http://developers.kakao.com/logout"></a>-->                    
                    
                    <br>
                    <div id="naver_id_login"></div> 
					 
                    </div>
                 </form>
                    <br>
                   <form id="kakao" action="kakao.cu" method="post" align="center">
                   	<input type="hidden" id="kakao_id" name="kakao_id" value="">
                   	<input type="hidden" id="member_name" name="member_name" value="">
                   	<a id="kakao-login-btn"></a>
                   </form>
                    <br><br><br>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
</body>
<script type="text/javascript">

	function parkingceo(){
		location.href="parkingceoMain.pc";
	}
	
	function parkingceoLogin(){
		location.href="parkingceoLogin.pc";
	}

	function admin(){
		location.href="statisticsList.ad";
	}

	function join() {
		location.href="customer_join.cu";
	}
	
	function customer(){
		location.href="customer.cu";
	}
	
	function parkingceoTest(){
		location.href = "test.pc";
	}
	
	function findIdPwd(){
		location.href="findIdPwd.cu";
	}

	//카카오톡 로그인
	 //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('def3fdb5b7cc20f99e216e76eda8ab6b');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
  //]]>
	
    //네이버 로그인
    
    	var naver_id_login = new naver_id_login("hEi80LKwFmVECmA2A2z0", "https://ec2-54-180-197-57.ap-northeast-2.compute.amazonaws.com/jjg/naver.cu");
   	 	var state = naver_id_login.getUniqState();
   	 	naver_id_login.setButton("green", 3,48);
    	naver_id_login.setDomain("https://ec2-54-180-197-57.ap-northeast-2.compute.amazonaws.com/jjg/customer.cu");
   	  	naver_id_login.setState(state);
   	  	//naver_id_login.setPopup();
   	  	naver_id_login.init_naver_id_login();

   	  	
</script>

</html>