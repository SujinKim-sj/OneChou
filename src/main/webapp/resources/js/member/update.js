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

let nameCheck = true;

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

// 별명 검증
const inputNickname = document.querySelector('#inputNickname');
const nicknameFeedback = document.querySelector('#nicknameFeedback');

let nicknameCheck = true;

inputNickname.addEventListener("blur", function(){

    nicknameFeedback.classList.replace("text-success", "text-danger");

    if(inputNickname.value == '') {
        nicknameCheck = false;
        nicknameFeedback.innerHTML = "닉네임을 입력해주세요";
    } else {
        const xhttp = new XMLHttpRequest();

        xhttp.open('GET','./nicknameDuplicateCheck?nickname='+inputNickname.value);
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200) {
                result = this.responseText.trim();
                if(result == '0') {
                    nicknameCheck = true;
                    nicknameFeedback.classList.replace("text-danger", "text-success");
                    nicknameFeedback.innerHTML = "사용가능한 별명이에요"
                } else {
                    nicknameCheck = false;
                    nicknameFeedback.innerHTML = "이미 사용중인 별명이에요"
                }
            }
        }
    }
})

// 이메일 검증
const inputEmail = document.querySelector('#inputEmail');
const emailFeedback = document.querySelector('#emailFeedback');

let emailCheck = true;

inputEmail.addEventListener("blur", function(){

    let emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    emailFeedback.classList.replace("text-success", "text-danger");

    if(inputEmail.value == '') {
        emailCheck = false;
        emailFeedback.innerHTML = "이메일을 입력해주세요";
    } else if (!emailRegExp.test(inputEmail.value)) {
        emailCheck = false;
        emailFeedback.innerHTML = "이메일형식이 아닙니다";
    } else {
        const xhttp = new XMLHttpRequest();

        xhttp.open('GET','./emailDuplicateCheck?email='+inputEmail.value);
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200) {
                result = this.responseText.trim();
                if(result == '0') {
                    emailCheck = true;
                    emailFeedback.classList.replace("text-danger", "text-success");
                    emailFeedback.innerHTML = "사용가능한 이메일이에요"
                } else {
                    emailCheck = false;
                    emailFeedback.innerHTML = "이미 사용중인 이메일이에요"
                }
            }
        }
    }
})

// 전화번호 검증
const inputPhone = document.querySelector('#inputPhone');
const phoneFeedback = document.querySelector('#phoneFeedback');

let phoneCheck = true;

inputPhone.addEventListener("blur", function(){

    phoneFeedback.classList.replace("text-success", "text-danger");

    let phoneRegExp = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}/;

    if(inputPhone.value == '') {
        phoneCheck = false;
        phoneFeedback.innerHTML = "전화번호를 입력해주세요";
    } else if(!phoneRegExp.test(inputPhone.value)) {
        phoneCheck = false;
        phoneFeedback.innerHTML = "전화번호형식에 맞지 않아요<br>-를 같이 입력했는지 확인해주세요";
    } else {
        const xhttp = new XMLHttpRequest();

        xhttp.open('GET','./phoneDuplicateCheck?phone='+inputPhone.value);
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200) {
                result = this.responseText.trim();
                if(result == '0') {
                    phoneCheck = true;
                    phoneFeedback.classList.replace("text-danger", "text-success");
                    phoneFeedback.innerHTML = "사용가능한 번호에요"
                } else {
                    phoneCheck = false;
                    phoneFeedback.innerHTML = "이미 사용중인 번호에요"
                }
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

// 최종 검증
const updateBtn = document.querySelector('#updateBtn');
const updateForm = document.querySelector('#updateForm');

updateBtn.addEventListener("click", function(){
	
	if(pwCheck && pwSameCheck && nameCheck && nicknameCheck && emailCheck && phoneCheck && addressCheck) {
        if(!confirm('수정하시겠습니까?')){
            return;
        } else {
            updateForm.submit();
        }
    } else if(!pwCheck) {
        alert('비밀번호를 확인 해주세요');
        inputPw.focus();
    } else if(!pwSameCheck) {
        alert('비밀번호 확인이 이루어지지 않았습니다');
        inputPwCheck.focus();
    } else if(!nameCheck) {
        alert('이름을 입력 해주세요');
        inputName.focus();
    } else if(!nicknameCheck) {
        alert('별명을 확인해주세요');
        inputNickname.focus();
    } else if(!emailCheck) {
        alert('이메일을 확인해주세요');
        inputEmail.focus();
    } else if(!phoneCheck) {
        alert('전화번호를 확인해주세요');
        inputPhone.focus();
    } else {
        alert('주소를 확인해주세요');
        inputDetailAddress.focus();
    }

})