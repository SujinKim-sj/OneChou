<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<c:import url="../template/css_import.jsp"></c:import>
	<link rel="stylesheet" type="text/css" href="../resources/css/product/update.css">
	<title>OneChou - 상품수정</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<div class="container my-5">
        <form action="./updateResult" id="frm" enctype="multipart/form-data" method="post">
	        <input type="hidden" name="roasteryName" value="${productDTO.roasteryName}">
	        <input type="hidden" name="roasteryNum" value="${productDTO.roasteryNum}">
	        <input type="hidden" name="purchase" value="${productDTO.purchase}">            
	        <input type="hidden" name="regDate" value="${productDTO.regDate}">
	        <input type="hidden" name="num" value="${productDTO.num}">            
            <div class="border border-2 rounded">
                <div class="border-bottom border-2 text-center pt-3 pb-3">
                    <h3>상품 기본정보 수정</h3>
                </div>
                <div class="row">
                    <div class="col form-floating m-3">
                        <input type="text" class="form-control" id="name" name="name" placeholder="상품명입력" value="${productDTO.name}">
                        <label for="name">&nbsp;&nbsp;상품명입력</label>
                    </div>
                    <div class="col form-floating m-3">
                        <input type="number" class="form-control" id="price" name="price" placeholder="상품가격입력" value="${productDTO.price}">
                        <label for="price">&nbsp;&nbsp;상품가격입력</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col form-floating m-3">
                        <input type="number" class="form-control" id="deliveryFee" name="deliveryFee" placeholder="배송비입력" value="${productDTO.deliveryFee}">
                        <label for="price">&nbsp;&nbsp;배송비입력</label>
                    </div>
                    <div class="col form-floating m-3">
                        <input type="number" class="form-control" id="freeDelivery" name="freeDelivery" placeholder="무료배송 기준금액 입력" value="${productDTO.freeDelivery}">
                        <label for="price">&nbsp;&nbsp;무료배송 기준금액 입력 (0원 입력시 무료배송 없음)</label>
                    </div>
                </div>
                <div class="form-floating m-3">
                    <textarea class="form-control" placeholder="상품설명을 입력해주세요." id="info" style="height: 200px" name="info">${productDTO.info}</textarea>
                    <label for="info">상품설명을 입력해주세요</label>
                </div>
                <!-- 변경버튼 누르면 input태그들 사라짐, file선택하는 input태그 생성 -->
                <div id="productImageDiv">
                    <div id="originalImage" class="d-flex justify-content-between align-items-end m-3">
                        <input type="hidden" name="fileName" value="${productDTO.productFileDTO.fileName}">
                        <input type="hidden" name="oriName" value="${productDTO.productFileDTO.oriName}">                	
                        <div class="d-flex align-items-end">
	                        <img class="productImg" src="../resources/upload/product/${productDTO.productFileDTO.fileName}">
	                        <span class="mb-3">${productDTO.productFileDTO.oriName}</span>
                        </div>                
                        <span class="mb-2"><button type="button" class="btn btn-secondary" id="changeImageBtn">상품이미지 변경하기</button></span>
                    </div>
                    <!-- 변경버튼을 누르면 위 코드가 삭제되고 아래 코드가 생성됨 
                        <div class="input-group p-3">
                        <input type="file" class="form-control" id="file" name="file">
                        <label class="input-group-text" for="file"> 로스터리 이미지 파일 등록 </label>
                    </div> -->
                </div>
            </div>
            <div class="border border-2 rounded mt-5">
                <div class="text-center pt-3 pb-3 border-bottom border-2">
                    <h3>상품 옵션 수정</h3>
                </div>
                <div id="optionsDiv">
				<c:forEach items="${productDTO.productOptionDTOs}" var="productOptionDTO">
					<c:choose>
						<c:when test="${productOptionDTO.optionName == '기본옵션'}">
							<input type="hidden" name="optionNames" value="기본옵션">
							<input type="hidden" name="addPrices" value="0">							
						</c:when>
						<c:otherwise>
							<div class="row mx-3" id="originalOption${productOptionDTO.num}">
								<div class="col form-floating mt-3 mb-3">
									<input class="form-control optionName" type="text" name="optionNames" placeholder="옵션명입력" value="${productOptionDTO.optionName}">
									<label>&nbsp;&nbsp;옵션명입력</label>
								</div>
								<div class="col form-floating mt-3 mb-3">
									<input class="form-control optionPrice" type="number" name="addPrices" placeholder="옵션가격입력" value="${productOptionDTO.addPrice}">
									<label>&nbsp;&nbsp;옵션가격입력</label>
								</div>
								<div class="col col-2 d-flex align-items-center justify-content-center">
									<button type="button" data-num="${productOptionDTO.num}" class="btn btn-secondary originalDel">옵션지우기</button>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				</div>
                <div class="text-center mb-3">
                    <button type="button" id="addBtn" class="btn btn-secondary">추가하기</button>
                </div>
            </div>
            <div class="border border-2 rounded mt-5">
                <div class="border-bottom border-2 pt-3 pb-3 text-center">
                    <h3>상품 특성 수정</h3>
                </div>
                <ul class="list-group text-center m-5">
                    <li class="list-group-item"> <h5>해당 상품의 컵노트를 골라주세요</h5></li>
                    <c:forEach items="${productDTO.productFeatureDTO.productCupnoteDTOs}" var="productCupnoteDTO" varStatus="state">
	                    <li class="list-group-item">
	                        <select class="form-select" id="cupnote${state.index+1}" name="noteNames">
	                            <option value="no">${state.index+1} 번 컵노트 선택</option>
	                            <option value="chamomile" <c:if test="${productCupnoteDTO.noteName == 'chamomile'}">selected</c:if>>카모마일</option>
	                            <option value="jasmine" <c:if test="${productCupnoteDTO.noteName == 'jasmine'}">selected</c:if>>자스민</option>
	                            <option value="blackberry" <c:if test="${productCupnoteDTO.noteName == 'blackberry'}">selected</c:if>>블랙베리</option>
	                            <option value="raspberry" <c:if test="${productCupnoteDTO.noteName == 'raspberry'}">selected</c:if>>라즈베리</option>
	                            <option value="strawberry" <c:if test="${productCupnoteDTO.noteName == 'strawberry'}">selected</c:if>>딸기</option>
	                            <option value="raisin" <c:if test="${productCupnoteDTO.noteName == 'raisin'}">selected</c:if>>건포도</option>
	                            <option value="prune" <c:if test="${productCupnoteDTO.noteName == 'prune'}">selected</c:if>>자두</option>
	                            <option value="coconut" <c:if test="${productCupnoteDTO.noteName == 'coconut'}">selected</c:if>>코코넛</option>
	                            <option value="cherry" <c:if test="${productCupnoteDTO.noteName == 'cherry'}">selected</c:if>>체리</option>
	                            <option value="pomegranate" <c:if test="${productCupnoteDTO.noteName == 'pomegranate'}">selected</c:if>>석류</option>
	                            <option value="pineapple" <c:if test="${productCupnoteDTO.noteName == 'pineapple'}">selected</c:if>>파인애플</option>
	                            <option value="grape" <c:if test="${productCupnoteDTO.noteName == 'grape'}">selected</c:if>>포도</option>
	                            <option value="apple" <c:if test="${productCupnoteDTO.noteName == 'apple'}">selected</c:if>>사과</option>
	                            <option value="peach" <c:if test="${productCupnoteDTO.noteName == 'peach'}">selected</c:if>>복숭아</option>
	                            <option value="pear" <c:if test="${productCupnoteDTO.noteName == 'pear'}">selected</c:if>>배</option>
	                            <option value="grapefruit" <c:if test="${productCupnoteDTO.noteName == 'grapefruit'}">selected</c:if>>자몽</option>
	                            <option value="orange" <c:if test="${productCupnoteDTO.noteName == 'orange'}">selected</c:if>>오렌지</option>
	                            <option value="lemon" <c:if test="${productCupnoteDTO.noteName == 'lemon'}">selected</c:if>>레몬</option>
	                            <option value="lime" <c:if test="${productCupnoteDTO.noteName == 'lime'}">selected</c:if>>라임</option>
	                            <option value="wine" <c:if test="${productCupnoteDTO.noteName == 'wine'}">selected</c:if>>와인</option>
	                            <option value="whiskey" <c:if test="${productCupnoteDTO.noteName == 'whiskey'}">selected</c:if>>위스키</option>
	                            <option value="herb" <c:if test="${productCupnoteDTO.noteName == 'herb'}">selected</c:if>>허브</option>
	                            <option value="cinnamon" <c:if test="${productCupnoteDTO.noteName == 'cinnamon'}">selected</c:if>>시나몬</option>
	                            <option value="peanut" <c:if test="${productCupnoteDTO.noteName == 'peanut'}">selected</c:if>>땅콩</option>
	                            <option value="hazelnut" <c:if test="${productCupnoteDTO.noteName == 'hazelnut'}">selected</c:if>>헤이즐넛</option>
	                            <option value="almond" <c:if test="${productCupnoteDTO.noteName == 'almond'}">selected</c:if>>아몬드</option>
	                            <option value="milkchocolate" <c:if test="${productCupnoteDTO.noteName == 'milkchocolate'}">selected</c:if>>밀크초콜릿</option>
	                            <option value="darkchocolate" <c:if test="${productCupnoteDTO.noteName == 'darkchocolate'}">selected</c:if>>다크초콜릿</option>
	                            <option value="maple" <c:if test="${productCupnoteDTO.noteName == 'maple'}">selected</c:if>>메이플시럽</option>
	                            <option value="caramel" <c:if test="${productCupnoteDTO.noteName == 'caramel'}">selected</c:if>>카라멜</option>
	                            <option value="honey" <c:if test="${productCupnoteDTO.noteName == 'honey'}">selected</c:if>>꿀</option>
	                        </select>
	                    </li>
                    </c:forEach>
                </ul>
                <ul class="list-group text-center m-5">
                    <li class="list-group-item"><h5>해당 상품의 로스팅포인트를 골라주세요</h5></li>
                    <li class="list-group-item">
                        <input type="radio" class="btn-check roasting" name="roastingPoint" value="1" id="light" autocomplete="off" <c:if test="${productDTO.productFeatureDTO.roastingPoint == 1}">checked="checked"</c:if>>
                        <label class="btn btn-outline-warning" for="light">라이트 로스트</label>			
                        <input type="radio" class="btn-check roasting" name="roastingPoint" value="2" id="medium" autocomplete="off" <c:if test="${productDTO.productFeatureDTO.roastingPoint == 2}">checked="checked"</c:if>>
                        <label class="btn btn-outline-success" for="medium">미디엄 로스트</label>			
                        <input type="radio" class="btn-check roasting" name="roastingPoint" value="3" id="dark" autocomplete="off" <c:if test="${productDTO.productFeatureDTO.roastingPoint == 3}">checked="checked"</c:if>>
                        <label class="btn btn-outline-secondary" for="dark">다크 로스트</label>			
                    </li>
                </ul>
                <ul class="list-group text-center m-5">
                    <li class="list-group-item"><h5>해당 상품은 어느쪽에 가까운가요?</h5></li>
                    <li class="list-group-item">
                        <input type="radio" class="btn-check flavor" name="flavor" value="1" id="acidity" autocomplete="off" <c:if test="${productDTO.productFeatureDTO.flavor == 1}">checked="checked"</c:if>>
                        <label class="btn btn-outline-warning" for="acidity">산미 위주의 상큼한 커피</label>			
                        <input type="radio" class="btn-check flavor" name="flavor" value="2" id="nutty" autocomplete="off" <c:if test="${productDTO.productFeatureDTO.flavor == 2}">checked="checked"</c:if>>
                        <label class="btn btn-outline-success" for="nutty">고소하면서 부드러운 커피</label>			
                        <input type="radio" class="btn-check flavor" name="flavor" value="3" id="sweet" autocomplete="off" <c:if test="${productDTO.productFeatureDTO.flavor == 3}">checked="checked"</c:if>>
                        <label class="btn btn-outline-secondary" for="sweet">묵직하면서 단맛이 잘 느껴지는 커피</label>					
                    </li>
                </ul>
            </div>
            <div class="mt-5 mb-5 text-center">
                <button type="button" id="updateBtn" class="btn btn-secondary">수정하기</button>
            </div>
        </form>
    </div>
    
	<c:import url="../template/footer.jsp"></c:import>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
    <script src="../resources/js/product/update.js"></script>
</body>
</html>