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
	
	<div class="container">
		<div class="text-center my-5">
			<h3>내 상품정보 리스트 페이지</h3>
		</div>
		<div class="border border-2 rounded">
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
					<div class="col-3 text-center d-flex flex-column justify-content-center border-end my-3">
						<div><a href="./update?num=${productDTO.num}" class="btn btn-secondary my-2">상품수정하기</a></div>
						<div><a href="./detail?num=${productDTO.num}" class="btn btn-secondary my-2">상품삭제하기</a></div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
</body>
</html>