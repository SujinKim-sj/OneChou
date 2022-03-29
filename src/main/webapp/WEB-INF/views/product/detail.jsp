<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container mt-5">

		<div class="row row-cols-2 border border-2 rounded">
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
				<table class="table">
					<tr>
						<td>원두명</td>
						<td colspan="3">${productDTO.name}</td>
					</tr>
					<tr>
						<td>가격</td>
						<td colspan="3">${productDTO.price}</td>
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
							<c:when test="${empty productDTO.reviewDTOs}">
								<td colspan="3">리뷰정보없음</td>
							</c:when>
							<c:otherwise>
								<td colspan="3">
								<span>⭐</span>
								<span>⭐</span>
								<span>⭐</span>
								<span>⭐</span>
								<span>⭐</span>								
								<span>(${reviewAvg}점)</span>
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
				<div class="d-flex justify-content-between mb-3">
					<button class="btn btn-secondary" id="cartBtn" type="button">장바구니담기</button>
					<form action="../payment/add" method="post" id="payForm">
						<input type="hidden" id="cartNum" name="nums">
					</form>
					<button class="btn btn-secondary" id="paymentBtn" type="button">바로구매하기</button>
				</div>
			</div>	
		</div>

		<div class="row mt-5 mb-5 border border-2 rounded">
			<div class="pt-3 mb-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2">원두설명</p>
			</div>
			<div class="mt-3 mb-3">
				<p class="fs-5 text-wrap">${productDTO.info}</p>
			</div>
		</div>

		<div class="row mt-5 mb-5 border border-2 rounded">
			<div class="pt-3 mb-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2">원두리뷰</p>
			</div>
			<div class="mt-3 mb-3" id="reviewSection">

			</div>
		</div>

		<div class="row mt-5 mb-5 border border-2 rounded">
			<div class="pt-3 mb-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2">원두질문</p>
			</div>
			<div class="mt-3 mb-3">
				<c:choose>
					<c:when test="${empty productDTO.qnaDTOs}">
						<h5 class="text-center">아직 이 상품에는 아무런 질문도 없어요</h5>
					</c:when>
					<c:otherwise>
						<table class="table table-striped">
							<thead>
							  <tr>
								<th scope="col">작성자</th>
								<th colspan="5" style="width:50%" scope="col">질문 내용</th>
								<th scope="col">작성일</th>
								<th scope="col"></th>
								<th scope="col"></th>
							  </tr>
							</thead>
							<tbody>
								<c:forEach items="${productDTO.qnaDTOs}" var="qna">
								  <tr>
									<th>${qna.writer}</th>
									<td class="text-wrap" colspan="5" style="width:50%">
									<c:forEach begin="1" end="${qna.depth}">└───</c:forEach>
									${qna.contents}</td>
									<td>${qna.regDate}</td>
									<c:choose> 
										<c:when test="${qna.step==0}"> <!-- 답변에 답글은 못달게 함 -->
										<!-- 나중에 로그인 한 사람만 보이도록 -->
											<td><a class="btn btn-secondary" href="../qna/reply?num=${qna.num}">답글달기</a></td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									<!-- 나중에 작성자랑 로그인한 사람의 닉네임이랑 같다면 삭제버튼이 보이도록 -->
									<td><a class="btn btn-secondary" href="../qna/delete?num=${qna.num}&productNum=${qna.productNum}">삭제하기</a></td>
								  </tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>
				<form action="../qna/add" method="post">
					<input type="hidden" name="memberId" value="${member.id}">
					<input type="hidden" name="writer" value="${member.nickname}">
					<input type="hidden" name="productNum" value="${productDTO.num}">
					<div class="input-group mt-5">
					  <span class="input-group-text">질문이 있으신가요?</span>
					  <textarea class="form-control" name="contents"></textarea>
					  <button class="btn btn-outline-secondary" type="submit">질문등록</button>
					</div>
				</form>
			</div>
		</div>

	</div>
	
	<script src="../resources/js/product/detail.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>