<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Join Page</h1>
	<form action="" class="frm" method="post" id="frm" enctype="multipart/form-data">
		<fieldset>
			<legend>id</legend>
			<input type="text" name="id" id="id">
			<div id="idResult"></div>
		</fieldset>
		<fieldset>
			<legend>password</legend>
			<input type="password" name="pw" id="pw" placeholder="8글자 이상 12글자 이하로 작성">
			<div id="pwResult"></div>
		</fieldset>
		<fieldset>
			<legend>password 확인</legend>
			<input type="password" name="pw2" id="pw2" placeholder="8글자 이상 12글자 이하로 작성">
			<div id="pw2Result"></div>
		</fieldset>
		<fieldset>
			<legend>name</legend>
			<input type="text" name="name" id="name">
		</fieldset>
		<fieldset>
			<legend>nickname</legend>
			<input type="text" name="nickname" id="nickname">
		</fieldset>
		<fieldset>
			<legend>email</legend>
			<input type="text" name="email" id="email">
		</fieldset>
		<fieldset>
			<legend>phone</legend>
			<input type="text" name="phone" id="phone">
		</fieldset>
		<fieldset>
			<legend>address</legend>
			<input type="text" name="address" id="address">
		</fieldset>
		<input type="hidden" name="kind" value="${kind}">
		
		<button id="btn" type="button">회원가입</button>
	</form>
	
	<script src="../resources/js/join.js"></script>
</body>
</html>