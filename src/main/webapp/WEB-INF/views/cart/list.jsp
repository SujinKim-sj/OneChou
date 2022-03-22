<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container mt-5">
		<div class="text-center">
			<h1>장바구니 페이지</h1>
		</div>

		<div class="row border border-2 rounded mt-5">
			<div class="col">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<input type="checkbox" value="">
					</div>
					<div class="d-flex">
						<div>
							<img src="../resources/upload/product/이미지파일경로" alt="">
						</div>
						<div class="d-flex flex-column">
							<div>상품명</div>
							<div>상품가격</div>
							<div>로스터리이름</div>
						</div>
					</div>
					<div>
						<div>선택옵션이름(수량)</div>
					</div>
					<div>
						<div>총 가격</div>
					</div>
					<div>
						<div>배송비</div>
					</div>
					<div>
						<button type="button" class="btn btn-secondary">변경하기</button>
					</div>
				</div>
			</div>
		</div>


	</div>
</body>
</html>