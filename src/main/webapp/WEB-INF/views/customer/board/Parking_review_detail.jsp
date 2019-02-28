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
                <h3 class="card-title" align="center">[${b.pno }]주차장 후기</h3>
                <hr style="border: solid 1px white;">
              		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<!-- BOARD TITLE -->
			
			
			<tr height="20"><!-- BOARD CONTENTS -->
				<td width="70px">작성자</td>
				<td>${ b.mno }</td>
				
			</tr>
			<tr>
				<td>주차장 명</td>
				<td><input type="hidden" id="pno" name="pno" value="${pno}">
				<input type="hidden" id="pName" name="pName" value="${b.pno}">
				${ b.pno }</td>
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
			<table>
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
		<br>
		<br>
        <div align="center">	
					<button id="editBtn" class="btn btn-info btn-sm">수정</button>&nbsp;
					<button id="deleteBtn" class="btn btn-info btn-sm">삭제</button>&nbsp;					
					<button id="goToList" class="btn btn-info btn-sm">목록</button>&nbsp;					
				</div>
		
              </div>
            </div>
          </div>
        </div>
      </div>
<script>
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


	$(function(){
		$("#editBtn").click(function(){
			var num = $("input[name='num']").val();
			console.log(num);
			var pno = $("#pno").val();
			
			location.href="./updateParkingReview.cu?num="+num+"&pno="+pno;
		});
	});
	
	  $(function(){
		$("#deleteBtn").click(function(){
		  	 var num = $("input[name='num']").val();
		  	 var pno = $("#pno").val();
		  	 var pName = $("#pName").val();
			console.log(num);   
			console.log(pName);
			
			alert("해당 글이 삭제되었습니다.");
			location.href="./deleteParkingReview.cu?num="+num+"&pno="+pno+"&pName="+pName;
		});
	});  
	
	$(function(){
		$("#goToList").click(function(){
			var pno = $("#pno").val();
			var pName = $("#pName").val();
			
			location.href="./parkingReview.cu?num="+pno+"&pName="+pName;
		});
	});

	//댓글 작성
	/*$(function(){
		$("#addReply").click(function(){
			
			
			var writer =${ loginUser };
			var bno =${ b.bno };
			var content = $("#replyContent").val(); 
			
		 	console.log(writer); 
			console.log(bno);
			console.log(content);
			
			 $.ajax({
				url:"insertReply.cu",
				data:{ writer:writer, content:content, bno:bno},
				type:"post",
				success:function(data){
					console.log(data);
					
					var $replySelectTable = $("#replySelectTable");
					$replySelectTable.html('');
					
					for(var key in data){
						var $tr = $("<tr>");
						var $writerTd = $("<td>").text(data[key].writerId).css("width","100px");
						var $contentTd = $("<td>").text(data[key].bContent).css("width","400px");
						var $dateTd = $("<td>").text(data[key].bDate).css("width", "200px");
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$replySelectTable.append($tr);
						
						$("#replyContent").val("");
						//window.location.reload();
					}
					 
					
				},
				error:function(){
					console.log("실패");
				}
			});
		});
	});*/
</script>	
</body>
</html>