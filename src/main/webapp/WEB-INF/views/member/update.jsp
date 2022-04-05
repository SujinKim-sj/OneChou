<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<div class="container my-5">
		<div class="border border-2 rounded-3 m-5">
			<div class="text-center border-bottom border-2 p-4">
				<h3>기본정보를 수정해주세요</h3>
			</div>
			<form action="./update" method="post" id="updateForm">
			<input type="hidden" name="id" value="${memberDTO.id}">
			<div class="mb-5">
				
				<div class="row d-flex justify-content-center m-3 g-3">
					<div class="col-6">
					    <label for="inputPw" class="form-label fw-bold">비밀번호</label>
					    <input type="password" class="form-control" id="inputPw" name="pw" placeholder="8글자 이상 입력해주세요">
					    <div class="fs-6 text-danger" id="pwFeedback">
					    </div>
					</div>
				</div>
				
				<div class="row d-flex justify-content-center m-3 g-3">					
					<div class="col-6">
					    <label for="inputPwCheck" class="form-label fw-bold">비밀번호확인</label>
					    <input type="password" class="form-control" id="inputPwCheck" placeholder="비밀번호를 한번 더 입력해주세요">
					    <div class="fs-6 text-danger" id="pwCheckFeedback">
					    </div>
					</div>					
				</div>
				
				<div class="row d-flex justify-content-center m-3 g-3">
					<div class="col-6">
					    <label for="inputName" class="form-label fw-bold">이름</label>
					    <input type="text" class="form-control" id="inputName" name="name" value="${memberDTO.name}" placeholder="이름을 입력해주세요">
					    <div class="fs-6 text-danger" id="nameFeedback">
					    </div>
					</div>				
				</div>
				
				<div class="row d-flex justify-content-center mx-3 mt-3 g-3">
					<div class="col-6">
					    <label for="inputNickname" class="form-label fw-bold">별명</label>
					    <input type="text" class="form-control" id="inputNickname" name="nickname" value="${memberDTO.nickname}" placeholder="별명을 입력해주세요">
						<div class="fs-6 text-danger" id="nicknameFeedback">
						</div>
					</div>	
				</div>
				
				<div class="row d-flex justify-content-center mx-3 mt-3 g-3">
					<div class="col-6">
					    <label for="inputEmail" class="form-label fw-bold">이메일</label>
					    <input type="text" class="form-control" id="inputEmail" name="email" value="${memberDTO.email}" placeholder="id@site.com의 형식으로 입력해주세요">
						<div class="fs-6 text-danger" id="emailFeedback">
						</div>
					</div>
				</div>

				<div class="row d-flex justify-content-center mx-3 mt-3 g-3">		
					<div class="col-6">
					    <label for="inputPhone" class="form-label fw-bold">전화번호</label>
					    <input type="text" class="form-control" id="inputPhone" name="phone" value="${memberDTO.phone}" placeholder="숫자만 입력해주세요">
						<div class="fs-6 text-danger" id="phoneFeedback">
						</div>
					</div>
				</div>
				
				<div class="row d-flex justify-content-center mx-3 mt-3 g-3">
					<div class="col-4">
					    <label for="inputAddress" class="form-label fw-bold">주소</label>
					    <input type="text" class="form-control" id="inputAddress" placeholder="주소를 검색해주세요" readonly>
					</div>
					<div class="col-2 d-flex justify-content-end align-items-end">					
						<button type="button" class="btn btn-outline-secondary" id="addressSearchBtn" onclick="getAddress()">주소검색</button>
					</div>
				</div>
				<div class="row d-flex justify-content-center mb-3 px-4">
					<div class="col-6 fs-6 text-danger" id="addressFeedback">
					</div>
				</div>
				<div class="row d-flex justify-content-center m-3 g-3">
					<div class="col-6">
					    <label for="inputDetailAddress" class="form-label fw-bold">상세주소</label>
					    <input type="text" class="form-control" id="inputDetailAddress" placeholder="상세주소를 입력해주세요">
					    <div class="fs-6 text-danger" id="detailAddressFeedback">
					    </div>
					    <input type="hidden" id="integratedAddress" name="address">
					</div>
				</div>
			</div>
			</form>
		</div>
		<div class="text-center">
			<button class="btn btn-outline-secondary" id="updateBtn">수정하기</button>
		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>		
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script src="../resources/js/member/update.js"></script>
</body>
</html>