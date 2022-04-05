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
	<div class="container my-5" style="width: 75%">
		<div class="row">
			<div class="col"></div>
			<div class="col-6">
				<form action="" class="frm justify-content-center border rounded"
					method="post" id="updateForm" enctype="multipart/form-data">
					<div class="row">
						<div class="col"></div>
						<div class="col-8 my-3">
							<input type="hidden" name="num" value="${roastery.num}">
							<input type="hidden" name="memberId" value="${member.id}">
							<fieldset>
								<legend>로스터리 이름</legend>
								<input type="text" class="roastery form-control" name="name"
									id="inputRoasteryName" value="${roastery.name}"
									placeholder="로스터리명을 입력하세요.">
								<div id="roasteryNameFeedback"></div>
							</fieldset>
									<div style="height: 10px"></div>
							<fieldset>
								<legend>주소</legend>
								<input type="text" class="roastery form-control" readonly name="address"
									id="inputRoasteryAddress" value="${roastery.address}"
									placeholder="주소를 입력해주세요.">
									<div style="height: 10px"></div>
								<button type="button" class="btn btn-primary" onclick="getRoasteryAddress()">주소
									찾기</button>
								<div id="roasteryAddressFeedback"></div>
									<div style="height: 10px"></div>
								<input type="text" class="form-control"
									id="inputRoasteryDetailAddress">
								<div id="roasteryDetailAddressFeedback"></div>
								<input type="hidden" id="integratedRoasteryAddress"
									name="roasteryAddress">
							</fieldset>
									<div style="height: 10px"></div>
							<fieldset>
								<legend>설명</legend>
								<textarea rows="12%" cols="30%" name="info"
									class="roastery form-control" id="inputInfo"
									placeholder="설명을 작성해주세요.">${roastery.name}</textarea>
								<div id="infoFeedback"></div>
							</fieldset>
									<div style="height: 10px"></div>

							<fieldset>
								<legend>로스터리 이미지</legend>
								<input type="file" id="file" name="file" class="form-control"
									onchange="fileTypeCheck(this)"
									accept="image/gif, image/jpeg, image/png">
								<div id="imageFeedback"></div>
							</fieldset>
							<p></p>
							<button type="button" id="updateBtn" class="btn btn-primary">수정완료</button>
						</div>
						<div class="col"></div>
					</div>
				</form>
			</div>
			<div class="col"></div>
		</div>

	</div>
	<script type="text/javascript"
		src="../resources/js/member/roasteryMemberUpdate.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>