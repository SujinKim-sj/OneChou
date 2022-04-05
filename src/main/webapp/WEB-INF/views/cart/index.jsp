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
	<div class="container my-5">
		<div class="text-center">
			<h1>장바구니 페이지</h1>
		</div>
		<div id="listResult">
		</div>

		<div class="d-flex justify-content-between mt-5 mb-5">
			<button class="btn btn-secondary" id="deleteBtn" type="button">삭제하기</button>
			<form id="paymentForm" action="../payment/add" method="post">
			</form>
			<button class="btn btn-secondary" id="paymentBtn" type="button">결제하기</button>
		</div>

	</div>

	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../resources/js/cart/index.js"></script>

</body>
</html>