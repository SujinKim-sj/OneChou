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
		<div class="text-center m-5">
			<h3>어느 회원으로 가입하시겠습니까?</h3>
		</div>
		<div>
			<form action="./join" method="get" id="frm">
				<div class="row row-cols-2 d-flex justify-content-center">			
					<div class="col-5 border border-2 rounded-3 text-center mx-3">
						<div class="py-3 fw-bold fs-4">
							일반 회원
						</div>
						<ul class="list-group mx-3">
						  <li class="list-group-item">여러 로스터리의 원두들을 한 곳에서 구매 가능해요</li>
						  <li class="list-group-item">자신의 관심원두를 고를 수 있어요</li>
						  <li class="list-group-item">등록한 관심원두에 맞추어 원두를 추천해드려요</li>
						  <li class="list-group-item">각 원두별로 리뷰, 질문기능을 제공해요</li>
						</ul>
						<div class="my-5">
							<a class="btn btn-outline-secondary" href="./join?kind=2">일반 회원가입</a>
						</div>
					</div>
					<div class="col-5 border border-2 rounded-3 text-center mx-3">
						<div class="py-3 fw-bold fs-4">
							로스터리 회원
						</div>
						<ul class="list-group mx-3">
						  <li class="list-group-item">로스터리를 실제로 운영하는 회원만 가입 가능해요</li>
						  <li class="list-group-item">로스터리에서 판매하는 원두를 등록할 수 있어요</li>
						  <li class="list-group-item">결제가 완료된 상품을 조회할 수 있어요</li>
						  <li class="list-group-item">각 상품별로 배송처리를 할 수 있어요</li>
						</ul>
						<div class="my-5">
							<a class="btn btn-outline-secondary" href="./join?kind=1">로스터리 회원가입</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>