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
                <h3 class="card-title" align="center">내 후기</h3>
                <hr style="border: solid 1px white;">
              		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<!-- BOARD TITLE -->
			
			
			<tr height="20"><!-- BOARD CONTENTS -->
				<td width="70px">작성자</td>
				<td>${ b.mno }</td>
				
			</tr>
			<tr>
				<td>주차장 명</td>
				<td>${ b.pno }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="hidden" id="num" name="num" value="${ b.bno }">${ b.bTitle }</td>
			</tr>
			<tr height="200">
				<td valign="top" >내용</td>
				<td valign="top" >${ b.bContext }</td>
			</tr>
			
			<tr>
			<td><td>
			</tr>
			</table>
			
			<div class="repleArea">
		<div class="replySelectArea">
		<table id="replySelectTable" width="100%" border="0" cellpadding="0" cellspacing="0">
			<c:forEach var="r" items="${ reply }">
			
			<tbody>
			<tr>
				<td width="60px">댓글&nbsp;</td>
				<td   colspan="2">${ r.context }　　　　　　　　　</td>
				<td align="center">${ r.memberNo }</td>
			</tr>
			</c:forEach>
			</table>
			</div>
			
			<div class="repleArea">
		<div class="replySelectArea">
		<table id="replySelectTable" width="100%" border="0" cellpadding="0" cellspacing="0">
			<c:forEach var="r" items="${ reply }">
			
			<tbody>
			<tr>
				<td width="60px">댓글&nbsp;</td>
				<td   colspan="2">${ r.context }　　　　　　　　　</td>
				<td align="center">${ r.memberNo }</td>
			</tr>
			</c:forEach>
			</table>
			</div>
			
			<div>
			<table>
			<tbody>
			<tr>
				<td width="60px">댓글작성	</td>
				<td colspan="2" width="500px">
					<input type="text" id="replyContent" class="form-control">
				</td>
				<td width="30px">
					<button class="btn btn-info btn-sm" onclick="return insertReply()" id="addReply">댓글등록</button>
					
				</td>
			</tr>
			</tbody>
			
			</table>
			</div>
		<br>
		
        <div align="center">	
					<button id="editBtn" class="btn btn-info btn-sm">수정</button>&nbsp;
					<button id="deleteBtn" class="btn btn-info btn-sm">삭제</button>&nbsp;					
					<button id="goToList" class="btn btn-info btn-sm">목록</button>&nbsp;					
				</div>
		<br>
              </div>
            </div>
          </div>
        </div>
      </div>
<script>
	$(function(){
		$("#editBtn").click(function(){
			var num = $("input[name='num']").val();
			console.log(num);
			location.href="./updateReview.cu?num="+num;
		});
	});
	
	  $(function(){
		$("#deleteBtn").click(function(){
			alert("해당 글이 삭제되었습니다.");
		  	 var num = $("input[name='num']").val();
			console.log(num);   
			location.href="./deleteReview.cu?num="+num;
		});
	});  
	
	$(function(){
		$("#goToList").click(function(){
			location.href="./review.cu";
		});
	});
	
function insertReply(){
		
		var writer = ${ loginUser.member_no }
		var content = $("#replyContent").val();
		var bno =${ b.bno };
		
		console.log(writer);
		console.log(content); 
		console.log(bno);
		
		$.ajax({
			url:"insertReply.cu",
			data:{ writer:writer, content:content, bno:bno},
			type:"post",
			success:function(data){
				console.log(data);
				
				var $replySelectTable = $("#replySelectTable");
				$replySelectTable.html('');
				
				
					
					$("#replyContent").val("");
					window.location.reload();
				
				 
				
			},
			error:function(){
				console.log("실패");
			}
		});
		
	}
</script>	
</body>
</html>