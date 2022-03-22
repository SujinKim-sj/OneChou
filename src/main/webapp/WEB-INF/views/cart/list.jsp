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

		<c:forEach items="${cartDTOs}" var="cartDTO">
			<div class="row border border-2 rounded mt-5">
				<div class="col">
					<div class="d-flex justify-content-between align-items-center">
						<div class="check text-center">
							<input type="checkbox" value="">
						</div>
						<div class="productInfo d-flex align-items-center justify-content-center">
							<div>
								<img class="productImg" src="../resources/upload/product/${cartDTO.productDTO.productFileDTO.fileName}">
							</div>
							<div class="productInfoBasic d-flex flex-column align-items-center">
								<div>${cartDTO.productDTO.roasteryName}</div>
								<div>${cartDTO.productDTO.name}</div>
								<div>${cartDTO.productDTO.price}원</div>
							</div>
						</div>
						<div class="option text-center">
							<div>선택옵션이름(수량)</div>
							<div>${cartDTO.productOptionDTO.optionName}(${cartDTO.amount})</div>
						</div>
						<div class="optionChange text-center">
							<div>옵션이름들</div>
							<div>수량</div>
							<div><button type="button" class="btn btn-secondary mt-2">변경하기</button></div>
						</div>
						<div class="delivery text-center">
							<div>배송비</div>
							<div>${cartDTO.productDTO.deliveryFee}</div>
						</div>
						<div class="price text-center">
							<div>총 가격</div>
							<div>${cartDTO.perPrice}</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>