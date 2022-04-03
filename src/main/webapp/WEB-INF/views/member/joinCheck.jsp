<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/member/joinCheck.css">

<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import><body>
	<div class="container">
		<div class="text-center m-5">
			<h1>약관 동의가 필요합니다</h1>
		</div>
		<div class="rule">
			<div class="form-check d-flex align-items-center justify-content-start">
				<input class="form-check-input" type="checkbox" id="checkAll">
				<label class="form-check-label fw-bold fs-4 ms-2" for="checkAll">
					전체동의
				</label>
			</div>
		</div>
		<div id="rules">
			<div class="rule border border-2 rounded-3 my-4">
				<div class="form-check d-flex align-items-center mx-4 my-3">
				  <input class="form-check-input check" type="checkbox" id="check1">
				  <label class="form-check-label fw-bold fs-5 ms-2" for="check1">
				    이용 약관 (필수)
				  </label>
				</div>
				<div class="policy-text border border-2 rounded d-flex justify-content-center mx-4 mt-3 mb-5 p-3">
					<c:import url="../template/standardPolicy.jsp"></c:import>
				</div>
			</div>
			<div class="rule border border-2 rounded-3 my-4">
				<div class="form-check d-flex align-items-center mx-4 my-3">
				  <input class="form-check-input check" type="checkbox" id="check2">
				  <label class="form-check-label fw-bold fs-5 ms-2" for="check2">
				    개인정보 수집 및 이용 (필수)
				  </label>
				</div>
				<div class="policy-text border border-2 rounded d-flex justify-content-center mx-4 mt-3 mb-5 p-3">
					<c:import url="../template/privacyPolicy.jsp"></c:import>
				</div>
			</div>
			<div class="text-center my-5">
				<button class="btn btn-outline-secondary" id="btn">회원가입하러가기</button>
			</div>
		</div>
	</div>
	<script src="../resources/js/member/joinCheck.js"></script>
</body>
</html>