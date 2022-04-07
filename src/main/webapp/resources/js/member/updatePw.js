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

const updateBtn = document.querySelector('#updateBtn');
const updateForm = document.querySelector('#updateForm');

updateBtn.addEventListener("click", function(){
    if(pwCheck && pwSameCheck) {
        if(!confirm('수정하시겠습니까?')) {
            return;
        }
        updateForm.submit();
    } else if(!pwCheck) {
        alert('비밀번호를 확인해주세요')
    } else {
        alert('비밀번호가 일치하지 않아요')
    }
})