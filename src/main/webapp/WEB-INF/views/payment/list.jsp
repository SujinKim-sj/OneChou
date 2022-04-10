<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/payment/list.css">

	<title>OneChou - 내 결제내역</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container my-5">
		<div class="text-center mt-5">
		<c:choose>
			<c:when test="${fn:length(paymentDTOs) == 0}">
				<div class="d-flex justify-content-center align-items-center" style="height: 300px">
					<h3 class="text-center align-items-center">아직 결제하신 상품이 없어요</h3>		
				</div>
			</c:when>
			<c:otherwise>
				<h3>${member.nickname}회원님의 결제내역입니다</h3>
			</c:otherwise>
		</c:choose>
		</div>			
		<div id="paymentSection">
		
		<c:forEach items="${paymentDTOs}" var="paymentDTO">
		<div class="border border-2 rounded my-5">
			<div class="d-flex justify-content-between m-3">
				<div>
					<div>주문번호 : ${paymentDTO.num}</div>
					<div>주문일자 : ${paymentDTO.orderDate}</div>
				</div>
				<div><a href="./detail?num=${paymentDTO.num}">상세정보보기</a></div>
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
									<button type="button" class="shipmentSearchBtn btn btn-secondary" data-num="${paidProductDTO.num}">배송조회하기</button>
									<input type="hidden" value="${paidProductDTO.deliveryCompany}" id="deliveryCompany${paidProductDTO.num}">
									<input type="hidden" value="${paidProductDTO.shipmentNum}" id="shipmentNum${paidProductDTO.num}">
								</div>
							</c:otherwise>
						</c:choose>						
						<div class="my-2">
							<form action="../review/add" method="post">
								<input type="hidden" name="num" value="${paidProductDTO.productNum}">
								<button class="btn btn-secondary" type="submit">리뷰작성하기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
		</c:forEach>
		</div>
		<c:if test="${fn:length(paymentDTOs) > 1}">
		<div class="d-flex justify-content-center my-5">
			<nav>
			  <ul class="pagination">		    
			    <c:if test="${pager.pre}">
				    <li class="page-item">
				      <a class="page-link" href="./list?page=${pager.startNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="./list?page=${i}">${i}</a></li>
			    </c:forEach>
			    
			    <c:if test="${pager.next}">
				    <li class="page-item">
				      <a class="page-link" href="./list?page=${pager.lastNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>		
		</c:if>
	</div>

	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../resources/js/payment/list.js"></script>
</body>
</html>