<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="" id="frm">
		<input type="hidden" id="memberId" value="${member.id}">
		<h3>컵노트 선택</h3>
		<fieldset>
			<div>
				1번 컵노트
				 <select name='option'>
					<option value='' selected>-- 선택 --</option>
					<c:import url="../template/select.jsp"></c:import>
				</select>
				2번 컵노트
				 <select name='option'>
					<option value='' selected>-- 선택 --</option>
					<c:import url="../template/select.jsp"></c:import>
				</select>
				3번 컵노트
				 <select name='option'>
					<option value='' selected>-- 선택 --</option>
					<c:import url="../template/select.jsp"></c:import>
				</select>
			</div>
			<input type="text" readonly name="cupnote" id="option1" value="">
			<input type="text" readonly name="cupnote" id="option2" value="">
			<input type="text" readonly name="cupnote" id="option3" value="">
		</fieldset>

		<h3>로스팅 포인트</h3>
		<fieldset>
			<div>
				<button type="button" id="light">Light</button>
				<button type="button" id="medium">Medium</button>
				<button type="button" id="dark">Dark</button>
			</div>
			<input type="text" readonly id="roastingPoint" name="roastingPoint"
				value="">
		</fieldset>

		<h3>향미 선택</h3>
		<fieldset>
			<div>
				<button type="button" id="acidity">산미</button>
				<button type="button" id="nutty">고소함</button>
				<button type="button" id="deep">묵직함</button>
			</div>
			<input type="text" id="flavor" name="flavor" value="">
		</fieldset>
		<button type="button" id="btn">회원가입</button>
	</form>
	<script src="../resources/js/favorite/add.js"></script>
</body>
</html>