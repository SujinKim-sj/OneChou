<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>

    <div class="container">
        <form action="./add" enctype="multipart/form-data" method="post">
            <div class="text-center">
                <h3>상품 기본정보 입력</h3>
                <br>
                <div class="row">
                    <div class="col form-floating mb-3">
                        <input type="text" class="form-control" id="name" name="name" placeholder="상품명입력">
                        <label for="name">&nbsp;&nbsp;상품명입력</label>
                    </div>
                    <div class="col form-floating mb-3">
                        <input type="text" class="form-control" id="price" name="price" placeholder="상품가격입력">
                        <label for="price">&nbsp;&nbsp;상품가격입력</label>
                    </div>
                </div>
                <br>
                <div class="form-floating">
                    <textarea class="form-control" placeholder="상품설명을 입력해주세요." id="info" style="height: 200px" name="info"></textarea>
                    <label for="info">상품설명을 입력해주세요</label>
                </div>
                <br>
                <div class="input-group mb-3">
                    <input type="file" class="form-control" id="file" name="file">
                    <label class="input-group-text" for="files"> 상품 이미지 파일 등록 </label>
                </div>
            </div>
            <br>
            <div class="text-center">
                <h3>상품 옵션 추가</h3>
                <div class="row">
                    <div class="col form-floating mb-3">
                        <input type="text" class="form-control" id="optionnames" name="optionNames" placeholder="상품명입력">
                        <label for="name">&nbsp;&nbsp;옵션명입력</label>
                    </div>
                    <div class="col form-floating mb-3">
                        <input type="text" class="form-control" id="addprices" name="addPrices" placeholder="상품가격입력">
                        <label for="price">&nbsp;&nbsp;옵션가격입력</label>
                    </div>
                    <div class="col form-floating mb-3">
                        <input type="text" class="form-control" id="optionnames" name="optionNames" placeholder="상품명입력">
                        <label for="name">&nbsp;&nbsp;옵션명입력</label>
                    </div>
                    <div class="col form-floating mb-3">
                        <input type="text" class="form-control" id="addprices" name="addPrices" placeholder="상품가격입력">
                        <label for="price">&nbsp;&nbsp;옵션가격입력</label>
                    </div>
                </div>
                <!-- 나중에 JS로 추가하기 버튼 누르면 옵션 추가 생기는거 만들기 -->
                <button type="button" class="btn btn-secondary">추가하기</button>
            </div>
            <br>
            <div class="text-center">
                <h3>상품 특성 선택</h3>
                <br>
                <ul class="list-group text-center">
                    <li class="list-group-item"> <h5>해당 상품의 컵노트를 골라주세요</h5></li>
                    <li class="list-group-item">
                        <select class="form-select" name="noteNames">
                            <option selected>첫 번째 컵노트 선택</option>
                            <option value="chamomile">카모마일</option>
                            <option value="jasmine">자스민</option>
                            <option value="blackberry">블랙베리</option>
                            <option value="raspberry">라즈베리</option>
                            <option value="strawberry">딸기</option>
                            <option value="raisin">건포도</option>
                            <option value="prune">자두</option>
                            <option value="coconut">코코넛</option>
                            <option value="cherry">체리</option>
                            <option value="pomegranate">석류</option>
                            <option value="pineapple">파인애플</option>
                            <option value="grape">포도</option>
                            <option value="apple">사과</option>
                            <option value="peach">복숭아</option>
                            <option value="pear">배</option>
                            <option value="grapefruit">자몽</option>
                            <option value="orange">오렌지</option>
                            <option value="lemon">레몬</option>
                            <option value="lime">라임</option>
                            <option value="wine">와인</option>
                            <option value="whiskey">위스키</option>
                            <option value="herb">허브</option>
                            <option value="cinnamon">시나몬</option>
                            <option value="peanut">땅콩</option>
                            <option value="hazelnut">헤이즐넛</option>
                            <option value="almond">아몬드</option>
                            <option value="milkchocolate">밀크초콜릿</option>
                            <option value="darkchocolate">다크초콜릿</option>
                            <option value="maple">메이플시럽</option>
                            <option value="caramel">카라멜</option>
                            <option value="honey">꿀</option>
                        </select>
                    </li>
                    <li class="list-group-item">
                        <select class="form-select" name="noteNames">
                            <option selected>두 번째 컵노트 선택</option>
                            <option value="chamomile">카모마일</option>
                            <option value="jasmine">자스민</option>
                            <option value="blackberry">블랙베리</option>
                            <option value="raspberry">라즈베리</option>
                            <option value="strawberry">딸기</option>
                            <option value="raisin">건포도</option>
                            <option value="prune">자두</option>
                            <option value="coconut">코코넛</option>
                            <option value="cherry">체리</option>
                            <option value="pomegranate">석류</option>
                            <option value="pineapple">파인애플</option>
                            <option value="grape">포도</option>
                            <option value="apple">사과</option>
                            <option value="peach">복숭아</option>
                            <option value="pear">배</option>
                            <option value="grapefruit">자몽</option>
                            <option value="orange">오렌지</option>
                            <option value="lemon">레몬</option>
                            <option value="lime">라임</option>
                            <option value="wine">와인</option>
                            <option value="whiskey">위스키</option>
                            <option value="herb">허브</option>
                            <option value="cinnamon">시나몬</option>
                            <option value="peanut">땅콩</option>
                            <option value="hazelnut">헤이즐넛</option>
                            <option value="almond">아몬드</option>
                            <option value="milkchocolate">밀크초콜릿</option>
                            <option value="darkchocolate">다크초콜릿</option>
                            <option value="maple">메이플시럽</option>
                            <option value="caramel">카라멜</option>
                            <option value="honey">꿀</option>
                        </select>
                    </li>
                    <li class="list-group-item">
                        <select class="form-select" name="noteNames">
                            <option selected>세 번째 컵노트 선택</option>
                            <option value="chamomile">카모마일</option>
                            <option value="jasmine">자스민</option>
                            <option value="blackberry">블랙베리</option>
                            <option value="raspberry">라즈베리</option>
                            <option value="strawberry">딸기</option>
                            <option value="raisin">건포도</option>
                            <option value="prune">자두</option>
                            <option value="coconut">코코넛</option>
                            <option value="cherry">체리</option>
                            <option value="pomegranate">석류</option>
                            <option value="pineapple">파인애플</option>
                            <option value="grape">포도</option>
                            <option value="apple">사과</option>
                            <option value="peach">복숭아</option>
                            <option value="pear">배</option>
                            <option value="grapefruit">자몽</option>
                            <option value="orange">오렌지</option>
                            <option value="lemon">레몬</option>
                            <option value="lime">라임</option>
                            <option value="wine">와인</option>
                            <option value="whiskey">위스키</option>
                            <option value="herb">허브</option>
                            <option value="cinnamon">시나몬</option>
                            <option value="peanut">땅콩</option>
                            <option value="hazelnut">헤이즐넛</option>
                            <option value="almond">아몬드</option>
                            <option value="milkchocolate">밀크초콜릿</option>
                            <option value="darkchocolate">다크초콜릿</option>
                            <option value="maple">메이플시럽</option>
                            <option value="caramel">카라멜</option>
                            <option value="honey">꿀</option>
                        </select>
                    </li>
                    <li class="list-group-item">
                        <select class="form-select" name="noteNames">
                            <option selected>네 번째 컵노트 선택</option>
                            <option value="chamomile">카모마일</option>
                            <option value="jasmine">자스민</option>
                            <option value="blackberry">블랙베리</option>
                            <option value="raspberry">라즈베리</option>
                            <option value="strawberry">딸기</option>
                            <option value="raisin">건포도</option>
                            <option value="prune">자두</option>
                            <option value="coconut">코코넛</option>
                            <option value="cherry">체리</option>
                            <option value="pomegranate">석류</option>
                            <option value="pineapple">파인애플</option>
                            <option value="grape">포도</option>
                            <option value="apple">사과</option>
                            <option value="peach">복숭아</option>
                            <option value="pear">배</option>
                            <option value="grapefruit">자몽</option>
                            <option value="orange">오렌지</option>
                            <option value="lemon">레몬</option>
                            <option value="lime">라임</option>
                            <option value="wine">와인</option>
                            <option value="whiskey">위스키</option>
                            <option value="herb">허브</option>
                            <option value="cinnamon">시나몬</option>
                            <option value="peanut">땅콩</option>
                            <option value="hazelnut">헤이즐넛</option>
                            <option value="almond">아몬드</option>
                            <option value="milkchocolate">밀크초콜릿</option>
                            <option value="darkchocolate">다크초콜릿</option>
                            <option value="maple">메이플시럽</option>
                            <option value="caramel">카라멜</option>
                            <option value="honey">꿀</option>
                        </select>
                    </li>
                    <li class="list-group-item">
                        <select class="form-select" name="noteNames">
                            <option selected>다섯 번째 컵노트 선택</option>
                            <option value="chamomile">카모마일</option>
                            <option value="jasmine">자스민</option>
                            <option value="blackberry">블랙베리</option>
                            <option value="raspberry">라즈베리</option>
                            <option value="strawberry">딸기</option>
                            <option value="raisin">건포도</option>
                            <option value="prune">자두</option>
                            <option value="coconut">코코넛</option>
                            <option value="cherry">체리</option>
                            <option value="pomegranate">석류</option>
                            <option value="pineapple">파인애플</option>
                            <option value="grape">포도</option>
                            <option value="apple">사과</option>
                            <option value="peach">복숭아</option>
                            <option value="pear">배</option>
                            <option value="grapefruit">자몽</option>
                            <option value="orange">오렌지</option>
                            <option value="lemon">레몬</option>
                            <option value="lime">라임</option>
                            <option value="wine">와인</option>
                            <option value="whiskey">위스키</option>
                            <option value="herb">허브</option>
                            <option value="cinnamon">시나몬</option>
                            <option value="peanut">땅콩</option>
                            <option value="hazelnut">헤이즐넛</option>
                            <option value="almond">아몬드</option>
                            <option value="milkchocolate">밀크초콜릿</option>
                            <option value="darkchocolate">다크초콜릿</option>
                            <option value="maple">메이플시럽</option>
                            <option value="caramel">카라멜</option>
                            <option value="honey">꿀</option>
                        </select>
                    </li>
                </ul>
                <br>
                <br>
                <ul class="list-group text-center">
                    <li class="list-group-item"> <h5>해당 상품의 로스팅포인트를 골라주세요</h5></li>
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
                <br>
                <ul class="list-group text-center">
                    <li class="list-group-item"> <h5>해당 상품은 어느쪽에 가까운가요?</h5></li>
                    <li class="list-group-item">
                        <input type="radio" class="btn-check" name="flavor" value="1" id="acidity" autocomplete="off">
                        <label class="btn btn-outline-warning" for="acidity">산미 위주의 상큼한 커피</label>			
                        <input type="radio" class="btn-check" name="flavor" value="2" id="nutty" autocomplete="off">
                        <label class="btn btn-outline-success" for="nutty">고소하면서 부드러운 커피</label>			
                        <input type="radio" class="btn-check" name="flavor" value="3" id="sweet" autocomplete="off">
                        <label class="btn btn-outline-secondary" for="sweet">묵직하면서 단맛이 잘 느껴지는 커피</label>					
                    </li>
                </ul>
            </div>
            <br>
            <div class="text-center">
            <button type="submit" class="btn btn-secondary">등록하기</button>
            </div>
        </form>
    </div>



</body>
</html>