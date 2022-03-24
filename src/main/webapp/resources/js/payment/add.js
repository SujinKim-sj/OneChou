// 총 가격 구해서 input태그에 넣어주기
const perPrices = document.querySelectorAll('.perPrices');
const totalPrice = document.querySelector('#totalPrice');

let totalPriceValue = 0;
for(pp of perPrices) {
    totalPriceValue += pp.value*1
}

totalPrice.value = totalPriceValue;

// 최종 결제 정보에 데이터 넣어주기
const totalPriceResult = document.querySelector('#totalPriceResult');
const methodResult = document.querySelector('#methodResult');
const methodSelect = document.querySelector('#methodSelect');

totalPriceResult.innerHTML = totalPriceValue + "원";

let methodValue = 0;
let methodCheck = false;
methodSelect.addEventListener("change", function(){
    methodValue = methodSelect.value;

    if(methodValue == 'no') {
        methodResult.innerHTML = "유효한 결제방식을 선택해주세요";
        methodCheck = false;
    } else if (methodValue == '1') {
        methodResult.innerHTML = "카드결제";
        methodCheck = true;
    } else {
        methodResult.innerHTML = "현금결제";
        methodCheck = true;
    }
})