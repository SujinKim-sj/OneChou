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
			<form action="" id="frm" method="post"
				class="border border-2 rounded">
				<div class="row">
				<div class="col"></div>
				<div class="col">
				<div class="rounded my-5" style="text-align: center; height: 300px;">
					<div style="height: 40px"></div>
					<h1 style="text-align: center;">본인 확인</h1>
					<div style="height: 10px"></div>
					<input type="text" name="id" id="id" class="form-control"
						placeholder="id입력">
					<div style="height: 10px"></div>
					<input type="password" name="pw" id="pw" class="form-control"
						placeholder="비밀번호 입력">
					<div style="height: 10px"></div>
					<p></p>

					<button type="submit" id="btn" class="btn btn-primary">확인</button>
				</div>
				</div>
				<div class="col"></div>
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