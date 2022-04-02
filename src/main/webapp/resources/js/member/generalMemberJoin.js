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
