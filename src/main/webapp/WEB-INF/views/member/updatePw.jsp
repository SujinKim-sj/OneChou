<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	
	<title>OneChou - 비밀번호 수정</title>
</head>
<body>
	
	<c:import url="../template/header.jsp"></c:import>
	<div class="container my-5">
		<div class="align-items-center">
			<form action="./updatePw" id="updateForm" method="post">
			<input type="hidden" name="id" value="${member.id}">
				<div class="row d-flex justify-content-center m-3 g-3">
					<div class="col-6 border border-2 rounded-3 p-5">
						<div class="text-center mb-5">
							<h3>비밀번호 수정</h3>
						</div>
						<div class="my-3">
						    <label for="inputPw" class="form-label fw-bold">비밀번호</label>
						    <input type="password" class="form-control" id="inputPw" name="pw" placeholder="8글자 이상 입력해주세요">
						    <div class="fs-6 text-danger" id="pwFeedback">
						    </div>
						</div>
						
						<div class="my-3">
						    <label for="inputPwCheck" class="form-label fw-bold">비밀번호확인</label>
						    <input type="password" class="form-control" id="inputPwCheck" placeholder="비밀번호를 한번 더 입력해주세요">
						    <div class="fs-6 text-danger" id="pwCheckFeedback">
						    </div>
					    </div>
					    
					    <div class="text-end mt-5">
					    	<button class="btn btn-outline-primary" type="button" id="updateBtn">수정하기</button>
					    </div>
					</div>					
				</div>
			</form>
		</div>
	</div>
	
	<c:import url="../template/footer.jsp"></c:import>

	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	
	<script src="../resources/js/member/updatePw.js"></script>
</body>
</html>