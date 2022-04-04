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
	<div class="container">
		<form action="./join" method="post" id="joinForm" enctype="multipart/form-data">
			<input type="hidden" name="kind" value="1">
			<c:import url="./commonInfoForm.jsp"></c:import>
			<div class="border border-2 rounded-3 m-5">
				<div class="text-center p-4 border-bottom border-2">
					<h3>로스터리 정보를 입력해주세요</h3>
				</div>
				<div class="mb-5">
					<div class="row d-flex justify-content-center mx-3 mt-3 g-3">
						<div class="col-3"></div>
						<div class="col-4">
						    <label for="inputRoasteryName" class="form-label fw-bold">로스터리 이름</label>
						    <input type="text" class="form-control" id="inputRoasteryName" name="roasteryName" placeholder="로스터리 이름을 입력해주세요">
					    </div>
					    <div class="col-2 d-flex justify-content-end align-items-end">					
							<button type="button" class="btn btn-outline-secondary" id="roasteryNameDuplicateBtn">중복검사</button>
						</div>
					    <div class="col-3 fs-6 d-flex justify-content-start align-items-end text-danger" id="roasteryNameDuplicateFeedback">
						</div>
					</div>
					<div class="row d-flex justify-content-center mb-3 px-4">
						<div class="col-6 fs-6 text-danger" id="roasteryNameFeedback">
						</div>
					</div>
					<div class="row d-flex justify-content-center m-3 g-3">
						<div class="col-6">
						    <label for="inputInfo" class="form-label fw-bold">로스터리 설명</label>
						    <textarea class="form-control" id="inputInfo" name="info" placeholder="자유롭게 로스터리를 설명해주세요" rows="10"></textarea>
						    <div class="fs-6 text-danger" id="infoFeedback">
						    </div>
						</div>				
					</div>
					<div class="row d-flex justify-content-center mx-3 mt-3 g-3">
						<div class="col-4">
						    <label for="inputRoasteryAddress" class="form-label fw-bold">로스터리 주소</label>
						    <input type="text" class="form-control" id="inputRoasteryAddress" placeholder="주소를 검색해주세요" readonly>
						</div>
						<div class="col-2 d-flex justify-content-end align-items-end">					
							<button type="button" class="btn btn-outline-secondary" id="roasteryAddressSearchBtn" onclick="getRoasteryAddress()">주소검색</button>
						</div>
					</div>
					<div class="row d-flex justify-content-center mb-3 px-4">
						<div class="col-6 fs-6 text-danger" id="roasteryAddressFeedback">
						</div>
					</div>
					<div class="row d-flex justify-content-center m-3 g-3">
						<div class="col-6">
						    <label for="inputRoasteryDetailAddress" class="form-label fw-bold">로스터리 상세주소</label>
						    <input type="text" class="form-control" id="inputRoasteryDetailAddress" placeholder="로스터리 상세주소를 입력해주세요">
						    <div class="fs-6 text-danger" id="roasteryDetailAddressFeedback">
						    </div>
						    <input type="hidden" id="integratedRoasteryAddress" name="roasteryAddress">
						</div>
					</div>
					<div class="row d-flex justify-content-center m-3 g-3">
						<div class="col-6">
						    <label for="inputImage" class="form-label fw-bold">로스터리 이미지</label>
						    <input type="file" class="form-control" id="inputImage" name="image" onchange="fileTypeCheck(this)" accept="image/gif, image/jpeg, image/png">
						    <div class="fs-6 text-danger" id="imageFeedback">
						    </div>
						</div>
					</div>		
				</div>
			</div>
		</form>
		<div class="text-center my-5">
			<button type="button" class="btn btn-outline-secondary" id="joinBtn">회원가입하기</button>
		</div>
	</div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript" src="../resources/js/member/commonInfoCheck.js"></script>
	<script type="text/javascript" src="../resources/js/member/roasteryMemberJoin.js"></script>
</body>
</html>