<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
</head>
<body>
	<a href="/shop/member/login">Login</a>
	
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
</body>
</html>
