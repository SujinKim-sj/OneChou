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
	<h1>My Page</h1>
	<h1>ID</h1>
	<input type="Text" readonly="readonly" value="${dto.id}">
	<h1>이름</h1>
	<input type="Text" readonly="readonly" value="${dto.name}">
	<h1>별명</h1>
	<input type="Text" readonly="readonly" value="${dto.nickname}">
	<h1>이메일 주소</h1>
	<input type="Text" readonly="readonly" value="${dto.email}">
	<h1>전화번호</h1>
	<input type="Text" readonly="readonly" value="${dto.phone}">
	<input type="hidden" name="kind" value='${dto.kind}'>
	<div>
		<button type="button" id="btn" onclick="update()">정보 수정하기</button>
	</div>
	<c:if test="${member.kind eq 0}">
		회원 유형 : 관리자입니다. 
	</c:if>
	<c:if test="${member.kind eq 1}">
		회원 유형 : 로스터리 회원입니다. 
		<div>
		<img src="../resources/upload/roastery/${dto.roasteryDTO.roasteryFileDTO.fileName}">
		</div>
		<input type="text" readonly name="roasteryName" value="${dto.roasteryDTO.name}">
		<button type="button" onclick="roasteryUpdate()" >로스터리 정보 보기</button>
		
	
	</c:if>
	<c:if test="${member.kind eq 2}">
		<a href="/shop/product/recomend">추천원두</a>
		회원 유형 : 일반 회원입니다. 
		<h1>컵노트</h1>
		<c:forEach items="${dto.favoriteDTO.cupnoteDTOs}" var="f">
			<input type="text" name="noteName" readonly="readonly"
				value="${f.noteName}">
		</c:forEach>
		<h1>로스팅 포인트</h1>
		<c:if test="${dto.favoriteDTO.roastingPoint==1}">
			<input type="text" name="roastingPoint" readonly="readonly"
				value="라이트 로스트" style="border: 0px; width: 300px;">
		</c:if>
		<c:if test="${dto.favoriteDTO.roastingPoint==2}">
			<input type="text" name="roastingPoint" readonly="readonly"
				value="미디엄 로스트" style="border: 0px; width: 300px;">
		</c:if>
		<c:if test="${dto.favoriteDTO.roastingPoint==3}">
			<input type="text" name="roastingPoint" readonly="readonly"
				value="다크 로스트" style="border: 0px; width: 300px;">
		</c:if>
		<h1>향미</h1>
		<c:if test="${dto.favoriteDTO.flavor==1}">
			<input type="text" name="flavor" readonly="readonly"
				value="산미 위주의 상큼한 커피" style="border: 0px; width: 300px;">
		</c:if>
		<c:if test="${dto.favoriteDTO.flavor==2}">
			<input type="text" name="flavor" readonly="readonly"
				value="고소하면서 부드러운 커피" style="border: 0px; width: 300px;">
		</c:if>
		<c:if test="${dto.favoriteDTO.flavor==3}">
			<input type="text" name="flavor" readonly="readonly"
				value="묵직하면서 단맛이 잘 느껴지는 커피" style="border: 0px; width: 300px;">
		</c:if>
		<button type="button" onclick="beanUpdate()">원두 정보 수정하기</button>
	</c:if>
	<script type="text/javascript">
		function update() {
			location.href = "./updateCheck";
		}
		function beanUpdate() {
			location.href = "../favorite/update";
		}
		function roasteryUpdate(){
			location.href = "../roastery/detail";
		}
	</script>
</body>
</html>