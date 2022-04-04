// 컵노트 검증
const noteSelect = document.getElementById("noteSelect"); 

let noteCount = 0;
let noteCheck = false;

noteSelect.addEventListener("change", function(event){
	
    if(noteCount>=3 && event.target.checked==true){
		alert("최대 3개까지만 선택 가능해요");
		event.target.checked=false;	
		return;	
	}
	
	if(event.target.checked){
		noteCount++;
	} else {
		noteCount--;
	}
    
    if(noteCount < 1) {
        noteCheck = false;
    } else {
        noteCheck = true;
    }
    console.log(noteCheck);
})

// 로스팅포인트 검증
const roastingSection = document.querySelector('#roastingSection');

let roastingCheck = false;

// 라디오박스라 클릭 한번 되면 값을 입력한 것임
roastingSection.addEventListener("click", function(event){
    if(event.target.classList.contains('roastingRadio')) {
        roastingCheck = true;
    }
})

// 향미 검증
const flavorSection = document.querySelector('#flavorSection');

let flavorCheck = false;

flavorSection.addEventListener("click", function(event){
    if(event.target.classList.contains('flavorRadio')) {
        flavorCheck = true;
    }
})

// 폼 제출 전 최종 검증
const joinBtn = document.querySelector('#joinBtn');
const joinForm = document.querySelector('#joinForm');

joinBtn.addEventListener("click", function(){
    
    if(idCheck && pwCheck && pwSameCheck && nameCheck && nicknameCheck && emailCheck && phoneCheck && addressCheck && noteCheck && roastingCheck && flavorCheck) {
        if(!confirm('회원가입하시겠습니까?')){
            return;
        } else {
            joinForm.submit();
        }
    } else if(!idCheck) {
        alert('아이디를 확인해주세요');
        inputId.focus();
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
    } else if(!addressCheck) {
        alert('주소를 확인해주세요');
        inputDetailAddress.focus();
    } else if(!noteCheck) {
        alert('컵노트는 한 개 이상 골라주세요')
    } else if(!roastingCheck) {
        alert('로스팅포인트를 선택해주세요')
    } else {
        alert('선호하는 커피의 향미를 선택해주세요')
    }

})