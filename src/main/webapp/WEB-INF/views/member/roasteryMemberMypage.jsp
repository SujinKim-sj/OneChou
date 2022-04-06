<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/css_import.jsp"></c:import>
<style type="text/css">
label {
	margin: 10px;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container my-5 justify-content-center">

		<h1 style="text-align: center;">로스터리 회원 마이 페이지</h1>
		<c:import url="../template/commonMypage.jsp"></c:import>
		<div class="border rounded my-3" style="text-align: center;">
			<h1 class="my-3">로스터리 정보</h1>
			<div class="border-top border-1 border-dark my-3"
				style="height: 10px"></div>
			<img
				src="../resources/upload/roastery/${dto.roasteryDTO.roasteryFileDTO.fileName}"
				width="300px" height="300px">
			<h1>${dto.roasteryDTO.name}</h1>
			<a class="btn btn-primary" href="../roastery/update">로스터리 정보 수정하기</a>



		</div>
	</div>
			<c:import url="../template/footer.jsp"></c:import>

			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
</body>
</html>