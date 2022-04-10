<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<input class="mt-5" type="checkbox" checked id="checkAll">
		<span class="fs-5">전체선택</span>
		<c:forEach items="${cartDTOs}" var="cartDTO">
			<div class="row border border-2 rounded mt-2" id="listMain${cartDTO.num}">
				<div class="col">
					<div class="d-flex justify-content-between align-items-center mt-3 mb-3">
						<div class="check text-center">
							<input class="cartClick" type="checkbox" checked="true" value="${cartDTO.num}">
						</div>
						<div class="productInfo d-flex align-items-center justify-content-center">
							<div>
								<img class="productImg" src="../resources/upload/product/${cartDTO.productDTO.productFileDTO.fileName}">
							</div>
							<div class="productInfoBasic d-flex flex-column align-items-center">
								<div class="fw-bold">${cartDTO.productDTO.roasteryName}</div>
								<div class="fw-bold">${cartDTO.productDTO.name}</div>
								<div>${cartDTO.productDTO.price}원</div>
							</div>
						</div>
						<div class="option text-center">
							<select class="form-select" id="selectOption${cartDTO.num}">
								<c:forEach items="${cartDTO.productDTO.productOptionDTOs}" var="productOptionDTO">
									<option value="${productOptionDTO.num}" class="options${cartDTO.num}"<c:if test="${productOptionDTO.num==cartDTO.optionNum}">selected</c:if>>옵션명 : ${productOptionDTO.optionName} 옵션가격 : ${productOptionDTO.addPrice}</option>
								</c:forEach>
							</select>
							<select class="form-select" id="selectAmount${cartDTO.num}">
								<c:forEach begin="1" end="10" var="i">									
									<option value="${i}" <c:if test="${i==cartDTO.amount}">selected</c:if>>${i}</option>
								</c:forEach>
							</select>
							<div><button type="button" class="btn btn-secondary mt-2 updateBtn" data-num="${cartDTO.num}">변경하기</button></div>
						</div>
						<div class="delivery text-center">
							<div class="fw-bold">배송비</div>
							<c:choose>
								<c:when test="${cartDTO.productDTO.freeDelivery == 0 ||cartDTO.perPrice < cartDTO.productDTO.freeDelivery}">
									<div>${cartDTO.productDTO.deliveryFee}</div>
								</c:when>
								<c:otherwise>
									<div>무료배송</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="price text-center">
							<div class="fw-bold">총 가격</div>
							<div>${cartDTO.perPrice}</div>
						</div>
						<input type="hidden" id="originalOptionNum${cartDTO.num}" value="${cartDTO.optionNum}">
						<input type="hidden" id="originalAmount${cartDTO.num}" value="${cartDTO.amount}">
						<input type="hidden" id="productPriceSelector${cartDTO.num}" value="${cartDTO.productDTO.price}">
						<input type="hidden" id="freeDeliverySelector${cartDTO.num}" value="${cartDTO.productDTO.freeDelivery}">
						<input type="hidden" id="deliveryFeeSelector${cartDTO.num}" value="${cartDTO.productDTO.deliveryFee}">
					</div>
				</div>
			</div>
		</c:forEach>