<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				
				<td>제목</td>
			</tr>
			
			<tr height="200">
				
				<td valign="top" style="border: 1px solid white">내용</td>
			</tr>
			
			<tr height="40">
				<th>첨부파일</th>
				<td>
				</td>
			</tr>
			<tr>
			<td><td>
			</tr>
			
			<tr><!-- BOARD BUTTONS -->
				<td colspan="5" align="center">
					
					<button class="btn btn-info btn-sm">수정</button>&nbsp;
					<button class="btn btn-info btn-sm">삭제</button>&nbsp;					
					<button class="btn btn-info btn-sm">목록</button>&nbsp;					
				
				</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
        
              </div>
            </div>
          </div>
        </div>
      </div>
	
</body>
</html>