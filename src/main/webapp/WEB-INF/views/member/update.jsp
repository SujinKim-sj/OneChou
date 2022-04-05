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
	<div class="container my-5" style="width: 75%">
	<div class="row">
	<div class="col"></div>
			<div class="col border rounded">
			<div style="height: 30px;"></div>
				<h1 style="text-align: center;">회원 정보 수정</h1>
				<div class="border-bottom border-dark border-2"></div>
				<form action="" class="frm" method="post" id="frm"
					enctype="multipart/form-data">
					<div class="row">
						<div class="col"></div>
						<div class="col-8">
							<input type="hidden" name="id" id="id" value="${member.id}">
							<fieldset>
								<legend>password</legend>
								<input type="password" class="form-control" name="pw" id="pw" value="${member.pw}"
									placeholder="8글자 이상 12글자 이하로 작성">
								<div id="pwResult"></div>
							</fieldset>
							<fieldset>
								<legend>password 확인</legend>
								<input type="password" class="form-control" name="pw2" id="pw2" value="${member.pw}"
									placeholder="8글자 이상 12글자 이하로 작성">
								<div id="pw2Result"></div>
							</fieldset>
							<fieldset>
								<legend>name</legend>
								<input type="text" class="form-control" name="name" id="name" value="${member.name}"
									placeholder="이름">
							</fieldset>
							<fieldset>
								<legend>nickname</legend>
								<input type="text" class="form-control" name="nickname" id="nickname"
									value="${member.nickname}" placeholder="닉네임">
							</fieldset>
							<fieldset>
								<legend>email</legend>
								<input type="text" class="form-control" name="email" id="email"
									value="${member.email}" placeholder="이메일">
							</fieldset>
							<fieldset>
								<legend>phone</legend>
								<input type="text" class="form-control" name="phone" id="phone"
									value="${member.phone}" placeholder="전화번호">
							</fieldset>
							<fieldset>
								<legend>address</legend>
								<input type="text" class="form-control" name="address" id="address"
									value="${member.address}" placeholder="주소">
							</fieldset>
							<p></p>
							<button id="btn" type="button" class="btn btn-primary">수정완료</button>
							<div style="height: 30px;"></div>
						</div>
						<div class="col"></div>
					</div>
				</form>
			</div>
			<div class="col"></div>
	</div>
	</div>
	
	<script src="../resources/js/member/update.js"></script>
</body>
</html>