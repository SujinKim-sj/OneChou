<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/member/generalMemberJoin.css">
	
	<title>OneChou - 관심원두 수정</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container my-5">
		<div class="text-center my-5">
			<h3>관심원두 수정</h3>
		</div>
		<form action="./update" method="post" id="updateForm">
			<input type="hidden" name="memberId" value="${member.id}">
			<div class="mx-5 mb-5">
				<ul class="list-group text-center">
					<li class="list-group-item"> 어떤 컵노트를 즐기시나요? (3개까지 고를 수 있어요) </li>
					<li class="list-group-item px-5 g-5" id="noteSelect">
						<input type="checkbox" class="btn-check" name="noteNames" value="chamomile" id="chamomile" autocomplete="off">
						<label class="btn btn-outline-success" for="chamomile">카모마일</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="jasmine" id="jasmine" autocomplete="off">
						<label class="btn btn-outline-success" for="jasmine">자스민</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="blackberry" id="blackberry" autocomplete="off">
						<label class="btn btn-outline-success" for="blackberry">블랙배리</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="raspberry" id="raspberry" autocomplete="off">
						<label class="btn btn-outline-success" for="raspberry">라즈베리</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="strawberry" id="strawberry" autocomplete="off">
						<label class="btn btn-outline-success" for="strawberry">딸기</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="raisin" id="raisin" autocomplete="off">
						<label class="btn btn-outline-success" for="raisin">건포도</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="prune" id="prune" autocomplete="off">
						<label class="btn btn-outline-success" for="prune">자두</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="coconut" id="coconut" autocomplete="off">
						<label class="btn btn-outline-success" for="coconut">코코넛</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="cherry" id="cherry" autocomplete="off">
						<label class="btn btn-outline-success" for="cherry">체리</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="pomegranate" id="pomegranate" autocomplete="off">
						<label class="btn btn-outline-success" for="pomegranate">석류</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="pineapple" id="pineapple" autocomplete="off">
						<label class="btn btn-outline-success" for="pineapple">파인애플</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="grape" id="grape" autocomplete="off">
						<label class="btn btn-outline-success" for="grape">포도</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="apple" id="apple" autocomplete="off">
						<label class="btn btn-outline-success" for="apple">사과</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="peach" id="peach" autocomplete="off">
						<label class="btn btn-outline-success" for="peach">복숭아</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="pear" id="pear" autocomplete="off">
						<label class="btn btn-outline-success" for="pear">배</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="grapefruit" id="grapefruit" autocomplete="off">
						<label class="btn btn-outline-success" for="grapefruit">자몽</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="orange" id="orange" autocomplete="off">
						<label class="btn btn-outline-success" for="orange">오렌지</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="lemon" id="lemon" autocomplete="off">
						<label class="btn btn-outline-success" for="lemon">레몬</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="lime" id="lime" autocomplete="off">
						<label class="btn btn-outline-success" for="lime">라임</label>				
						<input type="checkbox" class="btn-check" name="noteNames" value="wine" id="wine" autocomplete="off">
						<label class="btn btn-outline-success" for="wine">와인</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="whiskey" id="whiskey" autocomplete="off">
						<label class="btn btn-outline-success" for="whiskey">위스키</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="herb" id="herb" autocomplete="off">
						<label class="btn btn-outline-success" for="herb">허브</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="cinnamon" id="cinnamon" autocomplete="off">
						<label class="btn btn-outline-success" for="cinnamon">시나몬</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="peanut" id="peanut" autocomplete="off">
						<label class="btn btn-outline-success" for="peanut">땅콩</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="hazelnut" id="hazelnut" autocomplete="off">
						<label class="btn btn-outline-success" for="hazelnut">헤이즐넛</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="almond" id="almond" autocomplete="off">
						<label class="btn btn-outline-success" for="almond">아몬드</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="milkchocolate" id="milkchocolate" autocomplete="off">
						<label class="btn btn-outline-success" for="milkchocolate">밀크초콜릿</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="darkchocolate" id="darkchocolate" autocomplete="off">
						<label class="btn btn-outline-success" for="darkchocolate">다크초콜릿</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="maple" id="maple" autocomplete="off">
						<label class="btn btn-outline-success" for="maple">메이플시럽</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="caramel" id="caramel" autocomplete="off">
						<label class="btn btn-outline-success" for="caramel">카라멜</label>
						<input type="checkbox" class="btn-check" name="noteNames" value="honey" id="honey" autocomplete="off">
						<label class="btn btn-outline-success" for="honey">꿀</label>
					</li>
				</ul>
				<ul class="list-group text-center mt-5">
					<li class="list-group-item"> 어떤 로스팅 포인트를 선호하세요? </li>
					<li class="list-group-item" id="roastingSection">
						<input type="radio" class="btn-check" name="roastingPoint" value="1" id="light" autocomplete="off">
						<label class="btn btn-outline-warning roastingRadio" for="light">라이트 로스트</label>			
						<input type="radio" class="btn-check" name="roastingPoint" value="2" id="medium" autocomplete="off">
						<label class="btn btn-outline-success roastingRadio" for="medium">미디엄 로스트</label>			
						<input type="radio" class="btn-check" name="roastingPoint" value="3" id="dark" autocomplete="off">
						<label class="btn btn-outline-secondary roastingRadio" for="dark">다크 로스트</label>			
					</li>
				</ul>
				<ul class="list-group text-center mt-5">
					<li class="list-group-item"> 전체적으로 어떤 커피를 주로 선호하세요? </li>
					<li class="list-group-item" id="flavorSection">
						<input type="radio" class="btn-check" name="flavor" value="1" id="acidity" autocomplete="off">
						<label class="btn btn-outline-warning flavorRadio" for="acidity">산미 위주의 상큼한 커피</label>			
						<input type="radio" class="btn-check" name="flavor" value="2" id="nutty" autocomplete="off">
						<label class="btn btn-outline-success flavorRadio" for="nutty">고소하면서 부드러운 커피</label>			
						<input type="radio" class="btn-check" name="flavor" value="3" id="sweet" autocomplete="off">
						<label class="btn btn-outline-secondary flavorRadio" for="sweet">묵직하면서 단맛이 잘 느껴지는 커피</label>					
					</li>
				</ul>
			</div>
			<div class="text-center">
				<button class="btn btn-outline-secondary" id="updateBtn" type="button">관심원두 수정하기</button>
			</div>
		</form>
		<script type="text/javascript" src="../resources/js/favorite/update.js"></script>
		
	</div>
	

</body>
</html>