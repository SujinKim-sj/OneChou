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
		<div class="row my-5">
			<div class="col"></div>
			<div class="col-3 border-bottom border-dark">
				<h1 style="text-align: center;">마이 페이지</h1>
			</div>
			<div class="col"></div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col-4 justify-content-center align-items-center">
				<div class="border rounded">
					<div class="row">
						<div class="col"></div>
						<div class="col-9 my-3">
							<h1>내 정보</h1>
							<div class="border-bottom border-1 border-dark"
								style="width: 100%;"></div>
							<h3>ID</h3>
							<div><h3>${dto.id}</h3></div>
							<p>
							<h3>이름</h3>
							<h3>${dto.name}</h3>
							<p>
							<h3>별명</h3>
							<h3>${dto.nickname}</h3> 
							<p>
							<h3>이메일 주소</h3>
							<h3>${dto.email}</h3>
							<p>
							<h3>전화번호</h3>
							<h3>${dto.phone}</h3> 
							<input type="hidden" name="kind"
								value='${dto.kind}'>
							<p>
							<div>
								<c:if test="${member.kind eq 0}">
		회원 유형 : 관리자입니다. 
	</c:if>
								<c:if test="${member.kind eq 1}">
		회원 유형 : 로스터리 회원입니다. 
	</c:if>
								<c:if test="${member.kind eq 2}">
		회원 유형 : 일반 회원입니다. 
		<p>
										<a href="/shop/product/recomend">추천원두</a>
								</c:if>
								<p>
								<div></div>
								<button type="button" id="btn" class="btn btn-primary"
									onclick="update()">정보 수정하기</button>
							</div>
						</div>
						<div class="col"></div>
					</div>
				</div>
			</div>
			<div class="col-4">

				<c:if test="${member.kind eq 1}">
					<div class="border rounded">
						<div class="row">
							<div class="col"></div>
							<div class="col-10 my-3">
								<h1>로스터리 정보</h1>
								<div class="border-bottom border-1 border-dark"
									style="width: 100%;"></div>
								<p>
								<div>
									<img
										src="../resources/upload/roastery/${dto.roasteryDTO.roasteryFileDTO.fileName}"
										width="100%" height="300px">
								</div>
								<p></p>
								<p></p>
								<input type="text" readonly name="roasteryName"
									value="${dto.roasteryDTO.name}" class="form-control">
								<p>
								<p></p>
								<div style="height: 130px"></div>
								<button type="button" onclick="roasteryUpdate()"
									class="btn btn-primary">로스터리 정보 보기</button>
							</div>
							<div class="col"></div>
						</div>
					</div>

				</c:if>
				<c:if test="${member.kind eq 2}">
					<div class="border rounded">
						<h1>내 관심원두</h1>
						<div class="border-bottom border-1 border-dark"
							style="width: 100%;"></div>
						<p>
						<h3>컵노트</h3>
						<p>
						<div class="border">
							<c:forEach items="${dto.favoriteDTO.cupnoteDTOs}" var="f">
								<input type="text" name="noteName" readonly="readonly"
									class="border border-white text-warning" value="${f.noteName}">
							</c:forEach>
						</div>
						<p>
						<div class="border-bottom border-1 border-dark"
							style="width: 100%;"></div>
						<p>
						<h3>로스팅 포인트</h3>
						<p></p>
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
						<p>
						<div class="border-bottom border-2 border-dark"
							style="width: 100%;"></div>
						<p>
						<h3>향미</h3>
						<p></p>
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
						<div style="height: 130px"></div>
						<button type="button" onclick="beanUpdate()"
							class="btn btn-primary">원두 정보 수정하기</button>
					</div>
				</c:if>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<script type="text/javascript">
		function update() {
			location.href = "./updateCheck";
		}
		function beanUpdate() {
			location.href = "../favorite/update";
		}
		function roasteryUpdate() {
			location.href = "../roastery/detail";
		}
	</script>
</body>
</html>