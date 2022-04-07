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
	<div class="container my-5">
		<div class="align-items-center">
			<form action="" id="frm" method="post">
				<div class="row d-flex justify-content-center">
					<div class="col-6 border border-2 rounded-3 p-5">
						<div class="text-center mb-5">
							<h3>본인 확인이 필요합니다</h3>
						</div>
						<div>
							<fieldset>
								<legend>아이디</legend>
								<input type="text" class="form-control my-3" name="id">
							</fieldset>
								<fieldset>
								<legend>비밀번호</legend>
								<input type="password" class="form-control my-3" name="pw">
							</fieldset>
						</div>
						<div class="text-end mt-4">
							<button type="submit" id="btn" class="btn btn-outline-primary">인증하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>