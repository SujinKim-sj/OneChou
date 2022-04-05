<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/product/myList.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container my-5">
		<div class="text-center my-5">
			<h3>내 상품정보 리스트 페이지</h3>
		</div>
		<div class="mb-3">
			<form class="d-flex justify-content-between" action="./myList" id="searchForm" method="get">
				<div>				
					<select class="form-select" id="sortingSelect" name="sorting">
					  <option>정렬 기준을 골라주세요</option>
					  <option value="col1" <c:if test="${pager.sorting == 'col1'}">selected</c:if>>등록일자</option>
					  <option value="col2" <c:if test="${pager.sorting == 'col2'}">selected</c:if>>구매수</option>
					</select>
				</div>
				<div class="d-flex">
			        <input class="form-control me-2" type="search" name="search" value="${pager.search}" placeholder="Search" aria-label="Search">
			        <button class="btn btn-outline-success" type="submit">Search</button>
		        </div>
	      	</form>
		</div>
		<div class="border border-2 rounded mb-5">
			<div>
				<c:forEach items="${productDTOs}" var="productDTO">
					<div class="row border border-2 rounded m-3">
						<div class="col-2 d-flex justify-content-center align-items-center">
							<img class="productImg" src="../resources/upload/product/${productDTO.productFileDTO.fileName}">
						</div>
						<div class="col-4 d-flex flex-column justify-content-center border-end my-4">
							<div>
								<span class="fw-bold">${productDTO.roasteryName} </span>
								<span>${productDTO.name}</span>
							</div>
							<div>
								<span>상품가격 : ${productDTO.price}원</span>
							</div>
						</div>
						<div class="col-2 text-center d-flex flex-column justify-content-center border-end my-4">
							<div class="fw-bold">등록일자</div>
							<div>${productDTO.regDate}</div>
						</div>
						<div class="col-1 text-center d-flex flex-column justify-content-center border-end my-4">
							<div class="fw-bold">구매수</div>
							<div>${productDTO.purchase}</div>
						</div>
						<div class="col-3 text-center d-flex flex-column justify-content-center my-3">
							<div class="mb-3">
								<form action="./update?num=${productDTO.num}" id="updateForm" method="post">
									<input type="hidden" name="num" value="${productDTO.num}">
									<button type="button" class="btn btn-secondary" id="updateBtn">상품수정하기</button>
								</form>
							</div>
							<div>
								<form action="./delete" method="post">
									<input type="hidden" name="num" value="${productDTO.num}">
									<button type="submit" class="btn btn-secondary">상품삭제하기</button>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
				<div class="d-flex justify-content-between align-items-center mx-3 my-4">
					<div>
						<a class="btn btn-secondary" href="./add">상품등록하기</a>
					</div>
					<nav>
					  <ul class="pagination mb-0 d-flex align-items-center">
					    
					    <c:if test="${pager.pre}">
						    <li class="page-item">
						      <a class="page-link" href="./myList?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
					    </c:if>
					    
					    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
					    	<li class="page-item"><a class="page-link" href="./myList?page=${i}&search=${pager.search}">${i}</a></li>
					    </c:forEach>
					    
					    <c:if test="${pager.next}">
						    <li class="page-item">
						      <a class="page-link" href="./myList?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
					    </c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="../resources/js/product/myList.js"></script>
	
	
</body>
</html>