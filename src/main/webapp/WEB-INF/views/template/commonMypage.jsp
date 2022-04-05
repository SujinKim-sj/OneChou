<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container border border-2 rounded my-3" style="text-align: center;">
	<h1 class="my-3">내 정보</h1>
	<div class="border-bottom border-dark"></div>
	<div style="height: 10px"></div>
	<h3>ID</h3>
	<h3>${dto.id}</h3>
	<div style="height: 10px"></div>
	<h3>이름</h3>
	<h3>${dto.name}</h3>
	<div style="height: 10px"></div>
	
	<h3>별명</h3>
	<h3>${dto.nickname}</h3>
	<div style="height: 10px"></div>
	
	<h3>이메일 주소</h3>
	<h3>${dto.email}</h3>
	<div style="height: 10px"></div>
	
	<h3>전화번호</h3>
	<h3>${dto.phone}</h3>
	<div style="height: 10px"></div>
	<input type="hidden" name="kind" value='${dto.kind}'>
	<p></p>
	<div>
		<c:if test="${member.kind eq 2}">
		<p></p>
			<a href="/shop/product/recomend">추천원두</a>
		</c:if>
		<p></p>
		<div></div>
		<a class="btn btn-primary" href="./updateCheck">정보 수정하기</a>
		<div style="height: 10px"></div>
	</div>
</div>
