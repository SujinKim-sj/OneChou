<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home</title>
	<c:import url="./template/css_import.jsp"></c:import>
</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<h1>Index Page</h1>
	
	<c:if test="${empty member}">
	<a href="/shop/member/login">Login</a>
	</c:if>
	<c:if test="${not empty member}">
	<a href="./member/logout">Log out</a>
	</c:if>
	<h3>닉네임 ${member.nickname}님 환영합니다.</h3>
	
	<c:if test="${member.kind eq 0}">
		회원 유형 : 관리자입니다. 
	</c:if>
	<c:if test="${member.kind eq 1}">
		회원 유형 : 로스터리 회원입니다. 
	</c:if>
	<c:if test="${member.kind eq 2}">
	<a href="/shop/product/recomend">추천원두</a>
		회원 유형 : 일반 회원입니다. 
	</c:if>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
