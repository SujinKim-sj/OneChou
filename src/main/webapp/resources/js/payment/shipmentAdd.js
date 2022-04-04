const regBtn = document.querySelector('#regBtn');
const regForm = document.querySelector('#regForm');
const deliveryCompany = document.querySelector('#deliveryCompany');
const shipmentNum = document.querySelector('#shipmentNum');

let deliveryCompanyCheck = false;
let shipmentNumCheck = false;

deliveryCompany.addEventListener('blur', function(){
    deliveryCompanyCheck = true;
    if(deliveryCompany.value == 'no'){
        deliveryCompanyCheck = false;
    }
    console.log(deliveryCompanyCheck);
})

shipmentNum.addEventListener('blur', function(){
    shipmentNumCheck = true;
    if(shipmentNum.value == '') {
        shipmentNumCheck = false;
    }
    console.log(shipmentNumCheck);
})

regBtn.addEventListener('click', function(){
    
    if(deliveryCompanyCheck && shipmentNumCheck){
        if(!confirm('등록하시겠습니까?')){
            return;
        } else {
            regForm.submit();
        }
    } else if(!deliveryCompanyCheck) {
        alert('배송사를 선택해주세요');
        deliveryCompany.focus();
    } else {
        alert('운송장 번호를 입력해주세요');
        shipmentNum.focus();
    }
})