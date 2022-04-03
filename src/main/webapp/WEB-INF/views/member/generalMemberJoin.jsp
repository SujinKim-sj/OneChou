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
		<div class="border border-2 rounded-3 my-5">
			<div class="text-center border-bottom border-2 p-4">
				<h3>기본정보입력</h3>
			</div>
			<div class="mb-5">
				<div class="row d-flex justify-content-center mx-3 mt-3 g-3">
					<div class="col-4">
					    <label for="inputId" class="form-label fw-bold">아이디</label>
					    <input type="text" class="form-control" id="inputId" placeholder="6글자 이상 입력, 영문 대소문자/숫자만 입력 가능합니다">
					</div>
					<div class="col-2 d-flex justify-content-end align-items-end">					
						<button type="button" class="btn btn-outline-secondary" id="idDuplicateBtn">중복검사</button>
					</div>
				</div>
				<div class="row d-flex justify-content-center mb-3 px-4">
					<div class="col-6 fs-6 text-danger" id="idFeedback">
					</div>
				</div>
				
				<div class="row d-flex justify-content-center m-3 g-3">
					<div class="col-6">
					    <label for="inputPw" class="form-label fw-bold">비밀번호</label>
					    <input type="password" class="form-control" id="inputPw" placeholder="8글자 이상 입력해주세요">
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
					    <input type="text" class="form-control" id="inputName" placeholder="이름을 입력해주세요">
					    <div class="fs-6 text-danger" id="nameFeedback">
					    </div>
					</div>				
				</div>
				<div class="row d-flex justify-content-center m-3 g-3">	
					<div class="col-4">
					    <label for="inputNickname" class="form-label fw-bold">별명</label>
					    <input type="text" class="form-control" id="inputNickname" placeholder="별명을 입력해주세요">
					    <div class="fs-6 text-danger" id="nicknameFeedback">
					    </div>
					</div>	
					<div class="col-2 d-flex justify-content-end align-items-end">					
						<button type="button" class="btn btn-outline-secondary" id="idDuplicateBtn">중복검사</button>
					</div>
				</div>
				<div class="row d-flex justify-content-center m-3 g-3">
					<div class="col-4">
					    <label for="inputEmail" class="form-label fw-bold">이메일</label>
					    <input type="text" class="form-control" id="inputEmail" placeholder="이메일을 입력해주세요">
					    <div class="fs-6 text-danger" id="emailFeedback">
					    </div>
					</div>
					<div class="col-2 d-flex justify-content-end align-items-end">					
						<button type="button" class="btn btn-outline-secondary" id="idDuplicateBtn">중복검사</button>
					</div>
				</div>
				<div class="row d-flex justify-content-center m-3 g-3">			
					<div class="col-4">
					    <label for="inputPhone" class="form-label fw-bold">전화번호</label>
					    <input type="text" class="form-control" id="inputPhone" placeholder="전화번호를 입력해주세요">
					    <div class="fs-6 text-danger" id="phoneFeedback">
					    </div>
					</div>
					<div class="col-2 d-flex justify-content-end align-items-end">					
						<button type="button" class="btn btn-outline-secondary" id="idDuplicateBtn">중복검사</button>
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
		</div>
	
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="../resources/js/member/generalMemberJoin.js"></script>
</body>
</html>