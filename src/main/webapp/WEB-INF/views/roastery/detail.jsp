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
	<div class="container my-5" style="width: 75%">
		<input type="hidden" name="num" value="${roastery.num}"> <input
			type="hidden" name="memberId" value="${member.id}">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<div class="align-self-center">
					<h1 class="border-bottom border-2 border-dark" style="width: 400px">로스터리
						상세 페이지</h1>
				</div>
			</div>
			<div class="col"></div>
		</div>
		<p>
		<div class="row">
		<div class="col-2"></div>
			<div class="border rounded col-4 justify-content-center">
				<img
					src="../resources/upload/roastery/${roastery.roasteryFileDTO.fileName}"
					class="my-3" style="width: 100%; height: 300px;">
			</div>
			<div class="col-4">
				<div class="border rounded row">
					<div class="col"></div>
					<div class="col-8 my-3">
						<fieldset>
							<legend>로스터리 이름</legend>
							<input type="text" class="roastery form-control"
								readonly="readonly" name="name" id="name"
								value="${roastery.name}">
							<p></p>
						</fieldset>
						<fieldset>
							<legend>주소</legend>
							<input type="text" class="roastery form-control"
								readonly="readonly" name="address" id="address"
								value="${roastery.address}">
							<p></p>
						</fieldset>
						<fieldset>
							<legend>설명</legend>
							<textarea rows="" cols="" name="info"
								style="width: 100%;" class="roastery form-control"
								readonly="readonly" id="info">${roastery.name}</textarea>
							<p></p>
						</fieldset>
						<p></p>
						<button type="button" class="btn btn-primary"
							onclick="roasteryUpdate()">로스터리 정보 수정</button>
					</div>
				<div class="col"></div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
	<script type="text/javascript">
		function roasteryUpdate() {
			location.href = "./update";
		}
	</script>
</body>
</html>