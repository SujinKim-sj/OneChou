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

// 배송지 정보 입력값 검증
const recipient = document.querySelector('#recipient');
const recipientPhone = document.querySelector('#recipientPhone');
const address = document.querySelector('#address');
const memo = document.querySelector('#memo');

let recipientCheck = false;
let recipientPhoneCheck = false;
let addressCheck = false;

recipient.addEventListener("blur", function(){
    recipientCheck = true;
    if(recipient.value == ""){
        recipientCheck = false;
    }
})

recipientPhone.addEventListener("blur", function(){
    recipientPhoneCheck = true;
    if(recipientPhone.value == ""){
        recipientPhoneCheck = false;
    }
})

address.addEventListener("blur", function(){
    addressCheck = true;
    if(address.value == ""){
        addressCheck = false;
    }
})

// 서버로 요청

const paymentBtn = document.querySelector('#paymentBtn');
const addForm = document.querySelector('#addForm');

paymentBtn.addEventListener("click", function(){
    if(!confirm("결제하시겠습니까?")){
        return;
    } else if(methodCheck && recipientCheck && recipientPhoneCheck && addressCheck) {
        if(memo.value == "") {
            memo.value = "배송메모 없음";
        }
        addForm.submit();
    } else if(!methodCheck) {
        alert("결제 방식을 확인해주세요")
    } else if(!recipientCheck) {
        alert("받는사람을 입력해주세요")
    } else if(!recipientPhoneCheck) {
        alert("받는사람 연락처를 확인해주세요")
    } else {
        alert("배송지 주소를 입력해주세요")
    }
})



