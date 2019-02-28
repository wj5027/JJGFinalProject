<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>



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
              		<h3 class="card-title" align="center">[${list[0].pno }]주차장 문의</h3>              		
   				</c:when>
   				<c:when test="${ not empty pName }">
   					<h3 class="card-title" align="center">[${pName}]주차장 문의</h3>
   				</c:when>
   				<c:when test="${ b ne null }">
   					<h3 class="card-title" align="center">[${ b.pno }]주차장 문의</h3>   					
   				</c:when>
   				<c:otherwise>
   					주차장 문의
   				</c:otherwise>
              </c:choose>
                <hr style="border: solid 1px white;">
              		
              		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<!-- BOARD TITLE -->
			
			<tr height="20" >
				<td width="50px">작성자</td>
				<td>${ b.mno }</td>
			</tr>
			<tr ><!-- BOARD CONTENTS -->
				
				<td>제목</td>
				<td>
				<input type="hidden" name="bno" value="${ b.bno }">
				<input type="hidden" id="pno" name="pno" value="${pno}">
				<input type="hidden" id="pName" name="pName" value="${b.pno}">
				
				${ b.bTitle }
				
				</td>
			</tr>
			
			<tr height="200">
				<td  valign="top">내용</td>
				<td valign="top" >${ b.bContext }</td>
			</tr>
			
			
			</table>
			
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<c:forEach var="r" items="${ reply }">
			<tr>
				<td width="60px">댓글&nbsp;</td>
				<td   colspan="2">　${r.context }　　　　　　　</td>
				<td align="center">사업자</td> 
			</tr>
			</c:forEach>
			</table>
			
			
				<div align="center">	
					<button id="editBtn" class="btn btn-info btn-sm">수정</button>&nbsp;
					<button id="deleteBtn" class="btn btn-info btn-sm">삭제</button>&nbsp;					
					<button id="goToList" class="btn btn-info btn-sm">목록</button>&nbsp;					
				</div>
		
		<br>
		<br>
		<br>
        
              </div>
            </div>
          </div>
        </div>
      </div>
<script>
	$(function(){
		$("#editBtn").click(function(){
			var num = $("input[name='bno']").val();
			console.log(num);
			
			var pno = $("#pno").val();
			
			location.href="./updateParkingQna.cu?num="+num+"&pno="+pno;
		});
	});
	
	  $(function(){
		$("#deleteBtn").click(function(){
		  	var bno = $("input[name='bno']").val();
				console.log(bno);   
			var pno = $("#pno").val();
		  	var pName = $("#pName").val();
			
		  	alert("해당 글이 삭제되었습니다.");
		  	
		  	location.href="./deleteParkingQna.cu?bno="+bno+"&pno="+pno+"&pName="+pName;
		});
	});  
	
	$(function(){
		$("#goToList").click(function(){
			var pno = $("#pno").val();
			var pName = $("#pName").val();
			
			location.href="./parkingQna.cu?num="+pno+"&pName="+pName;
		});
	});
</script>	
</body>
</html>