<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" href="../resources/css/payment/add.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container mt-5">
		<div class="text-center">
			<h1>결제정보 입력 페이지</h1>
		</div>
		<div class="row text-center mt-5">
			<div class="border-start border-top border-end border-2 rounded pt-3 pb-3">
				<h3>결제 상품 정보</h3>
			</div>
			<table class="table table-bordered text-center align-middle">
				<thead>
					<tr>
					  <th scope="col">상품사진</th>
					  <th scope="col">상품정보</th>
					  <th scope="col">선택옵션</th>
					  <th scope="col">선택수량</th>
					  <th scope="col">배송비</th>
					  <th scope="col">총가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cartDTOs}" var="cartDTO">
						<tr>
							<td><img class="productImg" src="../resources/upload/product/${cartDTO.productDTO.productFileDTO.fileName}" alt=""></td>
							<td>
								<div class="d-flex flex-column">
									<div class="fw-bold">${cartDTO.productDTO.roasteryName}</div>
									<div class="fw-bold">${cartDTO.productDTO.name}</div>
									<div>${cartDTO.productDTO.price}</div>
								</div>
							</td>
							<td>${cartDTO.productOptionDTO.optionName}(+${cartDTO.productOptionDTO.addPrice})</td>
							<td>${cartDTO.amount}개</td>
							<c:choose>
								<c:when test="${cartDTO.productDTO.freeDelivery == 0 || cartDTO.perPrice < cartDTO.productDTO.freeDelivery}">
									<td>${cartDTO.productDTO.deliveryFee}원</td>
								</c:when>
								<c:otherwise>
									<td>무료배송</td>
								</c:otherwise>
							</c:choose>
							<td>${cartDTO.perPrice}원</td>
						</tr>		
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>