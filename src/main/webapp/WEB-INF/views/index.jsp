<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
	<title>OneChou</title>
	<c:import url="./template/css_import.jsp"></c:import>
</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<div class="container">
		<div class="row row-cols-1 row-cols-lg-2 align-items-stretch g-4 py-5">
	      <div class="col">
	        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('./resources/indexImage/블랙워터이슈1.jpg');">
	          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
	            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><a class="text-decoration-none link-light" href="https://bwissue.com/news/1817865" target='_blank'>콘티(Conti)에서 출시한 <br>1그룹 에스프레소 머신,<br> 에이스(ACE)</a></h2>
	            <ul class="d-flex list-unstyled justify-content-end mt-auto">
	              <li class="d-flex align-items-center">
	                <svg class="bi me-2" width="1em" height="1em"><use xlink:href="#calendar3"></use></svg>
	                <small>2022-03-28</small>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
	
	      <div class="col">
	        <div class="card card-cover h-100 overflow-hidden text-white bg-dark rounded-5 shadow-lg" style="background-image: url('./resources/indexImage/블랙워터이슈2.png');">
	          <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1">
	            <h2 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold"><a class="text-decoration-none link-light" href="https://bwissue.com/news/1813618" target='_blank'>CAFE A에서 진행되는<br>박승규 게스트 바리스타 행사</a></h2>
	            <ul class="d-flex list-unstyled justify-content-end mt-auto">
	              <li class="d-flex align-items-center">
	                <small>2022-03-22</small>
	              </li>
	            </ul>
	          </div>
	        </div>
	      </div>
		</div>
		
		<c:choose>
			<c:when test="${member.kind == 2 && fn:length(recommendedProductDTOs) != 0}">
				<div class="border border-2 border-secondary rounded-3 mt-2 mb-5" id="recommendedProductSection">
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
				<div class="border border-2 border-secondary rounded-3 mt-2 mb-5" id="newestProductSection">
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
		<div class="border border-2 border-secondary rounded-3 my-5" id="newestProductSection">
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
	
	<c:import url="./template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
