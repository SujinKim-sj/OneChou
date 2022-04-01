<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<div class="container">
		<div class="text-center">
			<h1> Favorite Update Page </h1>
		</div>
		<br>
		<form action="./update" method="post">
			<input type="hidden" name="memberId" value="${member.id}">

			
			<ul class="list-group text-center">
				<li class="list-group-item"> 어떤 컵노트를 즐기시나요? </li>
				
				<li class="list-group-item" id="noteSelect"> 
					<input type="checkbox" class="btn-check" name="noteNames" value="chamomile" id="chamomile" autocomplete="off">
					<label class="btn btn-outline-info" for="chamomile">카모마일</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="jasmine" id="jasmine" autocomplete="off">
					<label class="btn btn-outline-warning" for="jasmine">자스민</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="blackberry" id="blackberry" autocomplete="off">
					<label class="btn btn-outline-info" for="blackberry">블랙배리</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="raspberry" id="raspberry" autocomplete="off">
					<label class="btn btn-outline-warning" for="raspberry">라즈베리</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="strawberry" id="strawberry" autocomplete="off">
					<label class="btn btn-outline-info" for="strawberry">딸기</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="raisin" id="raisin" autocomplete="off">
					<label class="btn btn-outline-warning" for="raisin">건포도</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="prune" id="prune" autocomplete="off">
					<label class="btn btn-outline-info" for="prune">자두</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="coconut" id="coconut" autocomplete="off">
					<label class="btn btn-outline-warning" for="coconut">코코넛</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="cherry" id="cherry" autocomplete="off">
					<label class="btn btn-outline-info" for="cherry">체리</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="pomegranate" id="pomegranate" autocomplete="off">
					<label class="btn btn-outline-warning" for="pomegranate">석류</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="pineapple" id="pineapple" autocomplete="off">
					<label class="btn btn-outline-info" for="pineapple">파인애플</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="grape" id="grape" autocomplete="off">
					<label class="btn btn-outline-warning" for="grape">포도</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="apple" id="apple" autocomplete="off">
					<label class="btn btn-outline-info" for="apple">사과</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="peach" id="peach" autocomplete="off">
					<label class="btn btn-outline-warning" for="peach">복숭아</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="pear" id="pear" autocomplete="off">
					<label class="btn btn-outline-info" for="pear">배</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="grapefruit" id="grapefruit" autocomplete="off">
					<label class="btn btn-outline-warning" for="grapefruit">자몽</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="orange" id="orange" autocomplete="off">
					<label class="btn btn-outline-info" for="orange">오렌지</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="lemon" id="lemon" autocomplete="off">
					<label class="btn btn-outline-warning" for="lemon">레몬</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="lime" id="lime" autocomplete="off">
					<label class="btn btn-outline-info" for="lime">라임</label>				
					<input type="checkbox" class="btn-check" name="noteNames" value="wine" id="wine" autocomplete="off">
					<label class="btn btn-outline-warning" for="wine">와인</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="whiskey" id="whiskey" autocomplete="off">
					<label class="btn btn-outline-info" for="whiskey">위스키</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="herb" id="herb" autocomplete="off">
					<label class="btn btn-outline-warning" for="herb">허브</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="cinnamon" id="cinnamon" autocomplete="off">
					<label class="btn btn-outline-info" for="cinnamon">시나몬</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="peanut" id="peanut" autocomplete="off">
					<label class="btn btn-outline-warning" for="peanut">땅콩</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="hazelnut" id="hazelnut" autocomplete="off">
					<label class="btn btn-outline-info" for="hazelnut">헤이즐넛</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="almond" id="almond" autocomplete="off">
					<label class="btn btn-outline-warning" for="almond">아몬드</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="milkchocolate" id="milkchocolate" autocomplete="off">
					<label class="btn btn-outline-info" for="milkchocolate">밀크초콜릿</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="darkchocolate" id="darkchocolate" autocomplete="off">
					<label class="btn btn-outline-warning" for="darkchocolate">다크초콜릿</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="maple" id="maple" autocomplete="off">
					<label class="btn btn-outline-info" for="maple">메이플시럽</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="caramel" id="caramel" autocomplete="off">
					<label class="btn btn-outline-warning" for="caramel">카라멜</label>
					<input type="checkbox" class="btn-check" name="noteNames" value="honey" id="honey" autocomplete="off">
					<label class="btn btn-outline-info" for="honey">꿀</label>
				</li>
			</ul>
			<br>
			<ul class="list-group text-center">
				<li class="list-group-item"> 어떤 로스팅 포인트를 선호하세요? </li>
				<li class="list-group-item">
					<input type="radio" class="btn-check" name="roastingPoint" value="1" id="light" autocomplete="off">
					<label class="btn btn-outline-warning" for="light">라이트 로스트</label>			
					<input type="radio" class="btn-check" name="roastingPoint" value="2" id="medium" autocomplete="off">
					<label class="btn btn-outline-success" for="medium">미디엄 로스트</label>			
					<input type="radio" class="btn-check" name="roastingPoint" value="3" id="dark" autocomplete="off">
					<label class="btn btn-outline-secondary" for="dark">다크 로스트</label>			
				</li>
			</ul>
			<br>
			<ul class="list-group text-center">
				<li class="list-group-item"> 어떤 맛을 주로 선호하세요? </li>
				<li class="list-group-item">
					<input type="radio" class="btn-check" name="flavor" value="1" id="acidity" autocomplete="off">
					<label class="btn btn-outline-warning" for="acidity">산미 위주의 상큼한 커피</label>			
					<input type="radio" class="btn-check" name="flavor" value="2" id="nutty" autocomplete="off">
					<label class="btn btn-outline-success" for="nutty">고소하면서 부드러운 커피</label>			
					<input type="radio" class="btn-check" name="flavor" value="3" id="sweet" autocomplete="off">
					<label class="btn btn-outline-secondary" for="sweet">묵직하면서 단맛이 잘 느껴지는 커피</label>					
				</li>
			</ul>
			<br>
			<div class="text-center">
				<button class="btn btn-secondary" id="btn" type="submit">관심있는 커피로 등록하기</button>
			</div>
		</form>
		<script type="text/javascript" src="../resources/js/favorite/add.js"></script>
		
	</div>
	

</body>
</html>