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
	<div class="container my-5">
		<div class="text-center">
			<h3>일반회원 페이지</h3>
		</div>

			<div class="mt-5 text-end">
				<div class="my-2">
					<a class="link-secondary" href="../payment/list">내 결제내역 보기</a>
				</div>
				<div class="my-2">
					<a class="link-secondary" href="../cart/index">내 장바구니 보기</a>
				</div>
			</div>
		<div class="row border border-2 rounded-3 mt-3 p-4 g-5">
			<div class="col mt-0 px-5 d-flex flex-column">
				<c:import url="./commonInfo.jsp"></c:import>
			</div>
			<div class="col text-center px-5 mt-0">
				<div>
					<h5>내 관심원두</h5>
				</div>
				<div>
					<ul class="list-group my-2">
					  <li class="list-group-item fw-bold">컵노트</li>
					  <li class="list-group-item">
					  	<c:forEach items="${memberDTO.favoriteDTO.cupnoteDTOs}" var="cupnoteDTO" varStatus="state">
					  		${cupnoteDTO.noteName}<c:choose><c:when test="${state.last}"></c:when><c:otherwise>,</c:otherwise></c:choose>
					  	</c:forEach>
					  </li>
					</ul>
					<ul class="list-group my-2">
					  <li class="list-group-item fw-bold">로스팅포인트</li>
					  <li class="list-group-item">
					  	<c:choose>
					  		<c:when test="${memberDTO.favoriteDTO.roastingPoint == 1}">
					  			Light Roast
					  		</c:when>
					  		<c:when test="${memberDTO.favoriteDTO.roastingPoint == 2}">
					  			Medium Roast
					  		</c:when>
					  		<c:otherwise>
					  			Dart Roast
					  		</c:otherwise>
					  	</c:choose>
					  </li>
					</ul>
					<ul class="list-group my-2">
					  <li class="list-group-item fw-bold">향미</li>
					  <li class="list-group-item">
					  	<c:choose>
					  		<c:when test="${memberDTO.favoriteDTO.flavor == 1}">
					  			산미 위주의 상큼한 커피
					  		</c:when>
					  		<c:when test="${memberDTO.favoriteDTO.flavor == 2}">
					  			고소하면서 부드러운 커피
					  		</c:when>
					  		<c:otherwise>
					  			묵직하면서 단맛이 잘 느껴지는 커피
					  		</c:otherwise>
					  	</c:choose>
					  </li>
					</ul>
				</div>
				<div class="mt-3 text-end">
					<a href="../favorite/update" class="btn btn-outline-secondary">내 관심원두 수정하기</a>
				</div>
			</div>
		</div>
	</div>
	
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>