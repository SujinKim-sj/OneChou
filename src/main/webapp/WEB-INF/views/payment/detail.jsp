<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/payment/detail.css">

	<title>OneChou - 상세결제정보</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container my-5">
		<div class="text-center">
			<c:choose>
				<c:when test="${connectionPath == 1}">
					<h3>감사합니다. 결제가 완료되었습니다.</h3>
				</c:when>
				<c:otherwise>
					<h3>주문번호 ${paymentDTO.num}번의 상세정보 입니다</h3>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row border border-2 rounded mt-5">
			<div class="text-center pt-3 pb-3">
				<h3>결제 상품 정보</h3>
			</div>
			<div>
				<table class="table table-bordered text-center align-middle">
					<thead>
						<tr>
						<th scope="col">상품사진</th>
						<th scope="col">주문정보</th>
						<th scope="col">배송상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${paymentDTO.paidProductDTOs}" var="paidProductDTO">							
							<tr>
								<td><img class="productImg" src="../resources/upload/product/${paidProductDTO.productDTO.productFileDTO.fileName}" alt=""></td>
								<td>
									<div class="text-start">
										<div>
											<span class="fw-bold">${paidProductDTO.productDTO.roasteryName} ${paidProductDTO.productDTO.name}</span>, 
											<span class="text-secondary">${paidProductDTO.productOptionDTO.optionName}(+${paidProductDTO.productOptionDTO.addPrice}원)</span>
										</div>
										<div>
											상품금액 : ${paidProductDTO.productDTO.price}원, ${paidProductDTO.amount}개 구매
										</div>
										<div>
											<c:choose>
												<c:when test="${paidProductDTO.productDTO.freeDelivery == 0 || paidProductDTO.perPrice < paidProductDTO.productDTO.freeDelivery}">
													배송비 : ${paidProductDTO.productDTO.deliveryFee}원,
												</c:when>
												<c:otherwise>
													<span class="fw-bold">무료배송</span>,
												</c:otherwise>
											</c:choose>										
											 총 ${paidProductDTO.perPrice}원
										</div>
										<div class="text-end">
											<form action="../review/add" method="post">
												<input type="hidden" name="num" value="${paidProductDTO.productNum}">
												<button type="submit" class="btn btn-outline-secondary">리뷰작성하기</button>
											</form>
										</div>
									</div>
								</td>
								<td>
									<c:choose>
										<c:when test="${paidProductDTO.shipmentStatus == 0}">
											발송준비중
										</c:when>
										<c:otherwise>
											발송완료
											배송회사 : ${paidProductDTO.deliveryCompany}
											운송장번호 : ${paidProductDTO.shipmentNum}
											<a href="https://tracker.delivery/#/${paidProductDTO.deliveryCompany}/${paidProductDTO.shipmentNum}" target="_blank">배송조회하기</a>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>		
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row border border-2 text-center rounded mt-5 mb-5">
			<div class="mt-3 mb-3">
				<h3>배송 정보</h3>
			</div>
			<div class="col border border-2 rounded text-start mb-3 mx-3">
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">받는사람</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.deliveryDTO.recipient}</span>
					</div>					
				</div>
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">받는사람연락처</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.deliveryDTO.recipientPhone}</span>
					</div>					
				</div>
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">배송주소</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.deliveryDTO.address}</span>
					</div>					
				</div>
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">배송메모</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.deliveryDTO.memo}</span>
					</div>					
				</div>
			</div>
		</div>
		<div class="row border border-2 text-center rounded mt-5 mb-5">
			<div class="mt-3 mb-3">
				<h3>결제 정보</h3>
			</div>
			<div class="col border border-2 rounded text-start mb-3 mx-3">
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">주문번호</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.num}</span>
					</div>					
				</div>
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">주문일자</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.orderDate}</span>
					</div>					
				</div>
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">결제방식</span>
					</div>
					<div class="col-9">
						<c:choose>
							<c:when test="${paymentDTO.method == 1}">
								<span>카드결제</span>
							</c:when>
							<c:otherwise>
								<span>현금결제</span>
							</c:otherwise>
						</c:choose>
					</div>					
				</div>
				<div class="row row-cols-2 m-3">
					<div class="col-3">
						<span class="fw-bold">결제금액</span>
					</div>
					<div class="col-9">
						<span>${paymentDTO.totalPrice}원</span>
					</div>					
				</div>
			</div>
		</div>
		<div class="my-5 text-center">
			<a href="./list" class="btn btn-secondary">결제내역 목록보기</a>
		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>