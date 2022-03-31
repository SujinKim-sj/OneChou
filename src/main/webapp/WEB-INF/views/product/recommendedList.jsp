<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
		<div class="text-center my-5">
			<h1>추천 원두 페이지</h1>
		</div>
		<div class="border border-2 rounded">
			<div class="text-center py-3 border-bottom border-2">
				<h3>나의 관심원두 정보</h3>
			</div>
			<div class="row mx-5 mt-3 text-center">
				<div class="col fw-bold">컵노트</div>
				<div class="col fw-bold">로스팅포인트</div>
				<div class="col fw-bold">향미</div>
			</div>
			<div class="row mx-5 mb-3 text-center">
				<div class="col">
					<c:forEach items="${favoriteDTO.cupnoteDTOs}" var="cupnoteDTO">
						<div>
							${cupnoteDTO.noteName}
						</div>
					</c:forEach>
				</div>
				<div class="col d-flex align-items-center justify-content-center">
					<div>
						<c:choose>
							<c:when test="${favoriteDTO.roastingPoint == 1}">
								Light Roast
							</c:when>
							<c:when test="${favoriteDTO.roastingPoint == 2}">
								Medium Roast
							</c:when>
							<c:otherwise>
								Dark Roast
							</c:otherwise>						
						</c:choose>
					</div>
				</div>
				<div class="col d-flex align-items-center justify-content-center">
					<div>
						<c:choose>
							<c:when test="${favoriteDTO.flavor == 1}">
								산미 위주의 상큼한 커피
							</c:when>
							<c:when test="${favoriteDTO.flavor == 2}">
								고소하면서 부드러운 커피
							</c:when>
							<c:otherwise>
								묵직하면서 단맛이 잘 느껴지는 커피
							</c:otherwise>						
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<div class="my-5">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
				<c:forEach items="${productDTOs}" var="productDTO">
					<div class="col">
						<div class="card text-center">
							<img src="../resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
							<div class="card-body">						
							<h5 class="card-title">${productDTO.roasteryName}</h5>
							<h5 class="card-title">${productDTO.name}</h5>
							<p class="card-text">
								<div>${productDTO.price}원</div>
								<div class="mt-3">
									<span class="fw-bold">겹치는 컵노트</span> : 
									<c:forEach items="${productDTO.productFeatureDTO.productCupnoteDTOs}" var="productCupnoteDTO" varStatus="state">
										${productCupnoteDTO.noteName}<c:choose><c:when test="${state.last}"></c:when><c:otherwise>,</c:otherwise></c:choose>
									</c:forEach>
								</div>
								<div>
									<span class="fw-bold">로스팅포인트</span> : 
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
								</div>
								<div>
									<span class="fw-bold">향미</span> :
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
								</div>						
							</p>
							
							<a href="./detail?num=${productDTO.num}" class="btn btn-secondary">상세정보보기</a>
							</div>
						</div>
					</div>	
				</c:forEach>
			</div>
			
			<div class="d-flex justify-content-between align-items-center mt-5">
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    
				    <c:if test="${pager.pre}">
					    <li class="page-item">
					      <a class="page-link" href="./list?page=${pager.startNum-1}&search=${pager.search}&kind=${pager.kind}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
				    </c:if>
				    
				    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				    	<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
				    </c:forEach>
				    
				    <c:if test="${pager.next}">
					    <li class="page-item">
					      <a class="page-link" href="./list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				  </ul>
				</nav>
				<form action="./list" method="get" class="d-flex">
					<select class="form-select" name="kind">
					  <option selected>검색기준을 골라주세요</option>
					  <option value="col1">상품명</option>
					  <option value="col2">로스터리정보</option>
					</select>
			        <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
			    </form>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>