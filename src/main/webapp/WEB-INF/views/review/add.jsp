<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/review/add.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container">
		<div class="mt-5"> 
			<div class="text-center">
				<h3>리뷰작성 페이지</h3>
			</div>
			<div class="border border-2 rounded mx-3 my-5">
				<div class="text-center border-bottom border-2 py-3">
					<h3>상품 정보</h3>
				</div>
				<div class="row">
					<div class="col-3 d-flex justify-content-center align-items-center">
						<img class="productImg" src="../resources/upload/product/${productDTO.productFileDTO.fileName}">
					</div>
					<div class="col-6 d-flex align-items-center border-end my-3">
						<div>
							<div class="fw-bold">${productDTO.roasteryName}</div>
							<div>${productDTO.name}</div>
						</div>
					</div>
					<div class="col-3 d-flex align-items-center justify-content-center">
						<div>
							<div class="fw-bold">상품가격</div>
							<div>${productDTO.price}</div>
						</div>
					</div>
				</div>
			</div>
			<form action="./addResult" id="addForm" method="post">
				<input type="hidden" name="writer" value="${member.nickname}">
				<input type="hidden" name="memberId" value="${member.id}">
				<input type="hidden" name="productNum" value="${productDTO.num}">
				<div class="border border-2 rounded mx-3 my-5">
					<div class="text-center border-bottom border-2 py-3">
						<h3>리뷰 작성</h3>
					</div>
					<div class="row m-3 border border-2 rounded">
						<div class="col-3 my-3 border-end">
							<div id="myform" class="d-flex flex-column justify-content-center align-items-center">
								<div class="border rounded bg-secondary bg-opacity-25 py-2 px-4">별점 입력</div>
							    <fieldset>
							        <input class="rating" type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
							        <input class="rating" type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
							        <input class="rating" type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
							        <input class="rating" type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
							        <input class="rating" type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
							    </fieldset>
							</div>
						</div>
						<div class="col-9 my-3">
							<div class="input-group">
							  <span class="input-group-text bg-secondary bg-opacity-25">리뷰 내용 입력</span>
							  <textarea class="form-control" id="contents" name="contents"></textarea>
							</div>
						</div>					
						<div class="text-center mb-3">
							<button class="btn btn-secondary" type="button" id="regBtn">등록하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript" src="../resources/js/review/add.js"></script>
</body>
</html>