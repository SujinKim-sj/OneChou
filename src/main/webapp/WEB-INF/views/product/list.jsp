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
	<h1>Product List Page</h1>

	<div class="container">
		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-5">
			<c:forEach items="${productDTOs}" var="productDTO">
				<div class="col">
					<div class="card text-center">
						<img src="../resources/upload/product/${productDTO.productFileDTO.fileName}" class="card-img-top" alt="...">
						<div class="card-body">
						<!-- 로스터리 이름 들어가는게 좋아보임 -->
						<h5 class="card-title">${productDTO.name}</h5>
						<p class="card-text">price : ${productDTO.price}</p>
						<a href="./detail?num=${productDTO.num}" class="btn btn-secondary">상세정보보기</a>
						</div>
					</div>
				</div>	
			</c:forEach>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>