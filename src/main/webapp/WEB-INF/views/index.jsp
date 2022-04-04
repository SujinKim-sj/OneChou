<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>Home</title>
	<c:import url="./template/css_import.jsp"></c:import>
</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<div class="container">
		
		<c:choose>
			<c:when test="${member.kind == 2 && fn:length(recommendedProductDTOs) != 0}">
				<div class="border border-2 rounded-3 my-5" id="recommendedProductSection">
						<div class="text-center p-3">
							<h3>${member.nickname}님을 위한 추천원두</h3>
						</div>
						<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 p-3 g-5">
							<c:forEach items="${recommendedProductDTOs}" var="productDTO">
								<div class="col">
									<div class="card text-center">
										<img src="./resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
										<div class="card-body">						
										<h5 class="card-title">${productDTO.roasteryName}</h5>
										<h6 class="card-title">${productDTO.name}</h6>
										<p class="card-text">
											<div>${productDTO.price}원</div>
											<div class="mt-3 pt-3 border-top">
												<ul class="list-group">
	  												<li class="list-group-item">좋아하실만한 컵노트</li>
	  												<li class="list-group-item">
	  												<c:forEach items="${productDTO.productFeatureDTO.productCupnoteDTOs}" var="productCupnoteDTO" varStatus="state">
														${productCupnoteDTO.noteName}<c:choose><c:when test="${state.last}"></c:when><c:otherwise>,</c:otherwise></c:choose>
													</c:forEach>
													</li>
	  											</ul>										
											</div>
											<div class="mt-3">
												<ul class="list-group">
	  												<li class="list-group-item">로스팅포인트</li>
	  												<li class="list-group-item">
	  												<c:choose>
														<c:when test="${productDTO.productFeatureDTO.roastingPoint == 1}">
															Light Roast
														</c:when>
														<c:when test="${productDTO.productFeatureDTO.roastingPoint == 2}">
															Medium Roast
														</c:when>
														<c:otherwise>
															Dark Roast
														</c:otherwise>
													</c:choose>
													</li>
	  											</ul>
											</div>
											<div class="mt-3">
												<ul class="list-group">
	  												<li class="list-group-item">향미</li>
	  												<li class="list-group-item">
	  												<c:choose>
														<c:when test="${productDTO.productFeatureDTO.flavor == 1}">
															산미 위주의 상큼한 커피
														</c:when>
														<c:when test="${productDTO.productFeatureDTO.flavor == 2}">
															고소하면서 부드러운 커피
														</c:when>
														<c:otherwise>
															묵직하면서 단맛이 잘 느껴지는 커피
														</c:otherwise>
													</c:choose>
													</li>
	  											</ul>
											</div>						
										</p>									
										<a href="./detail?num=${productDTO.num}" class="btn btn-secondary">상세정보보기</a>
										</div>
									</div>
								</div>	
							</c:forEach>
						</div>
						<div class="text-end">
							<a href="./product/recommendedList" class="btn btn-outline-secondary m-3">추천상품 더보기</a>
						</div>					
				</div>
			</c:when>
			
			<c:otherwise>
				<div class="border border-2 rounded-3 my-5" id="newestProductSection">
					<div class="text-center p-3">
						<h3>최근에 등록된 신상 원두</h3>
					</div>
				 	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 p-3 g-5">
						<c:forEach items="${newestProductDTOs}" var="productDTO">
							<div class="col">
								<div class="card text-center">
									<img src="./resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
									<div class="card-body">						
									<h5 class="card-title">${productDTO.roasteryName}</h5>
									<h6 class="card-title">${productDTO.name}</h6>
									<p class="card-text">
										<div>${productDTO.price}원</div>					
									</p>
									
									<a href="./detail?num=${productDTO.num}" class="btn btn-secondary">상세정보보기</a>
									</div>
								</div>
							</div>	
						</c:forEach>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="border border-2 rounded-3 my-5" id="newestProductSection">
			<div class="text-center p-3">
				<h3>인기 원두</h3>
			</div>
		 	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 p-3 g-5">
				<c:forEach items="${productDTOs}" var="productDTO">
					<div class="col">
						<div class="card text-center">
							<img src="./resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
							<div class="card-body">						
							<h5 class="card-title">${productDTO.roasteryName}</h5>
							<h6 class="card-title">${productDTO.name}</h6>
							<p class="card-text">
								<div>${productDTO.price}원</div>					
							</p>
							
							<a href="./detail?num=${productDTO.num}" class="btn btn-secondary">상세정보보기</a>
							</div>
						</div>
					</div>	
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
