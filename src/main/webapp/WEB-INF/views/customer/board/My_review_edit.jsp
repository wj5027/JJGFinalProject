<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>




<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<style>
#textContent{
	height:200px;
}
</style>
</head>

<body class="">
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    <div class="main-panel">
      <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>
      
      <div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h3 class="card-title" align="center">내 후기 수정</h3>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                <form action="updateReview2.cu" method="post">
                  <table class="table tablesorter " id="">
                    <tbody>
                    <tr>
                    	<td>작성자</td>
                    	<td>${ b.mno }</td>
                    </tr>
                      <tr>
                        <td width="50px">주차장 명</td>
                        <td>${ b.pno }</td>
                      </tr>  
                      <tr>
                        <td width="50px">제목</td>
                        <td>
                  			<input type="hidden" name="num" id="num" value="${ b.bno }"><input type="text" class="form-control" name="title" value="${ b.bTitle }">
                        </td>
                      </tr>
                      <tr>
                         <td>내용</td>
                        <td>
                  			<input type="textarea" id="textContent" class="form-control" name="content" value="${ b.bContext }">
                        </td> 
                      </tr>  
          			  
                      <tr>
                      	<td></td>
                      	<td style="padding-left: 30%">
                      		<button type="submit" id="chk"onclick="return textChk()" class="btn btn-info btn-sm">등록</button>
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
      </div>
        
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
      </footer>
    </div>
  </div>
 
</body>
<script>

function textChk(){
	   var word = document.getElementById("textContent").value;
    console.log(word);
    // 금칙어 적용
    var swear_words_arr = new Array("시발", "존나");

    orgword = word.toLowerCase();
    i = 0;

    while (i <= swear_words_arr.length - 1) {

        if (orgword.indexOf(swear_words_arr[i]) > -1) {
            alert("'"+swear_words_arr[i] + "' 은(는) 금지어입니다. 등록 할 수 없습니다.");
            return false;
        }
        i++;
    }
    return true;
	   
	   
	   
}
</script>
</html>