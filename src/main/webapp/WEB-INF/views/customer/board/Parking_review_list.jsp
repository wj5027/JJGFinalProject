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
             
            <c:choose>
            <c:when test="${ list.size()>0 }">
              		<h3 class="card-title" align="center">[${list[0].pno }]주차장 후기</h3>              		
   				</c:when>
   				<c:when test="${ not empty pName }">
   					<h3 class="card-title" align="center">[${pName}]주차장 후기</h3>
   				</c:when>
            <c:when test="${ b ne null }">
   					<h3 class="card-title" align="center">[${ b.pno }]주차장 후기</h3>   					
   				</c:when>
           	 
              	
   				
   				
   				<c:otherwise>
   					주차장 후기
   				</c:otherwise>
              </c:choose>
               
              <div align="center">
  
   <hr style="border: solid 1px white;">
   
   
   	<table id="listArea">
   		<th width="30%">작성일</th>
   		<th width="40%">제목</th>
   		<th>작성자</th>
   		
   		
   		<c:forEach var="b" items="${ list }">
   		
   		
   		<tbody>
   		<tr>
   			<td>${ b.createDate }</td>
 		
   			<td><input type="hidden" id="num" name="num" value="${b.bno}">${ b.bTitle }[${ b.reCnt }]</td>
			<td>${ b.mno }</td>	
   		</tr>
   		
   		<!-- <hr style="border: solid 1px white;"> -->
   		 
   		   </c:forEach>
   		</tbody>
   	</table>
   		
   
   
   <hr style="border: solid 1px white;">
    </div>
       </div>
       
       <div align="center">
       <button type="button" id="insertReview" class="btn btn-info btn-sm">작성</button>
       </div>
              <div class="card-body">
                <div class="table-responsive">
                
                <!-- 페이징 버튼 영역 -->
		<div id="pagingArea" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
				[이전] &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="blistBack" value="/parkingReview.cu">
					<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					<c:param name="num" value="${ pno }"/>
					<c:param name="pName" value="${ pName }"/>
					
				</c:url>
				<a href="${ blistBack }">[이전]</a> &nbsp; 
			</c:if>
			
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<font color="lightgrey" size="4">[${p}]</font>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="blistCheck" value="parkingReview.cu">
						<c:param name="currentPage" value="${p}"/>
						<c:param name="num" value="${ pno }"/>
						<c:param name="pName" value="${ pName }"/>
						
					</c:url>
					<a href="${ blistCheck }">${p}</a>
				</c:if>
			</c:forEach>
			
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				&nbsp; [다음]
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="blistEnd" value="parkingReview.cu">
					<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					<c:param name="num" value="${ pno }"/>
					<c:param name="pName" value="${ pName }"/>
					
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
             
                 <c:choose>
                 <c:when test="${ list.size()>0 }">
              		<h3 class="card-title" align="center">[${list[0].pno }]주차장 후기</h3>              		
   				</c:when>
                 <c:when test="${ not empty pName }">
   					<h3 class="card-title" align="center">[${pName}]주차장 후기</h3>
   				</c:when>
              	
   				
   				<c:when test="${ b ne null }">
   					<h3 class="card-title" align="center">[${ b.pno }]주차장 후기</h3>   					
   				</c:when>
   				<c:otherwise>
   					주차장 후기
   				</c:otherwise>
              </c:choose>
            
                
              
              
              </div>
              <div class="card-body">
                <div class="table-responsive">
                <form action="insertParkingReview.cu" method="post">
                  <table class="table tablesorter " >
                    <tbody>
                       
                      <tr>
                        <td width="50px">제목</td>
                        <td>
                  			<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
                        </td>
                      </tr>
                      <tr>
                      	<td>주차장 명</td>
                      	<td>
             <c:choose>
                 <c:when test="${ list.size()>0 }">
					<input type="text" class="form-control" name="pName" value="${list[0].pno }" readonly>
                    <input type="hidden" id="pno" name="pno" value="${ pno }">   				</c:when>
                      		<c:when test="${ not empty pName }">
                      		<input type="text" class="form-control" name="pName" value="${ pName }" readonly>                      		
                    <input type="hidden" id="pno" name="pno" value="${ pno }">
   				</c:when>

   				<c:when test="${ b ne null }">
					<input type="text" class="form-control" name="pName" value="${b.pno }" readonly>
                    <input type="hidden" id="pno" name="pno" value="${ pno }">   				</c:when>
   				<c:otherwise>
   					주차장 후기 작성
   				</c:otherwise>
              </c:choose>
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
                      		<button type="button" onclick="return textChk()" class="btn btn-info btn-sm">등록</button>
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
       $("#insertReview").click(function(){
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
			
			var num = $(this).find("#num").val();
			console.log(num);
			var pno = $("#pno").val();
			console.log(pno);
			
			
			location.href="./parkingReviewDetail.cu?num="+num+"&pno="+pno;
		});
	});
 	
   
 

   
   function textChk(){
	   var content = document.getElementById("textContent").value;
		var word = content.split(" ");
	   console.log(content);
	   console.log(word);
	 var title = document.getElementById("title").value;
	var pno =  document.getElementById("pno").value;
	
	 $.ajax({
		url:"insertParkingReview.cu",
		type:"post",
		data:{content:content, title:title, word:word, pno:pno},
		success:function(data){
			//alert(data);
			
			if(data == 'unavailable'){
				alert("부적절한 단어가 입력되어 있습니다. 확인해주세요");
				return false;
			}else{
				//window.location.reload();
				return location.href="parkingReview.cu?num="+pno;
			}
		},
		error:function(status){
			console.log(status);
			
			
		}
	});
   
   }
</script>
</body>
</html>