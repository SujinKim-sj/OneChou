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

					<form action="./login" method="post" class="my-5"
						style="text-align: center;">
						<div class="row">
							<div class="col"></div>
							<div class="col-8 ">
								<fieldset>
									<legend>ID</legend>
									<input type="text" class="form-control my-3" name="id"
										value="${cookie.remember.value}">
								</fieldset>

								<fieldset>
									<legend>Password</legend>
									<input type="password" class="form-control my-3" name="pw">
								</fieldset>
								<div>
								<fieldset style="text-align: right;">
									Remember Me
									<input type="checkbox" name="remember" id="rememberId"
										value="1">
								</fieldset>
								</div>
								<div style="height: 20px"></div>
								<div style="text-align: right;">
								아직 회원이 아니신가요? <a href="./joinCheck">회원가입</a>
								&nbsp; &nbsp; &nbsp; 
								<button type="submit" class="btn btn-primary my-3">LOGIN</button>
								</div>
								
							</div>
							<div class="col"></div>

						</div>
					</form>
					<script src="../resources/js/member/login.js"></script>
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
</body>
</html>