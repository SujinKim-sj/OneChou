<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<c:import url="../template/css_import.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container mt-5">
		<div class="row border border-2 rounded mt-5 mb-5">
			<div class="pt-3 mb-3 border-bottom bg-success p-2 text-dark bg-opacity-10">
				<p class="text-center fs-2">질문답변페이지</p>
			</div>
			<div class="mt-3 mb-3">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">작성자</th>
							<th colspan="5" style="width:50%" scope="col">질문 내용</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${qnaDTO.writer}</th>
							<td colspan="5" style="width:50%">${qnaDTO.contents}</td>
							<td>${qnaDTO.regDate}</td>
						</tr>
						<tr>
							<td colspan="7">
								<div class="mt-3 mb-3">
									<form action="./reply" method="post">
										<input type="hidden" name="productNum" value="${qnaDTO.productNum}">
										<input type="hidden" name="num" value="${qnaDTO.num}">
										<!-- 나중에 로그인 기능 되면 <input type="hidden" name="writer" value="${member.nickname}">
										<input type="hidden" name="memberId" value="${member.id}"> -->
										<div class="input-group">
											<span class="input-group-text">답변 입력</span>
											<textarea class="form-control" name="contents"></textarea>
											<button type="submit" class="btn btn-secondary text-center">답변달기</button>
										</div>
									</form>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</body>
</html>