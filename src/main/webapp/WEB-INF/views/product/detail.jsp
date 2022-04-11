<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/product/detail.css">
	
	<title>OneChou - 상품상세정보</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container my-5">

		<div class="row row-cols-2 border border-2 rounded-3 bg-light">
			<div class="col col-5">
				<img class="img-fluid" src="../resources/upload/product/${productDTO.productFileDTO.fileName}">
			</div>
			<div class="col col-7">
				<input type="hidden" name="productNum" id="productNum" value="${productDTO.num}">
				<input type="hidden" name="memberId" id="memberId" value="${member.id}">
				<input type="hidden" disabled id="deliveryFee" value="${productDTO.deliveryFee}">
				<input type="hidden" disabled id="price" value="${productDTO.price}">
				<input type="hidden" disabled id="freeDelivery" value="${productDTO.freeDelivery}">
				<input type="hidden" name="perPrice" id="perPrice">
				<input type="hidden" id="reviewAvg" value="${reviewAvg}">
				<input type="hidden" id="memberNickname" value="${member.nickname}">
				<table class="table">
					<tr>
						<td>원두명</td>
						<td colspan="3">${productDTO.name}</td>
					</tr>
					<tr>
						<td>가격</td>
						<td colspan="3">${productDTO.price}원</td>
					</tr>
					<tr>
						<td>컵노트</td>
						<c:forEach items="${productDTO.productFeatureDTO.productCupnoteDTOs}" var="cupnote">
							<td>${cupnote.noteName}</td>
						</c:forEach>
					</tr>
					<tr>
						<td>로스팅포인트</td>
						<c:choose>
							<c:when test="${productDTO.productFeatureDTO.roastingPoint==1}">
								<td colspan="3">Light Roast</td>
							</c:when>
							<c:when test="${productDTO.productFeatureDTO.roastingPoint==2}">
								<td colspan="3">Medium Roast</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">Dark Roast</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>향미</td>
						<c:choose>
							<c:when test="${productDTO.productFeatureDTO.flavor==1}">
								<td colspan="3">산미 위주의 상큼한 커피</td>
							</c:when>
							<c:when test="${productDTO.productFeatureDTO.flavor==2}">
								<td colspan="3">고소하면서 부드러운 커피</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">묵직하면서 단맛이 잘 느껴지는 커피</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>리뷰평균</td>
 						<c:choose>
							<c:when test="${reviewInfo['COUNT'] == 0}">
								<td colspan="3">리뷰정보없음</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">				
								<span>${reviewInfo['AVG']}점/5.0점 (총 ${reviewInfo['COUNT']}개의 리뷰)</span>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>로스터리</td>
						<td colspan="3"><a class="link-secondary" href="../roastery/detail?num=${productDTO.roasteryNum}">${productDTO.roasteryName}</a></td>
					</tr>
					<tr>
						<td>상품옵션</td>
						<td colspan="3">
							<select class="form-select" name="optionNum" id="optionNum">
								<option value="no" selected>상품 옵션을 골라주세요</option>
									<c:forEach items="${productDTO.productOptionDTOs}" var="productOption">
										<option class="options" value="${productOption.num}">옵션명 : ${productOption.optionName}&nbsp;옵션가격 : ${productOption.addPrice}</option>									
									</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>상품수량</td>
						<td colspan="3">
							<select class="form-select" name="amount" id="amount">
								<option value="no" selected>상품 수량을 골라주세요</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>배송비</td>
						<c:choose>
							<c:when test="${productDTO.deliveryFee == 0}">
								<td colspan="3">해당 상품은 무료배송 상품입니다</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">${productDTO.deliveryFee}원</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>배송비정책</td>
						<c:choose>
							<c:when test="${productDTO.freeDelivery == 0}">
								<td colspan="3">해당 상품은 무료배송이 불가능합니다</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">해당 상품은 ${productDTO.freeDelivery}원 이상 구매하시면 무료배송입니다</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td colspan="2" id="showOption"></td>
						<td colspan="1" id="showAmount"></td>
						<td colspan="1" id="showPerPrice"></td>
					</tr>
				</table>
				<c:if test="${member.kind == 2}">
					<div class="d-flex justify-content-between mb-3">
						<button class="btn btn-secondary" id="cartBtn" type="button">장바구니담기</button>
						<form action="../payment/add" method="post" id="payForm">
							<input type="hidden" id="cartNum" name="nums">
						</form>
						<button class="btn btn-secondary" id="paymentBtn" type="button">바로구매하기</button>
					</div>
				</c:if>
			</div>	
		</div>

		<div class="row mt-5 mb-5 border border-2 rounded">
			<div class="pt-3 mb-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2">원두설명</p>
			</div>
			<div class="d-flex justify-content-center align-items-center mt-3 mb-3">
				<span class="fs-5 mb-3 infoText">${productDTO.info}</span>
			</div>
		</div>

		<div class="row mt-5 mb-5 border border-2 rounded">
			<div class="py-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2">원두리뷰</p>
			</div>
			<div class="mt-3 mb-3" id="reviewSection">

			</div>
		</div>

		<div class="row mt-5 mb-5 border border-2 rounded">
			<div class="py-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2 mb-0">원두질문</p>
			</div>
			<div class="mt-3 mb-3" id="qnaSection">

			</div>
		</div>

	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
	<script src="../resources/js/product/detail.js"></script>
</body>
</html>