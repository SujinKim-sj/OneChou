<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/payment/list.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<div class="text-center mt-5 mb-5">
			<h3>결제내역 리스트 페이지</h3>
		</div>
		<c:forEach items="${paymentDTOs}" var="paymentDTO">
		<div class="border border-2 rounded">
			<div class="d-flex justify-content-between m-3">
				<div>
					<div>주문번호 : ${paymentDTO.num}</div>
					<div>주문일자 : ${paymentDTO.orderDate}</div>
				</div>
				<div><a href="./detail?num=${paymentDTO.num}" class="">상세정보보기</a></div>
			</div>
			
			<c:forEach items="${paymentDTO.paidProductDTOs}" var="paidProductDTO">
			<div class="row row-cols-3 border border-2 rounded m-3">
				<div class="col-2">
					<img class="productImg" src="../resources/upload/product/${paidProductDTO.productDTO.productFileDTO.fileName}">
				</div>
				<div class="col-7 border-end">
					<div class="d-flex flex-column">
						<div class="fs-5 fw-bold mt-2 mb-4">
							<c:choose>
								<c:when test="${paidProductDTO.shipmentStatus == 0}">
									발송준비중
								</c:when>
								<c:otherwise>
									판매자발송완료
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<span class="fw-bold">${paidProductDTO.productDTO.roasteryName} ${paidProductDTO.productDTO.name}</span>, 
							<span class="text-secondary">${paidProductDTO.productOptionDTO.optionName}(+${paidProductDTO.productOptionDTO.addPrice}원)</span>
						</div>
						<div>상품금액 : ${paidProductDTO.productDTO.price}원, ${paidProductDTO.amount}개 구매, 총 ${paidProductDTO.perPrice}원</div>
					</div>
				</div>
				<div class="col-3 d-flex align-items-center justify-content-center">
					<div class="d-flex flex-column justify-content-center align-items-center">
						<c:choose>
							<c:when test="${paidProductDTO.shipmentStatus == 0}">
								<div class="my-2">
									<a class="btn btn-secondary" href="../product/detail?num=${paidProductDTO.productNum}">상품정보보기</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="my-2">
									<a class="btn btn-secondary" href="https://tracker.delivery/#/${paidProductDTO.deliveryCompany}/${paidProductDTO.shipmentNum}" target="_blank">배송조회하기</a>
								</div>
							</c:otherwise>
						</c:choose>						
						<div class="my-2">
							<a class="btn btn-secondary" href="../review/add?productNum=${paidProductDTO.productNum}">리뷰작성하기</a>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</c:forEach>
		
		
	</div>

</body>
</html>