<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<title>OneChou - 로스터리회원 페이지</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<div class="container my-5">
		<div class="text-center">
			<h3>로스터리회원 페이지</h3>
		</div>

		<div class="row border border-2 rounded-3 p-4 my-5 g-5">
			<div class="col-8 my-4 px-5 d-flex flex-column border-end">
				<c:import url="./commonInfo.jsp"></c:import>
			</div>
			<div class="col-4 d-flex justify-content-center align-items-center text-center px-5 mt-0">
				<div>
					<div class="my-4">
						<a class="btn btn-outline-secondary" href="../roastery/detail?num=${memberDTO.roasteryDTO.num}">로스터리 상세정보 보기</a>
					</div>
					<div class="my-4">
						<a class="btn btn-outline-secondary" href="../product/myList">로스터리 상품 목록보기</a>
					</div>
					<div class="my-4">
						<a class="btn btn-outline-secondary" href="../payment/shipmentList">주문이 들어온 상품보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>