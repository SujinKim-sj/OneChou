const cartBtn = document.querySelector('#cartBtn'); // 장바구니 담기 버튼
const optionNum = document.querySelector('#optionNum'); // option을 담고있는 select 태그
const options = document.querySelectorAll('.options'); // option을 담고있는 select 태그 내의 option태그들
const amount = document.querySelector('#amount'); // 상품수량을 담고있는 select 태그
const price = document.querySelector('#price'); // 해당 상품의 가격정보를 담고있는 input태그
const perPrice = document.querySelector('#perPrice'); // 최종적으로 value 속성에 담아야 할 가격 input태그
const memberId = document.querySelector('#memberId');
const productNum = document.querySelector('#productNum');
const deliveryFee = document.querySelector('#deliveryFee');
const freeDelivery = document.querySelector('#freeDelivery');
const paymentBtn = document.querySelector('#paymentBtn');

const showOption = document.querySelector('#showOption'); // 선택한 옵션을 보여주기 위함
const showAmount = document.querySelector('#showAmount'); // 선택한 수량을 보여주기 위함
const showPerPrice = document.querySelector('#showPerPrice'); // 최종 가격을 보여주기 위함

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

        let amountPrice = (productPrice * amount.value)*1 // 상품가 * 수량
        if(freeDelivery.value*1 == 0) {
            perPriceResult = amountPrice + deliveryFee.value*1;
        } else {
            if(amountPrice < freeDelivery.value*1) {
                perPriceResult = amountPrice + deliveryFee.value*1;
            } else {
                perPriceResult = amountPrice;
            }
        }
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

        let amountPrice = (productPrice * amount.value)*1 // 상품가 * 수량
        if(freeDelivery.value*1 == 0) {
            perPriceResult = amountPrice + deliveryFee.value*1;
        } else {
            if(amountPrice < freeDelivery.value*1) {
                perPriceResult = amountPrice + deliveryFee.value*1;
            } else {
                perPriceResult = amountPrice;
            }
        }
        perPrice.value = perPriceResult;
        showPerPrice.innerHTML = "총 가격 : " + perPriceResult;
    }
})

cartBtn.addEventListener("click", function(){
    if(memberId.value == "") {
        if(!confirm('로그인이 필요합니다. \n로그인 하시겠습니까?')){
            alert('회원만 장바구니에 추가가능합니다');
            return;
        } else {
            location.href = "../member/login";
            return;
        }
    }

    if(optionCheck && amountCheck) {
        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "../cart/add");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("amount="+amount.value+"&perPrice="+perPrice.value+"&memberId="+memberId.value+"&productNum="+productNum.value+"&optionNum="+optionNum.value);

        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = this.response.trim();
                if(result != '0') {
                    if(confirm('장바구니에 등록되었습니다.\n 장바구니로 이동하시겠습니까?')) {
                        window.location.href="../cart/index";
                    }
                } else {
                    alert('장바구니 등록에 실패했습니다. \n 다시 시도해 주세요.');
                }
            }
        }

        optionCheck = false;
        amountCheck = false;
        showOption.innerHTML = "";
        showAmount.innerHTML = "";
        showPerPrice.innerHTML = "";

    } else if(!optionCheck) {
        alert("상품 옵션을 확인하세요.");
        optionNum.focus();
    } else {
        alert("상품 수량을 확인하세요.");
        amount.focus();
    }
})

const cartNum = document.querySelector('#cartNum');
const payForm = document.querySelector('#payForm');

paymentBtn.addEventListener("click", function(){
    if(memberId.value == "") {
        if(!confirm('로그인이 필요합니다. \n로그인 하시겠습니까?')){
            alert('회원만 구매 가능합니다');
            return;
        } else {
            location.href = "../member/login";
            return;
        }
    }

    if(optionCheck && amountCheck) {

        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "../cart/add");

        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("amount="+amount.value+"&perPrice="+perPrice.value+"&memberId="+memberId.value+"&productNum="+productNum.value+"&optionNum="+optionNum.value);

        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                let result = this.response.trim();
                if(result != '0') {
                    
                    cartNum.value = result;
                    payForm.submit();
                
                } else {
                    alert('바로 결제에 실패했습니다. \n 다시 시도해 주세요.');
                }
            }
        }

    } else if(!optionCheck) {
        alert("상품 옵션을 확인하세요.");
        optionNum.focus();
    } else {
        alert("상품 수량을 확인하세요.");
        amount.focus();
    }
})

// --- 리뷰 비동기 방식 처리 ---
const reviewSection = document.querySelector('#reviewSection');
getReviewList();

function getReviewList() {
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "../review/list?productNum="+productNum.value)

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            reviewSection.innerHTML = this.responseText.trim();
        }
    }

}

reviewSection.addEventListener("click", function(event){
    if(event.target.getAttribute("id") == 'reviewDeleteBtn') {
        if(!confirm('삭제하시겠습니까?')) {
            return;
        }

        const reviewNum = event.target.getAttribute("data-num");
        
        const xhttp = new XMLHttpRequest();

        xhttp.open("POST", "../review/delete");
    
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

        xhttp.send("num="+reviewNum);
    
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200) {
                let result = this.responseText.trim();

                if(result == 1) {
                    alert('리뷰 삭제에 성공했습니다.');
                    getReviewList();
                } else {
                    alert('리뷰 삭제에 실패했습니다.\n다시 시도해주세요.')
                }
            }
        }
    }
})
