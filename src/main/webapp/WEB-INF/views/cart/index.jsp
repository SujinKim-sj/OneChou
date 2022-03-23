<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/cart/list.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container mt-5">
		<div class="text-center">
			<h1>장바구니 페이지</h1>
		</div>
		<div id="listResult">
		</div>

		<div class="mt-5 mb-5">
			<button class="btn btn-secondary" id="deleteBtn" type="button">삭제하기</button>
		</div>

	</div>

	<script src="../resources/js/cart/index.js"></script>
</body>
</html>