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
	<h1>본인 확인</h1>
	<form action="" id="frm" method="post">
	<div>
	<input type="text" name="id" id="id">
	</div>
	<div>
	<input type="password" name="pw" id="pw">
	</div>
	<button type="submit" id="btn">확인</button>
	</form>
</body>
</html>