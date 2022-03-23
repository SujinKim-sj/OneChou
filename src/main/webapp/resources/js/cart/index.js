const listResult = document.querySelector('#listResult');
const deleteBtn = document.querySelector('#deleteBtn');

getList();

function getList() {
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./list")

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            listResult.innerHTML = this.responseText.trim();
        }
    }
}

// 장바구니 삭제
deleteBtn.addEventListener("click", function(){
    if(!confirm("삭제하시겠습니까?")){
        return;
    }

    const cartClick = document.querySelectorAll('.cartClick');
    let nums = [];

    for(cc of cartClick) {
        if(cc.checked) {
            nums.push(cc.getAttribute('value'));
        }
    }

    let param = "nums="+nums[0];
    for(let i=1;i<nums.length;i++) {
        param = param + "&nums="+nums[i];
    }

    const xhttp = new XMLHttpRequest();

    xhttp.open("POST", "./delete");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send(param);

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = this.response.trim();
            if(result) {
                alert('삭제되었습니다');
                for(n of nums) {
                    const listMain = document.querySelector('#listMain'+n);
                    listMain.remove();
                }
            } else {
                alert('삭제에 실패했습니다.');
            }
        }
    }

})

// 장바구니 수정
listResult.addEventListener("click", function(event){
    if(event.target.classList.contains('updateBtn')) {
        // 수정하는 장바구니 번호 구하기
        let num = event.target.getAttribute('data-num');
        
        // 선택한 옵션번호구하기
        const selectOption = document.querySelector('#selectOption'+num);
        let optionNum = selectOption.value;
        
        // 선택한 상품 수량 구하기
        const selectAmount = document.querySelector('#selectAmount'+num);
        let amount = selectAmount.value;

        // 원래 옵션번호 구하기
        let originalOptionNum = document.querySelector('#originalOptionNum'+num).value;
        console.log(originalOptionNum);
        
        // 원래 수량 구하기
        let originalAmount = document.querySelector('#originalAmount'+num).value;
        console.log(originalAmount);

        // 원래 옵션이랑 변경 옵션이랑 같은지 확인, 다르다면 변경할 것인지 확인

        if(optionNum == originalOptionNum && amount == originalAmount) {
            alert('옵션이나 수량을 변경하고 시도해주세요')
            return;
        } else if(!confirm("변경하시겠습니까?")){
            return;
        }

        // 총가격 구하기

        const productPriceSelector = document.querySelector('#productPriceSelector'+num);
        let productPrice = productPriceSelector.value*1; // 상품가격

        const freeDeliverySelector = document.querySelector('#freeDeliverySelector'+num);
        let freeDelivery = freeDeliverySelector.value*1; // 무료배송기준가격

        const deliveryFeeSelector = document.querySelector('#deliveryFeeSelector'+num);
        let deliveryFee = deliveryFeeSelector.value*1; // 배송비

        const options = document.querySelectorAll('.options'+num);
        let optionHtml = "";
        for(o of options) {
            if(o.value == optionNum) { //선택한 옵션번호와, 옵션태그 내의 value값이 같다면 안의 내용을 가져와라!
                optionHtml = o.innerHTML;
            }
        }
        // 해당 HTML의 모든 공백 제거 후 :를 기준으로 파싱 -> 배열 생성, 맨 마지막 값이 가격임으로 역으로 바꾼 후 [0]번째 인덱스 반환
        let addPrice = optionHtml.replace(/(\s*)/g,"").split(':').reverse()[0]*1;

        let perPrice = (productPrice + addPrice) * amount; // (상품가 + 옵션가) * 상품수량

        // 무료배송이 안되거나, 총 금액이 무료배송기준보다 낮다면
        if(freeDelivery == 0 || perPrice < freeDelivery) { 
            perPrice += deliveryFee; // 최종상품가는 배송비가 더해진다
        }

        // 비동기 방식으로 요청보내기
        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "./update");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("num="+num+"&perPrice="+perPrice+"&amount="+amount+"&optionNum="+optionNum);

        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = this.response.trim();
                if(result == 1) {
                    alert('변경되었습니다');
                    getList();
                } else {
                    alert('변경에 실패했습니다.');
                }
            }
        }
    }
})