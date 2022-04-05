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

		<h1 style="text-align: center;">일반 회원 마이 페이지</h1>
		<c:import url="../template/commonMypage.jsp"></c:import>

			<div class="border rounded" style="text-align: center;">
				<h1>내 관심원두</h1>
				<div class="border-bottom border-1 border-dark"></div>
				<p>
				<h3>컵노트</h3>
				<p></p>
			<div class="row">
			<div class="col"></div>
				<div class="col">
					<div class="justify-content-center">
						<c:forEach items="${dto.favoriteDTO.cupnoteDTOs}" var="f">
							<input type="text" name="noteName" readonly="readonly" style="text-align: center;"
								class="border border-warning text-warning" value="${f.noteName}">
						</c:forEach>
					</div>
				</div>
				<div class="col"></div>
			</div>
			<p>
				<div class="border-bottom border-1 border-dark" style="width: 100%;"></div>
				<p>
				<h3>로스팅 포인트</h3>
				<p></p>
				<c:if test="${dto.favoriteDTO.roastingPoint==1}">
					<input type="text" name="roastingPoint" readonly="readonly"
						value="라이트 로스트" style="border: 0px; width: 300px; text-align: center;">

				</c:if>
				<c:if test="${dto.favoriteDTO.roastingPoint==2}">
					<input type="text" name="roastingPoint" readonly="readonly"
						value="미디엄 로스트" style="border: 0px; width: 300px; text-align: center;">
				</c:if>
				<c:if test="${dto.favoriteDTO.roastingPoint==3}">
					<input type="text" name="roastingPoint" readonly="readonly"
						value="다크 로스트" style="border: 0px; width: 300px; text-align: center;">

				</c:if>
				<p>
				<div class="border-bottom border-2 border-dark" style="width: 100%;"></div>
				<p>
				<h3>향미</h3>
				<p></p>
				<c:if test="${dto.favoriteDTO.flavor==1}">
					<input type="text" name="flavor" readonly="readonly"
						value="산미 위주의 상큼한 커피" style="border: 0px; width: 300px; text-align: center;">
				</c:if>
				<c:if test="${dto.favoriteDTO.flavor==2}">
					<input type="text" name="flavor" readonly="readonly"
						value="고소하면서 부드러운 커피" style="border: 0px; width: 300px; text-align: center;">
				</c:if>
				<c:if test="${dto.favoriteDTO.flavor==3}">
					<input type="text" name="flavor" readonly="readonly"
						value="묵직하면서 단맛이 잘 느껴지는 커피" style="border: 0px; width: 300px; text-align: center;">
				</c:if>
				<div style="height: 10px"></div>
				<a class="btn btn-primary" href="../favorite/update">원두 정보 수정하기</a> 
				<div style="height: 10px"></div>
				<div style="height: 10px"></div>
			</div>
	</div>
</body>
</html>