// --- id 검증 ---
const inputId = document.querySelector('#inputId');
const idFeedback = document.querySelector('#idFeedback');

let idCheck = false;

inputId.addEventListener("blur", function(){
    let idValue = inputId.value;
    let message = "";
    idDuplicateCheck = false; // 아이디를 다시 입력할 경우 false로
    idDuplicateFeedback.innerHTML = "";

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
const idDuplicateFeedback = document.querySelector('#idDuplicateFeedback');

let idDuplicateCheck = false;

idDuplicateBtn.addEventListener("click", function(){
    if(idCheck == false) {
        alert('아이디를 먼저 입력하거나\n유효한 아이디를 입력해주세요.')
        return;
    }

    idFeedback.innerHTML = "";

    const xhttp = new XMLHttpRequest();

    xhttp.open('GET','./idDuplicateCheck?id='+inputId.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            result = this.responseText.trim();
            if(result == '0') {
                idDuplicateCheck = true;
                idDuplicateFeedback.classList.replace("text-danger", "text-success");
                idDuplicateFeedback.innerHTML = "사용가능한 아이디에요"
            } else {
                idDuplicateCheck = false;
                idDuplicateFeedback.classList.replace("text-success", "text-danger");
                idDuplicateFeedback.innerHTML = "이미 사용중인 아이디에요"
                inputId.focus();
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

    let pwRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

    if(pwValue == '') {
        pwCheck = false;
        message = "비밀번호를 입력해주세요"
    } else if(!pwRegExp.test(pwValue)) {
        pwCheck = false;
        message = "영문 대/소문자 + 숫자 + 특수문자 조합<br>8자 이상 15자 이하로 입력해주세요";
    } else {
        pwCheck = true;
        message = "사용 가능한 비밀번호에요"
        pwFeedback.classList.replace("text-danger", "text-success");
    }

    pwFeedback.innerHTML = message;

})

// pw 일치 검증
const inputPwCheck = document.querySelector('#inputPwCheck');
const pwCheckFeedback = document.querySelector('#pwCheckFeedback');

let pwSameCheck = false;

inputPwCheck.addEventListener("keyup", function(){
    if(pwCheck == false) {
        alert('비밀번호를 입력하거나\n올바른 형식의 비밀번호를 입력해주세요')
        inputPw.value = '';
        inputPwCheck.value = '';
        inputPw.focus();
        return;
    }

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

// 별명 입력 검증
const inputNickname = document.querySelector('#inputNickname');
const nicknameFeedback = document.querySelector('#nicknameFeedback');

let nicknameCheck = false;

inputNickname.addEventListener("blur", function(){
    nicknameDuplicateCheck = false; // 다시 입력할 경우 다시 검사하도록
    nicknameDuplicateFeedback.innerHTML = "";

    nicknameFeedback.classList.replace("text-success", "text-danger");

    if(inputNickname.value == '') {
        nicknameCheck = false;
        nicknameFeedback.innerHTML = "닉네임을 입력해주세요";
    } else {
        nicknameCheck = true;
        nicknameFeedback.classList.replace("text-danger", "text-success");
        nicknameFeedback.innerHTML = "닉네임 중복검사를 실행해주세요"
    }
})

// 별명 중복 검사
const nicknameDuplicateBtn = document.querySelector('#nicknameDuplicateBtn');
const nicknameDuplicateFeedback = document.querySelector('#nicknameDuplicateFeedback')

let nicknameDuplicateCheck = false;

nicknameDuplicateBtn.addEventListener("click", function(){
    if(nicknameCheck == false) {
        alert('닉네임을 먼저 입력해주세요');
        return;
    }

    nicknameFeedback.innerHTML = "";

    const xhttp = new XMLHttpRequest();

    xhttp.open('GET','./nicknameDuplicateCheck?nickname='+inputNickname.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            result = this.responseText.trim();
            if(result == '0') {
                nicknameDuplicateCheck = true;
                nicknameDuplicateFeedback.classList.replace("text-danger", "text-success");
                nicknameDuplicateFeedback.innerHTML = "사용가능한 별명이에요"
            } else {
                nicknameDuplicateCheck = false;
                nicknameDuplicateFeedback.classList.replace("text-success", "text-danger");
                nicknameDuplicateFeedback.innerHTML = "이미 사용중인 별명이에요"
                inputNickname.focus();
            }
        }
    }
})

// 이메일 입력 검증
const inputEmail = document.querySelector('#inputEmail');
const emailFeedback = document.querySelector('#emailFeedback');

let emailCheck = false;

inputEmail.addEventListener("blur", function(){
    emailDuplicateCheck = false; // 다시 입력할 경우 다시 검사하도록
    emailDuplicateFeedback.innerHTML = "";

    let emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    emailFeedback.classList.replace("text-success", "text-danger");

    if(inputEmail.value == '') {
        emailCheck = false;
        emailFeedback.innerHTML = "이메일을 입력해주세요";
    } else if (!emailRegExp.test(inputEmail.value)) {
        emailCheck = false;
        emailFeedback.innerHTML = "이메일형식이 아닙니다";
    } else {
        emailCheck = true;
        emailFeedback.classList.replace("text-danger", "text-success");
        emailFeedback.innerHTML = "이메일 중복검사를 실행해주세요"
    }
})

// 이메일 중복 검사
const emailDuplicateBtn = document.querySelector('#emailDuplicateBtn');
const emailDuplicateFeedback = document.querySelector('#emailDuplicateFeedback')

let emailDuplicateCheck = false;

emailDuplicateBtn.addEventListener("click", function(){
    if(emailCheck == false) {
        alert('이메일을 먼저 입력해주세요');
        return;
    }

    emailFeedback.innerHTML = "";

    const xhttp = new XMLHttpRequest();

    xhttp.open('GET','./emailDuplicateCheck?email='+inputEmail.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            result = this.responseText.trim();
            if(result == '0') {
                emailDuplicateCheck = true;
                emailDuplicateFeedback.classList.replace("text-danger", "text-success");
                emailDuplicateFeedback.innerHTML = "사용가능한 이메일이에요"
            } else {
                emailDuplicateCheck = false;
                emailDuplicateFeedback.classList.replace("text-success", "text-danger");
                emailDuplicateFeedback.innerHTML = "이미 사용중인 이메일이에요"
                inputEmail.innerHTML = "";
                inputEmail.focus();
            }
        }
    }
})

// 전화번호 입력 검증
const inputPhone = document.querySelector('#inputPhone');
const phoneFeedback = document.querySelector('#phoneFeedback');

let phoneCheck = false;

inputPhone.addEventListener("blur", function(){
    phoneDuplicateCheck = false; // 다시 입력할 경우 다시 검사하도록
    phoneDuplicateFeedback.innerHTML = "";

    phoneFeedback.classList.replace("text-success", "text-danger");

    let phoneRegExp = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;

    if(inputPhone.value == '') {
        phoneCheck = false;
        phoneFeedback.innerHTML = "전화번호를 입력해주세요";
    } else if(!phoneRegExp.test(inputPhone.value)) {
        phoneCheck = false;
        phoneFeedback.innerHTML = "전화번호형식에 맞지 않아요<br>-를 같이 입력했는지 확인해주세요";
    } else {
        phoneCheck = true;
        phoneFeedback.classList.replace("text-danger", "text-success");
        phoneFeedback.innerHTML = "전화번호 중복검사를 실행해주세요"
    }
})

// 전화번호 중복 검사
const phoneDuplicateBtn = document.querySelector('#phoneDuplicateBtn');
const phoneDuplicateFeedback = document.querySelector('#phoneDuplicateFeedback')

let phoneDuplicateCheck = false;

phoneDuplicateBtn.addEventListener("click", function(){
    if(phoneCheck == false) {
        alert('전화번호를 먼저 입력하거나 \n-를 제외하고 입력해주세요');
        return;
    }

    phoneFeedback.innerHTML = "";

    const xhttp = new XMLHttpRequest();

    xhttp.open('GET','./phoneDuplicateCheck?phone='+inputPhone.value);

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            result = this.responseText.trim();
            if(result == '0') {
                phoneDuplicateCheck = true;
                phoneDuplicateFeedback.classList.replace("text-danger", "text-success");
                phoneDuplicateFeedback.innerHTML = "사용가능한 번호에요"
            } else {
                phoneDuplicateCheck = false;
                phoneDuplicateFeedback.classList.replace("text-success", "text-danger");
                phoneDuplicateFeedback.innerHTML = "이미 사용중인 번호에요"
                inputPhone.innerHTML = ""
                inputPhone.focus();
            }
        }
    }
})

// 카카오 주소 API
function getAddress() {
    addressFeedback.innerHTML = "";
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
