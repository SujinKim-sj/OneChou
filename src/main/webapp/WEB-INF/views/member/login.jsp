<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container my-5" style="text-align: center;">
		<h1>Member Login Page</h1>

		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<div class="my-5 border border-2 rounded">

					<form action="./login" method="post" class="my-5">
						<input type="hidden" name="connectionPath" value="${connectionPath}">
						<div class="row">
							<div class="col"></div>
							<div class="col-8">
								<fieldset>
									<legend>아이디</legend>
									<input type="text" class="form-control my-3" name="id"
										value="${cookie.remember.value}">
								</fieldset>

								<fieldset>
									<legend>비밀번호</legend>
									<input type="password" class="form-control my-3" name="pw">
								</fieldset>
								<div>
								<fieldset class="text-end">
									아이디 기억하기
									<input type="checkbox" name="remember" id="rememberId"
										value="1">
								</fieldset>
								</div>
								<div class="d-flex justify-content-between align-items-end mt-4">	
									<span> 
										아직 회원이 아니신가요?
										<a href="./joinCheck">회원가입</a>
									</span>
									<span>					
										<button type="submit" class="btn btn-outline-primary">LOGIN</button>
									</span>
								</div>								
							</div>
							<div class="col"></div>
						</div>
					</form>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="../resources/js/member/login.js"></script>
</body>
</html>