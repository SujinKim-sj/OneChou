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
	
	<div class="container text-center mt-5">
		<h1>전체 상품 페이지</h1>
	</div>
	<div class="container mt-5">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
			<c:forEach items="${productDTOs}" var="productDTO">
				<div class="col">
					<div class="card text-center">
						<img src="../resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
						<div class="card-body">						
						<h5 class="card-title">${productDTO.roasteryName}</h5>
						<h5 class="card-title">${productDTO.name}</h5>
						<p class="card-text">${productDTO.price}원</p>
						<a href="./detail?num=${productDTO.num}" class="btn btn-secondary">상세정보보기</a>
						</div>
					</div>
				</div>	
			</c:forEach>
		</div>
		
		<div class="d-flex justify-content-between align-items-center mt-5 mb-5">
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>