<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/payment/list.css">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
		<div class="border border-2 rounded my-5">
			<div class="border-bottom border-2 text-center p-3">
				<h3>결제 정보</h3>
			</div>
			<c:forEach items="${paymentDTO.paidProductDTOs}" var="paidProductDTO">
			<div class="border border-2 rounded m-3">
			<div class="text-center fw-bold py-3 border-bottom border-2">상품 정보</div>
			<div class="row row-cols-2">
				<div class="col-4 text-center">
					<img class="productImg" src="../resources/upload/product/${paidProductDTO.productDTO.productFileDTO.fileName}">
				</div>
				<div class="col-8 d-flex justify-content-center align-items-center">
					<div>
						<div>
							<span class="fw-bold">${paidProductDTO.productDTO.roasteryName} ${paidProductDTO.productDTO.name}</span>, 
							<span class="text-secondary">${paidProductDTO.productOptionDTO.optionName}(+${paidProductDTO.productOptionDTO.addPrice}원)</span>
						</div>
						<div>주문갯수 : ${paidProductDTO.amount}개</div>
					</div>
				</div>
			</div>
			</div>
			</c:forEach>
			<div class="row row-cols-2 border border-2 rounded m-3">
				<div class="col-5 d-flex flex-column justify-content-center mx-5 my-3">
					<div class="fw-bold">주문정보</div>
					<div>주문번호 : ${paymentDTO.num}</div>
					<div>주문일자 : ${paymentDTO.orderDate}</div>
				</div>
				<div class="col-4 d-flex flex-column justify-content-center mx-5 my-3">
					<div class="fw-bold">배송정보</div>
					<div>받는사람 : ${paymentDTO.deliveryDTO.recipient}</div>
					<div>배송주소 : ${paymentDTO.deliveryDTO.address}</div>
					<div>연락처 : ${paymentDTO.deliveryDTO.recipientPhone}</div>
					<div>배송메모 : ${paymentDTO.deliveryDTO.memo}</div>
				</div>
			</div>
		</div>
		<div class="border border-2 rounded my-5">
			<div class="border-bottom border-2 text-center p-3">
				<h3>발송 정보 등록</h3>
			</div>
			<div class="d-flex justify-content-center my-3">
				<div class="my-5" style="width: 50%">
					<form action="./shipmentAddResult" id="regForm" method="post">
						<input type="hidden" name="num" value="${paidProductDTO.num}">
						<div class="text-center fw-bold mb-3"><h5>배송사 선택</h5></div>
						<select class="form-select" id="deliveryCompany" name="deliveryCompany" id="deliveryCompany">
						  <option value="no" selected>배송사를 선택해주세요</option>
						  <option value="kr.cjlogistics">CJ대한통운</option>
						  <option value="kr.epost">우체국 택배</option>
						  <option value="kr.lotte">롯데택배</option>
						  <option value="kr.hanjin">한진택배</option>
						  <option value="kr.logen">로젠택배</option>
						  <option value="kr.cupost">CU 편의점택배</option>
						  <option value="kr.cvsnet">GS Postbox 택배</option>
						  <option value="kr.daesin">대신택배</option>
						  <option value="kr.kdexp">경동택배</option>
						  <option value="kr.kunyoung">건영택배</option>
						  <option value="kr.hdexp">합동택배</option>
						  <option value="kr.hanips">한의사랑택배</option>
						  <option value="kr.chunilps">천일택배</option>
						</select>
						<div class="fw-bold text-center my-3"><h5>운송장 번호 입력</h5></div>
							<input type="number" class="form-control" placeholder="숫자만 입력해주세요" name="shipmentNum" id="shipmentNum">
						<div class="mt-5 text-center">
							<button class="btn btn-secondary" type="button" id="regBtn">등록하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/js/payment/shipmentAdd.js"></script>
</body>
</html>