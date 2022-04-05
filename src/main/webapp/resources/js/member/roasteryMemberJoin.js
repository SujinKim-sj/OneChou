// 로스터리 이름 검증
const inputRoasteryName = document.querySelector('#inputRoasteryName');
const roasteryNameFeedback = document.querySelector('#roasteryNameFeedback');

let roasteryNameCheck = false;

inputRoasteryName.addEventListener("blur", function(){

    roasteryNameFeedback.classList.replace("text-success", "text-danger");

    if(inputRoasteryName.value == '') {
        roasteryNameCheck = false;
        roasteryNameFeedback.innerHTML = "로스터리 이름을 입력해주세요";
    } else {
        const xhttp = new XMLHttpRequest();

        xhttp.open('GET','./roasteryNameDuplicateCheck?name='+inputRoasteryName.value);
    
        xhttp.send();
    
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200) {
                result = this.responseText.trim();
                if(result == '0') {
                    roasteryNameCheck = true;
                    roasteryNameFeedback.classList.replace("text-danger", "text-success");
                    roasteryNameFeedback.innerHTML = "사용가능한 이름이에요"
                } else {
                    roasteryNameCheck = false;
                    roasteryNameFeedback.innerHTML = "이미 사용중인 이름이에요"
                }
            }
        }
    }
})

// 로스터리 설명 검증
const inputInfo = document.querySelector('#inputInfo');
const infoFeedback = document.querySelector('#infoFeedback');

let infoCheck = false;

inputInfo.addEventListener("blur", function(){
    let nameValue = inputInfo.value;
    let message = "";
    infoCheck = true;

    if(nameValue == '') {
        infoCheck = false;
        message = "조금이라도 로스터리를 설명해주세요"
    }

    infoFeedback.innerHTML = message;
})

// 카카오 주소 API
function getRoasteryAddress() {
    roasteryAddressFeedback.innerHTML = "";
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("inputRoasteryAddress").value = addr;
            // 상세 주소로 포커스를 옮긴다.
            document.getElementById("inputRoasteryDetailAddress").focus();
        }
    }).open();
}

// 주소 검증 및 통합
const inputRoasteryAddress = document.querySelector('#inputRoasteryAddress');
const inputRoasteryDetailAddress = document.querySelector('#inputRoasteryDetailAddress');
const roasteryAddressFeedback = document.querySelector('#roasteryAddressFeedback');
const roasteryDetailAddressFeedback = document.querySelector('#roasteryDetailAddressFeedback');
const integratedRoasteryAddress = document.querySelector('#integratedRoasteryAddress');

let roasteryAddressCheck = false;

inputRoasteryDetailAddress.addEventListener("blur", function(){
    let addressValue = inputRoasteryAddress.value;
    let detailAddressValue = inputRoasteryDetailAddress.value;

    // 주소를 검색했는지 확인
    if (addressValue == '') {
        roasteryAddressCheck = false;
        roasteryAddressFeedback.innerHTML = "주소를 검색해주세요";
    } else {
        roasteryAddressFeedback.innerHTML = "";

        if(detailAddressValue == '') {
            roasteryAddressCheck = false;
            roasteryDetailAddressFeedback.innerHTML = "상세주소를 입력해주세요";
        } else {
            roasteryAddressCheck = true;
            roasteryDetailAddressFeedback.innerHTML = "";
            integratedRoasteryAddress.value = addressValue + " " + detailAddressValue;
        }
    }
})

// 이미지 검증
const imageFeedback = document.querySelector('#imageFeedback');

let imageCheck = false;

// 파일 형식 제한(이미지파일만)
function fileTypeCheck(obj) {

	pathpoint = obj.value.lastIndexOf('.');

	filepoint = obj.value.substring(pathpoint+1,obj.length);

	filetype = filepoint.toLowerCase();

	if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
        imageFeedback.classList.replace("text-danger", "text-success");
		imageFeedback.innerHTML = "사용가능한 이미지 형식이에요"
        imageCheck = true;
	} else {
        imageFeedback.classList.replace("text-success", "text-danger");
		imageFeedback.innerHTML = "이 파일은 지원하지 않는 형식이에요"
        imageCheck = false;
	}
}

// 폼 제출 전 최종 검증
const joinBtn = document.querySelector('#joinBtn');
const joinForm = document.querySelector('#joinForm');

joinBtn.addEventListener("click", function(){
    
    if(idCheck && pwCheck && pwSameCheck && nameCheck && nicknameCheck && emailCheck && phoneCheck && addressCheck && roasteryNameCheck && infoCheck && roasteryAddressCheck && imageCheck) {
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
    } else if(!roasteryNameCheck) {
        alert('로스터리 이름을 확인해주세요');
        inputRoasteryName.focus();
    } else if(!infoCheck) {
        alert('조금이라도 로스터리를 설명해주세요');
        inputInfo.focus();
    } else if(!roasteryAddressCheck){
        alert('로스터리 주소를 확인해주세요');
        inputRoasteryDetailAddress.focus();
    } else {
        alert('로스터리 이미지를 확인해주세요')
        document.querySelector('#inputImage').focus();
    }

})