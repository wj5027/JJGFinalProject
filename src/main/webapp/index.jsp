<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"></c:set>
		<jsp:forward page="WEB-INF/views/customer/main/Main.jsp"></jsp:forward>
</html>