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
	
	<div class="container my-5">
		<div class="text-center my-5">
			<h1>추천 원두 페이지</h1>
		</div>
		<div class="border border-2 rounded-3 bg-light">
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
		<div class="border border-2 rounded mt-5">
			<form action="./recommendedList" id="searchForm" method="get"> 
				<div class="d-flex justify-content-between m-3">
					<div class="border border-2 rounded p-3" id="sortingSection">
						<div class="form-check">
						  <input class="form-check-input sorting" type="radio" name="sorting" value="col1" id="col1" <c:if test="${pager.sorting == 'col1' || pager.sorting == ''}">checked</c:if>>
						  <label class="form-check-label" for="col1">
						    최신순
						  </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input sorting" type="radio" name="sorting" value="col2" id="col2" <c:if test="${pager.sorting == 'col2'}">checked</c:if>>
						  <label class="form-check-label" for="col2">
						    인기순
						  </label>
						</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="d-flex h-50">
							<select class="form-select" name="kind">
							  <option value="col1" <c:if test="${pager.kind == 'col1'}">selected</c:if>>상품명</option>
							  <option value="col2" <c:if test="${pager.kind == 'col2'}">selected</c:if>>로스터리정보</option>
							</select>
					        <input class="form-control me-2" type="search" name="search" value="${pager.search}" placeholder="Search" aria-label="Search" style="width: 250px;">
					        <button class="btn btn-outline-success" type="submit">Search</button>
				        </div>
			        </div>
		        </div>
		    </form>
		</div>
		<c:choose>
			<c:when test="${empty productDTOs}">
				<div class="border border-top-0 border-2 text-center p-5 mb-5">
					<h4>찾으시는 원두가 없어요</h4>
				</div>
			</c:when>
			<c:otherwise>
				<div class="border border-top-0 border-2 rounded my-4">
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 p-3 g-5">
						<c:forEach items="${productDTOs}" var="productDTO">
							<div class="col">
								<div class="card text-center">
									<img src="../resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
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
			
					<div class="d-flex justify-content-center align-items-center mt-2">
						<nav>
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
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
	<script src="../resources/js/product/recommendedList.js"></script>
</body>
</html>