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
	<h3>
	회원유형
	</h3>
	<form action="./join" method="get" id="frm">
	로스터리 회원
	<input type="radio" name="kind" value="1">
	일반 회원
	<input type="radio" name="kind" value="2">
	<button type="button" id="btn">선택</button>
	</form>

	<script src="../resources/js/member/kindSelect.js"></script>
</body>
</html>