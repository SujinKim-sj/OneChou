// --- id 검증 ---
const inputId = document.querySelector('#inputId');
const idFeedback = document.querySelector('#idFeedback');

let idCheck = false;

inputId.addEventListener("blur", function(){
    let idValue = inputId.value;
    let message = "";
    idDuplicateCheck = false; // 아이디를 다시 입력할 경우 false로

    idFeedback.classList.replace("text-success", "text-danger");
    
    if (idValue == '') {
        idCheck = false;
        message = "아이디를 입력해주세요";
    } else if(!idValue.match('^[a-zA-Z0-9]*$')) {
        idCheck = false;
        message = "한글 및 특수문자는 아이디로 사용할 수 없어요.";
    } else if(idValue.length < 6 || idValue.length > 15) {
        idCheck = false;
        message = "6글자 이상, 15글자 이하로 입력해주세요";
    } else {
        idCheck = true;
        message = "올바른 아이디에요. 중복검사를 실행해주세요";
        idFeedback.classList.replace("text-danger", "text-success");
    }
    
    idFeedback.innerHTML = message;
})

// id 중복 검사
const idDuplicateBtn = document.querySelector('#idDuplicateBtn');

let idDuplicateCheck = false;

idDuplicateBtn.addEventListener("click", function(){
    const xhttp = new XMLHttpRequest();

    xhttp.open('GET','./idDuplicateCheck?id='+inputId.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            result = this.responseText.trim();
            if(result == '0') {
                idDuplicateCheck = true;
                idFeedback.innerHTML = "사용가능한 아이디에요"
            } else {
                idDuplicateCheck = false;
                idFeedback.innerHTML = "이미 사용중인 아이디에요"
            }
        }
    }
})
// pw 검증
const inputPw = document.querySelector('#inputPw');
const pwFeedback = document.querySelector('#pwFeedback');

let pwCheck = false;

inputPw.addEventListener('keyup', function(){
    let pwValue = inputPw.value;
    let message = "";
    pwFeedback.classList.replace("text-success", "text-danger");

    if(pwValue == '') {
        pwCheck = false;
        message = "비밀번호를 입력해주세요"
    } else if(!pwValue.match('^[a-zA-Z0-9]*$')) {
        pwCheck = false;
        message = "한글 및 특수문자는 비밀번호로 사용할 수 없어요";
    } else if(pwValue.length < 8 || pwValue.length > 15) {
        pwCheck = false;
        message = "8글자이상 15글자 이하로 입력해주세요"
    } else {
        pwCheck = true;
        message = "올바른 비밀번호에요"
        pwFeedback.classList.replace("text-danger", "text-success");
    }

    pwFeedback.innerHTML = message;

})

// pw 일치 검증
const inputPwCheck = document.querySelector('#inputPwCheck');
const pwCheckFeedback = document.querySelector('#pwCheckFeedback');

const pwSameCheck = false;

inputPwCheck.addEventListener("keyup", function(){
    let pwValue = inputPw.value;
    let pwCheckValue = inputPwCheck.value;
    let message = "";

    pwCheckFeedback.classList.replace("text-success", "text-danger");

    if(pwValue != pwCheckValue) {
        pwSameCheck = false;
        message = "비밀번호가 일치하지 않아요"
    } else {
        pwSameCheck = true;
        message = "비밀번호가 일치해요"
        pwCheckFeedback.classList.replace("text-danger", "text-success");
    }

    pwCheckFeedback.innerHTML = message;
})

// 이름 입력 검증
const inputName = document.querySelector('#inputName');
const nameFeedback = document.querySelector('#nameFeedback');

let nameCheck = false;

inputName.addEventListener("blur", function(){
    let nameValue = inputName.value;
    let message = "";
    nameCheck = true;

    if(nameValue == '') {
        nameCheck = false;
        message = "이름을 입력해주세요"
    }

    nameFeedback.innerHTML = message;
})
// 카카오 주소 API
function getAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("inputAddress").value = addr;
            // 상세 주소로 포커스를 옮긴다.
            document.getElementById("inputDetailAddress").focus();
        }
    }).open();
}

// 주소 검증 및 통합
const inputAddress = document.querySelector('#inputAddress');
const inputDetailAddress = document.querySelector('#inputDetailAddress');
const addressFeedback = document.querySelector('#addressFeedback');
const detailAddressFeedback = document.querySelector('#detailAddressFeedback');
const integratedAddress = document.querySelector('#integratedAddress');

let addressCheck = false;

inputDetailAddress.addEventListener("blur", function(){
    let addressValue = inputAddress.value;
    let detailAddressValue = inputDetailAddress.value;

    // 주소를 검색했는지 확인
    if (addressValue == '') {
        addressCheck = false;
        addressFeedback.innerHTML = "주소를 검색해주세요";
    } else {
        addressFeedback.innerHTML = "";

        if(detailAddressValue == '') {
            addressCheck = false;
            detailAddressFeedback.innerHTML = "상세주소를 입력해주세요";
        } else {
            addressCheck = true;
            detailAddressFeedback.innerHTML = "";
            integratedAddress.value = addressValue + " " + detailAddressValue;
        }
    }
})