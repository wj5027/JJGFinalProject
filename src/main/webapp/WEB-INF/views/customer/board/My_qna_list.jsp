<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/ext-core/3.1.0/ext-core.js"></script>
<title>Insert title here</title>
<style>
	.insertContent{
		display:none;
	}
</style>
</head>
<body class="" >
  <div class="wrapper">
    <jsp:include page="/WEB-INF/views/customer/common/sidebar_customer.jsp"></jsp:include>
    
        <div class="main-panel" scroll="no">
      <jsp:include page="/WEB-INF/views/customer/common/nav_customer.jsp"></jsp:include>


<div class="content">
        <div class="row">
		  <div class="col-md-12" height="500px">
            <div class="card ">
              <div class="card-header">
                <h3 class="card-title" align="center">내 문의</h3>
                <hr style="border: solid 1px white;">
              <div align="center">
  	
	  	<table id="listArea">
	  		<th width="100px">분류</th>
	  		<th width="130px">작성일</th>
	  		<%-- ${list[0].mno } --%>
	  		<th>제목 </th>
	  		<c:forEach var="b" items="${ list }">
  	<c:if test="${ b.mno eq loginUser.member_no }">
  
	  		<tbody>
	  		<tr>
	  		<td>${ b.bType }</td>
	  		<td>${ b.createDate }</td>
	  		<td><input type="hidden" id="bno" name="bno" value="${b.bno}">${ b.bTitle }[${ b.reCnt }]</td>
	  	
	  		</tr>
	  		</c:if>
  	</c:forEach>
	  		</tbody>
	  	</table>
	  	 
    </div>
       </div>
       
       <div align="center">
       <button id="insertQna" class="btn btn-info btn-sm">작성</button>
       </div>
   
       
              <div class="card-body" >
                <div class="table-responsive">
                <!-- 페이징 버튼 영역 -->
		<div id="pagingArea" align="center" >
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="blistBack" value="/qna.cu">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
				</c:url>
				 <a href="${ blistBack }">[이전]</a> &nbsp; 
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="lightgrey" size="4">[${p}]</font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="qna.cu">
						<c:param name="currentPage" value="${p}"/>
					</c:url>
					<a href="${ blistCheck }">${p}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="qna.cu">
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
                <h3 class="card-title" align="center">내 문의 작성</h3>
                <h5 align="center">※관리자에게 문의만 가능합니다. </h5>
                <h5 align="center">주차장(사업자)문의는 해당 주차장문의 페이지에서 작성해주세요.</h5>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                <form action="insertQna.cu" method="post">
                  <table class="table tablesorter " id="">
                    <tbody>
                    <tr>
                    	<td>작성자</td>
                    	<td>${ loginUser.member_name }</td>
                    </tr>
                      <tr>
                        <td width="50px">제목</td>
                        <td>
                  			<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요">
                        </td>
                      </tr>  
                      <tr>
                         <td>내용</td>
                        <td>
                  			<input type="textarea" id="content" class="form-control" name="content" placeholder="내용을 입력해주세요">
                        </td> 
                      </tr>  
          			 
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
       $("#insertQna").click(function(){
       		$(".content").hide();
       		$(".insertContent").show();
       	});
   });
   
   $(function(){
		  $("#listArea td").mouseenter(function(){
			  $(this).parent().css({"color":"black", "cursor":"pointer"});

		  }).mouseout(function(){
			  $(this).parent().css({"color":"rgb(180,181,188)", "cursor":"pointer"});

		  }).click(function(){
			  var num = $(this).find("#bno").val();
			  console.log(num);
			location.href="./qnaDetail.cu?num="+num;  
		  });
	   });

</script>
       
</body>
</html>