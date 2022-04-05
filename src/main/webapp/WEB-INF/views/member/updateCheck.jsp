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
	<div class="container my-5" style="height: 100%">
		<div class="row align-items-center">
			<div class="col"></div>
			<div class="col my-5">
				<form action="" id="frm" method="post">
					<div class="row">
						<div class="col-2"></div>
						<div class="col-8 border rounded my-5" style="text-align: center; width: 300px; height: 300px;">
							<div style="height: 40px"></div>
							<h1 style="text-align: center;">본인 확인</h1>
							<div style="height: 10px"></div>
							<div class="row">
							<div class="col"></div>
							<div class="col-10">
							<p></p>
								<input type="text" name="id" id="id" class="form-control" placeholder="id입력" >
							<div style="height: 10px"></div>
								<input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호 입력">
							<div style="height: 10px"></div>
							<p></p>
							</div>
							<div class="col"></div>
							</div>
								<button type="submit" id="btn" class="btn btn-primary">확인</button>
						</div>
					</div>
					<div class="col-2"></div>
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>
</body>
</html>