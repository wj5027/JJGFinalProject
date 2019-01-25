<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<h1>메인 안녕!</h1>
	
	
	<button onclick="parkingceo();">지주갑 사업자 관리 페이지</button>

	<button onclick="admin();">지주갑 관리자 페이지</button>

	<button onclick="customer();">지주갑 사용자 페이지</button>

</body>

<script type="text/javascript">

	function parkingceo(){
		location.href="parkingceoMain.pc";
		
	}


	function admin(){
		location.href="searchCEOList.ad";
		
	}


	
	function customer(){
		location.href="customer.cu";
	}

</script>
</html>