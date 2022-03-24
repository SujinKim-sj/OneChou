<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<style type="text/css">
		label {
			margin: 10px;
		}
	</style>

<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<h1>My Page</h1>
	<h1>ID: <input type="Text" readonly="readonly" value="${dto.id}"></h1>
	<h1>이름: <input type="Text" readonly="readonly" value="${dto.name}"></h1>
	<h1>별명: <input type="Text" readonly="readonly" value="${dto.nickname}"></h1>
	<h1>이메일 주소: <input type="Text" readonly="readonly" value="${dto.email}"></h1>
	<h1>전화번호: <input type="Text" readonly="readonly" value="${dto.phone}"></h1>
		<c:if test="${member.kind eq 0}">
		회원 유형 : 관리자입니다. 
	</c:if>
	<c:if test="${member.kind eq 1}">
		회원 유형 : 로스터리 회원입니다. 
		<img src="../resources/upload/roastery/">
	</c:if>
	<c:if test="${member.kind eq 2}">
	<a href="/shop/product/recomend">추천원두</a>
		회원 유형 : 일반 회원입니다. 
	</c:if>
</body>
</html>