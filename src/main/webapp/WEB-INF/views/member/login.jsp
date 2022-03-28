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
<h1>Member Login Page</h1>
	
	<div>
		<form action="./login" method="post">

			<fieldset>
				<legend>ID</legend>
				<input type="text" name="id" value="${cookie.remember.value}">	
			</fieldset>
			
			<fieldset>
				<legend>Password</legend>
				<input type="password" name="pw">
			</fieldset>
		
			<fieldset>
				<legend>Remember Me</legend>
				<input type="checkbox" name="remember" id="rememberId" value="1">
			</fieldset>
			<button type="submit">LOGIN</button>			
			
		</form>
			<script src="../resources/js/member/login.js"></script>
	</div>
</body>
</html>