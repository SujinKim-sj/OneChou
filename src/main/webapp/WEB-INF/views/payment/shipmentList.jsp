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
	
	<div class="container my-5">
		<div class="text-center my-5">
			<h5>결제 완료된 주문정보</h5>
		</div>
		<div class="text-end">
			
			<c:choose>
				<c:when test="${shipmentStatus == '0'}">
					<a href="./shipmentList?shipmentStatus=1" class="btn btn-outline-secondary">발송 완료 상품 보기</a>
				</c:when>
				<c:otherwise>
					<a href="./shipmentList?shipmentStatus=0" class="btn btn-outline-secondary">발송 준비 상품 보기</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="paymentSection">
		<c:forEach items="${paymentDTOs}" var="paymentDTO">
		<div class="border border-2 rounded my-5">
			<div class="m-3">
				<div>
					<div class="fw-bold">주문정보</div>
					<div>주문번호 : ${paymentDTO.num}</div>
					<div>주문일자 : ${paymentDTO.orderDate}</div>
				</div>
				<div class="mt-2">
					<div class="fw-bold">배송지 정보</div>
					<div>받는사람 : ${paymentDTO.deliveryDTO.recipient}</div>
					<div>배송주소 : ${paymentDTO.deliveryDTO.address}</div>
					<div>연락처 : ${paymentDTO.deliveryDTO.recipientPhone}</div>
					<div>배송메모 : ${paymentDTO.deliveryDTO.memo}</div>
				</div>
			</div>
			<c:forEach items="${paymentDTO.paidProductDTOs}" var="paidProductDTO">
			<div class="row row-cols-3 border border-2 rounded m-3">
				<div class="col-2">
					<img class="productImg" src="../resources/upload/product/${paidProductDTO.productDTO.productFileDTO.fileName}">
				</div>
				<div class="col-7 border-end d-flex align-items-center">
					<div>
						<div>
							<span class="fw-bold">${paidProductDTO.productDTO.roasteryName} ${paidProductDTO.productDTO.name}</span>, 
							<span class="text-secondary">${paidProductDTO.productOptionDTO.optionName}(+${paidProductDTO.productOptionDTO.addPrice}원)</span>
						</div>
						<div>상품금액 : ${paidProductDTO.productDTO.price}원, ${paidProductDTO.amount}개 구매, 총 ${paidProductDTO.perPrice}원</div>
					</div>
				</div>
				<div class="col-3 d-flex align-items-center justify-content-center">
					<div class="d-flex justify-content-center align-items-center">
						<div>
							<c:choose>
								<c:when test="${shipmentStatus == '0'}">
								<form action="../payment/shipmentAdd" method="post">
									<input type="hidden" name="num" value="${paidProductDTO.num}">
									<button class="btn btn-secondary" type="submit">배송정보입력</button>
								</form>
								</c:when>
								<c:otherwise>
									<button type="button" class="shipmentSearchBtn btn btn-secondary" data-num="${paidProductDTO.num}">배송조회하기</button>
									<input type="hidden" value="${paidProductDTO.deliveryCompany}" id="deliveryCompany${paidProductDTO.num}">
									<input type="hidden" value="${paidProductDTO.shipmentNum}" id="shipmentNum${paidProductDTO.num}">
								</c:otherwise>
							</c:choose>

						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</c:forEach>
		</div>
		<div class="d-flex justify-content-center my-5">
			<nav>
			  <ul class="pagination">		    
			    <c:if test="${pager.pre}">
				    <li class="page-item">
				      <a class="page-link" href="./shipmentList?page=${pager.startNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="./shipmentList?page=${i}">${i}</a></li>
			    </c:forEach>
			    
			    <c:if test="${pager.next}">
				    <li class="page-item">
				      <a class="page-link" href="./shipmentList?page=${pager.lastNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>	
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../resources/js/payment/shipmentList.js"></script>

</body>
</html>