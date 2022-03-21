const cartBtn = document.querySelector('#cartBtn'); // 장바구니 담기 버튼
const optionNum = document.querySelector('#optionNum'); // option을 담고있는 select 태그
const options = document.querySelectorAll('.options'); // option을 담고있는 select 태그 내의 option태그들
const amount = document.querySelector('#amount'); // 상품수량을 담고있는 select 태그
const price = document.querySelector('#price'); // 해당 상품의 가격정보를 담고있는 input태그
const perPrice = document.querySelector('#perPrice'); // 최종적으로 value 속성에 담아야 할 가격 input태그

const showOption = document.querySelector('#showOption'); // 선택한 옵션을 보여주기 위함
const showAmount = document.querySelector('#showAmount'); // 선택한 수량을 보여주기 위함
const showPerPrice = document.querySelector('#showPerPrice');

let productPrice = 0; // 상품가격 + 옵션가격
let perPriceResult = 0; // (상품가격 + 옵션가격) * 상품수량 -> 최종적으로 파라미터로 넘겨야 할 값

let optionCheck = false; // 구매자가 옵션을 체크했는지 판단
let amountCheck = false; // 구매자가 수량을 체크했는지 판단

const cartFrm = document.querySelector('#cartFrm'); // 장바구니 추가 요청으로 가는 폼태그

optionNum.addEventListener("change", function() {

    // 유효 옵션을 골랐는지 판단
    if (optionNum.value == 'no') {
        optionCheck = false;
        showOption.innerHTML = "";
        showPerPrice.innerHTML = "";
        return;
    } else {
        optionCheck = true;
    }

    let opNum = optionNum.value; // 선택한 옵션의 번호를 저장
    let opHtml = "";

    for(let o of options) {
        if(o.value == opNum) { // 만약의 선택한 옵션의 번호와 옵션들 중에서 value의 값이 같다면
            opHtml = o.innerHTML; // 해당 <option> 요소 안의 HTML을 opHtml 변수에 대입
        }
    }
    // 해당 HTML의 공백 제거 후 :를 기준으로 파싱 -> 배열 생성, 맨 마지막 값이 가격임으로 역으로 바꾼 후 [0]번째 인덱스 반환
    let addPrice = opHtml.replace(/(\s*)/g,"").split(':').reverse()[0];
    
    // 상품가격 + 옵션가격 구하기
    productPrice = price.value*1 + addPrice*1;

    // 선택한 옵션을 브라우저상에 표시
    showOption.innerHTML = opHtml

    // 유효한 옵션과 수량을 골랐다면
    if(optionCheck && amountCheck) {
        // 선택한 옵션과 수량을 토대로 계산 후 파라미터로 넘기는 input태그에 대입
        perPriceResult = productPrice * amount.value;
        perPrice.value = perPriceResult;
        showPerPrice.innerHTML = "총 가격 : " + perPriceResult;
    }
})

amount.addEventListener("change", function() {

    // 유효 수량을 골랐는지 판단
    if (amount.value == 'no') {
        amountCheck = false;
        showAmount.innerHTML = "";
        showPerPrice.innerHTML = "";
        return;
    } else {
        amountCheck = true;
    }

    // 선택한 수량 브라우저상에 표시
    showAmount.innerHTML = "선택수량 : " + amount.value;

    // 유효한 옵션과 수량을 골랐다면
    if(optionCheck && amountCheck) {
        // 선택한 옵션과 수량을 토대로 계산 후 파라미터로 넘기는 input태그에 대입
        perPriceResult = productPrice * amount.value;
        perPrice.value = perPriceResult;
        showPerPrice.innerHTML = "총 가격 : " + perPriceResult;
    }
})

cartBtn.addEventListener("click", function(){
    if(optionCheck && amountCheck) {
        cartFrm.submit();
    } else if(!optionCheck) {
        alert("상품 옵션을 확인하세요.");
        optionNum.focus();
    } else {
        alert("상품 수량을 확인하세요.");
        amount.focus();
    }
})