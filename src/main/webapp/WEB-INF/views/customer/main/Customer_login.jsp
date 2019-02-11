<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<html>




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
                    <button class="btn btn-info btn-sm" type="button" onclick="" style="width: 120px;">비밀번호 찾기</button>
                    <br><br>                  
                   <!--  <a href="http://developers.kakao.com/logout"></a>-->                    
                    <a id="kakao-login-btn"></a>
                    <br>
					<button class="btn btn-info btn-sm" type="button" onclick="" style="width: 120px;">네이버 로그인	</button>
                    </div>
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
	
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('7b1dba10e7202c6538408b93f85572ab');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function(res) {
            //console.log(JSON.stringify(res.kaccount_email));
            console.log(JSON.stringify(res.id));
            //console.log(JSON.stringify(res.properties.profile_image));
            console.log(JSON.stringify(res.properties.nickname));
         	location.href="kakao.cu?nickname="+res.properties.nickname;
            //alert(JSON.stringify(authObj));
          },
          fail: function(error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
        alert(JSON.stringify(err));
      }
    });
	
  /* //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('7b1dba10e7202c6538408b93f85572ab');
    function loginWithKakao() {
      // 로그인 창을 띄웁니다.
      Kakao.Auth.login({
        success: function(authObj) {
          alert(JSON.stringify(authObj));
        },
        fail: function(err) {
          alert(JSON.stringify(err));
        }
      });
    };
  //]]>  */

</script>

</html>