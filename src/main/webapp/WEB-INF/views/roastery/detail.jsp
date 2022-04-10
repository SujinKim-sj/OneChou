<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/roastery/detail.css">

	<title>OneChou - 로스터리정보</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container my-5" style="width: 75%">
		<div class="border border-2 rounded-3 bg-light my-5">
			<div class="text-center m-5">
				<h3>로스터리 정보</h3>
			</div>
			<div class="m-5 text-center">
				<div class="row d-flex justify-content-center">
					<div class="col-8">
						<img class="roasteryImg" src="../resources/upload/roastery/${roasteryDTO.roasteryFileDTO.fileName}">
					</div>
				</div>
				
				<div class="row d-flex justify-content-center mt-3">
					<div class="col-8">
						<div class="m-3">
							<div class="fw-bold">로스터리 이름</div>
							<div>${roasteryDTO.name}</div>
						</div>
						
						<div class="roasteryInfoDiv m-3">
							<div class="fw-bold">로스터리 설명</div>
							<div class="roasteryInfo border border-2 rounded-3">${roasteryDTO.info}</div>
						</div>
						
						<div class="m-3">
							<div class="fw-bold">로스터리 주소</div>
							<div>${roasteryDTO.address}</div>
						</div>						
					</div>
				</div>
			</div>
		</div>
		<c:if test="${member.id == roasteryDTO.memberId}">
			<form action="./update" method="post">
			<div class="text-center">
				<input type="hidden" name="num" value="${roasteryDTO.num}">
				<button class="btn btn-outline-secondary" type="submit">로스터리 정보 수정하기</button>
			</div>
			</form>
		</c:if>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>