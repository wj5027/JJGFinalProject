<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/ext-core/3.1.0/ext-core.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.insertContent{
		display:none;
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
                <h3 class="card-title" align="center">공지사항</h3>
                <!-- <hr style="border: solid 1px white;"> -->
              <div align="center">
<!--    <a href="./customerNoticeDetail.cu">쿠폰행사안내</a><h5>2019/01/25</h5>
 -->   
   <hr style="border: solid 1px white;">
   
   <c:forEach var="b" items="${ list }">
   	<table id="listArea">
   		
   		<tr>
   			<td><input type="hidden" id="bno" name="bno" value="${b.bno}">${ b.bTitle }</td>
			 	
   		</tr>
   		<tr>
   			<td>${ b.createDate }</td>
   			
   		</tr>
   		<hr style="border: solid 1px white;">
   	</table>
   		<%-- <a href="./customerNoticeDetail.cu" >${ b.bTitle }<intput type="hidden" name="bno" value="${ b.bno }"></a><h5>${ b.createDate }</h5> --%>
   		
   </c:forEach>
   
   
   <hr style="border: solid 1px white;">
    </div>
       </div>
       
       <div align="center">
       <button id="insertNotice">작성</button>
       </div>
              <div class="card-body">
                <div class="table-responsive">
                <!-- 페이징 버튼 영역 -->
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="blistBack" value="/customerNotice.cu">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				 <a href="${ blistBack }">[이전]</a> &nbsp; 
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="lightgrey" size="4">[${p}]</font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="customerNotice.cu">
						<c:param name="currentPage" value="${p}"/>
					</c:url>
					<a href="${ blistCheck }">${p}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="customerNotice.cu">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
				</c:url>
				
				 <a href="${ blistEnd }">&nbsp;[다음]</a>  
			</c:if>
		</div>
 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
	
	<br>
	<br>
	<br>
	<div class="insertContent">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h3 class="card-title" align="center">공지사항 작성</h3>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                <form action="insertNotice.cu" method="post">
                  <table class="table tablesorter " id="">
                    <tbody>
                       
                      <tr>
                        <td width="50px">제목</td>
                        <td>
                  			<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요">
                        </td>
                      </tr>
                      <tr>
                         <td>내용</td>
                        <td>
                  			<input type="textarea" id="textContent" class="form-control" name="content" placeholder="내용을 입력해주세요">
                        </td> 
                      </tr>  
          			   
                      <tr>
                      	<td></td>
                      	<td style="padding-left: 30%">
                      		<button class="btn btn-info btn-sm">등록</button>
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

<script>
   $(function(){
       $("#insertNotice").click(function(){
       		$(".content").hide();
       		$(".insertContent").show();
       	});
   });
   
   $(function(){
	  $("#listArea td").click(function(){
		  var num = $(this).find("#bno").val();
		  console.log(num);
		location.href="./customerNoticeDetail.cu?num="+num;  
	  });
   });
</script>
</body>
</html>