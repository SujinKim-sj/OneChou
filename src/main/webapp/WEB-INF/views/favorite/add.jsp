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

	<form action="" class="frm" id="frm" method="post" enctype="multipart/form-data">
 		
 		<h3>컵노트 선택</h3>
		<fieldset>
			<div>
				1번 컵노트
				 <select id='option1'>
					<option value='' selected>-- 선택 --</option>
					<c:import url="../template/select.jsp"></c:import>
				</select>
				2번 컵노트
				 <select id='option2'>
					<option value='' selected>-- 선택 --</option>
					<c:import url="../template/select.jsp"></c:import>
				</select>
				3번 컵노트
				 <select id='option3'>
					<option value='' selected>-- 선택 --</option>
					<c:import url="../template/select.jsp"></c:import>
				</select>
			</div>
			<input type="hidden" id="cupnote1">
			<input type="hidden" id="cupnote2">
			<input type="hidden" id="cupnote3">
			<input type="text" readonly name="noteName" id="cupnote">
		</fieldset>
	

		<h3>로스팅 포인트</h3>
		<fieldset>
			<div>
				<button type="button" id="light">Light</button>
				<button type="button" id="medium">Medium</button>
				<button type="button" id="dark">Dark</button>
			</div>
			<input type="text" readonly id="roastingPoint" name="roastingPoint">
		</fieldset>

		<h3>향미 선택</h3>
		<fieldset>
			<div>
				<button type="button" id="acidity">산미</button>
				<button type="button" id="nutty">고소함</button>
				<button type="button" id="deep">묵직함</button>
			</div>
			<input type="text" id="flavor" name="flavor">
		</fieldset>
		<input type="text" readonly name="memberId" id="memberId" value="${member.id}">
		<button type="button" id="btn">회원가입</button>
	</form>
	<script src="../resources/js/favorite/add.js"></script>
</body>
</html>