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

		<div class="row row-cols-2">
			<div class="col col-5">
				<img class="img-fluid" src="../resources/upload/product/${productDTO.productFileDTO.fileName}">
			</div>
			<div class="col col-7">
				<table class="table">
					<tr>
						<td>상품명</td>
						<td colspan="5">${productDTO.name}</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td colspan="5">${productDTO.price}</td>
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
								<td colspan="5">Light Roast</td>
							</c:when>
							<c:when test="${productDTO.productFeatureDTO.roastingPoint==2}">
								<td colspan="5">Medium Roast</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">Dark Roast</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>상품향미</td>
						<c:choose>
							<c:when test="${productDTO.productFeatureDTO.flavor==1}">
								<td colspan="5">산미 위주의 상큼한 커피</td>
							</c:when>
							<c:when test="${productDTO.productFeatureDTO.flavor==2}">
								<td colspan="5">고소하면서 부드러운 커피</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">묵직하면서 단맛이 잘 느껴지는 커피</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>리뷰별점</td>
						<c:choose>
							<c:when test="${empty productDTO.reviewDTOs}">
								<td colspan="5">리뷰정보없음</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">${reviewAvg}</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td>상품옵션</td>
						<td colspan="5">
							<select class="form-select">
								<option selected>상품 옵션을 골라주세요</option>
									<c:forEach items="${productDTO.productOptionDTOs}" var="productOption">
										<option value="${productOption.num}">옵션명 : ${productOption.optionName}&nbsp;옵션가격 : ${productOption.addPrice}</option>									
									</c:forEach>
							 </select>
						</td>
					</tr>
					<tr>
						<td>상품수량</td>
						<td colspan="5">
							<select class="form-select">
								<option selected>상품 수량을 골라주세요</option>
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
				</table>
				<div class="d-flex justify-content-between">
					<button class="btn btn-secondary" type="button">장바구니담기</button>
					<button class="btn btn-secondary" type="button">바로구매하기</button>
				</div>
			</div>	
		</div>

		<div class="row mt-5">
			<div class="col">
				<div class="accordion" id="accordionExample">
					<div class="accordion-item">
					  <h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						  상품설명보기
						</button>
					  </h2>
					  <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="accordion-body">
						  ${productDTO.info}
						</div>
					  </div>
					</div>
					<div class="accordion-item">
					  <h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						  리뷰
						</button>
					  </h2>
					  <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<c:choose>
								<c:when test="${empty productDTO.reviewDTOs}">
									<h5>아직 이 상품에는 아무런 리뷰도 없어요</h5>
								</c:when>
								<c:otherwise>
									<table class="table">
										<thead>
										  <tr>
											<th scope="col">별점</th>
											<th scope="col">작성자</th>
											<th colspan="5" scope="col">내용</th>
											<th scope="col">작성일</th>
										  </tr>
										</thead>
										<tbody>
											<c:forEach items="${productDTO.reviewDTOs}" var="review">
											  <tr>
												<th scope="row">${review.rating}</th>
												<td>${review.writer}</td>
												<td colspan="5">${review.contents}</td>
												<td>${review.regDate}</td>
											  </tr>
										  	</c:forEach>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					  </div>
					</div>
					<div class="accordion-item">
					  <h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
						  질문
						</button>
					  </h2>
					  <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
						<div class="accordion-body">
						  	<c:choose>
								<c:when test="${empty productDTO.qnaDTOs}">
									<h5>아직 이 상품에는 아무런 질문도 없어요</h5>
								</c:when>
								<c:otherwise>
									<table class="table">
										<thead>
										  <tr>
											<th scope="col">작성자</th>
											<th colspan="5" scope="col">질문 내용</th>
											<th scope="col">작성일</th>
											<th scope="col"></th>
											<th scope="col"></th>
										  </tr>
										</thead>
										<tbody>
											<c:forEach items="${productDTO.qnaDTOs}" var="qna">
											  <tr>
												<th>${qna.writer}</th>
												<td colspan="5">${qna.contents}</td>
												<td>${qna.regDate}</td>
												<td><a class="btn btn-secondary" href="../qna/reply?num=${qna.num}">답글달기</a></td>
												<td><a class="btn btn-secondary" href="../qna/delete?num=${qna.num}">삭제하기</a></td>
											  </tr>
										  	</c:forEach>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					  </div>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div>

			</div>
		</div>

	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>