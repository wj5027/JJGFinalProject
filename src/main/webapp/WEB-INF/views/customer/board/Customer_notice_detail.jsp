<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/views/common/bootInfo.jsp"></jsp:include>

<style>

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
                <h3 class="card-title" align="center">공지사항 상세보기</h3>
                <hr style="border: solid 1px white;">
              		<table class="firstTable" width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
			<!-- BOARD TITLE -->
			
			
			<tr height="20"><!-- BOARD CONTENTS -->
				
				<td >제목</td>
				<td><input type="hidden" name="bno" value="${ b.bno }">${ b.bTitle }</td>
			</tr>
			
			<tr height="200" >
				
				<td valign="top">내용</td>
				<td valign="top" >${ b.bContext }</td>
			</tr>
			</table>
		
			
			<!-- BOARD BUTTONS -->
			<c:if test="${ loginUser.member_type eq 'A' }">
					<div align="center">	
					<button id="editBtn" class="btn btn-info btn-sm">수정</button>&nbsp;
					<button id="deleteBtn" class="btn btn-info btn-sm">삭제</button>&nbsp;					
					<button id="goToList" class="btn btn-info btn-sm">목록</button>&nbsp;					
		
				</div>
			</c:if>
			<c:if test="${ loginUser.member_type eq 'U' }">
				<div align="center">	
				<button id="goToList" class="btn btn-info btn-sm">목록</button>&nbsp;					

				</div>
			</c:if>
			
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
      			location.href="./updateNotice.cu?num="+num;
      		});
      	});
      
      	$(function(){
      		$("#deleteBtn").click(function(){
      			var num = $("input[name='bno']").val();
      			console.log(num);
      			location.href="./deleteNotice.cu?num="+num;
      		});
      	});
      	
      	$(function(){
      		$("#goToList").click(function(){
      			location.href="./customerNotice.cu";
      		});
      	});
      	
      </script>
	
</body>
</html>