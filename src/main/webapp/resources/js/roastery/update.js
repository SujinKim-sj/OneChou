// 로스터리 이름 검증
const inputRoasteryName = document.querySelector('#inputRoasteryName');
const roasteryNameFeedback = document.querySelector('#roasteryNameFeedback');

let roasteryNameCheck = true;

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

let infoCheck = true;

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

// 로스터리 이미지 변경시 처리
const roasteryImageDiv = document.querySelector('#roasteryImageDiv');
const changeImageBtn = document.querySelector('#changeImageBtn');
const originalImage = document.querySelector('#originalImage');

// 이미지 검증
let imageCheck = true;

changeImageBtn.addEventListener("click", function(){
    if(!confirm("변경하시겠습니까? \n되돌릴 수 없습니다.")) {
        return;
    }

    imageCheck = false; // 버튼을 누르면 file값 검증해야함
    originalImage.remove();

    const newImageDiv = document.createElement("div");
    newImageDiv.classList.add("col-6");

    const newImageLabel = document.createElement("label");
    newImageLabel.classList.add("form-label", "fw-bold");
    newImageLabel.setAttribute("for", "inputImage");
    newImageLabel.innerHTML = "이미지 파일 수정";
    
    const newImageInput = document.createElement("input");
    newImageInput.classList.add("form-control");
    newImageInput.setAttribute("type", "file");
    newImageInput.setAttribute("id", "inputImage");
    newImageInput.setAttribute("name", "image");
    newImageInput.setAttribute("onchange", "fileTypeCheck(this)");
    newImageInput.setAttribute("accept", "image/gif, image/jpeg, image/png");

    const newImageFeedback = document.createElement("div");
    newImageFeedback.classList.add("fs-6", "text-danger");
    newImageFeedback.setAttribute("id", "imageFeedback");

    newImageDiv.append(newImageLabel);
    newImageDiv.append(newImageInput);
    newImageDiv.append(newImageFeedback);
    roasteryImageDiv.append(newImageDiv);
})


// 파일 형식 제한(이미지파일만)
function fileTypeCheck(obj) {
    const imageFeedback = document.querySelector('#imageFeedback');

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
const updateBtn = document.querySelector('#updateBtn');
const updateForm = document.querySelector('#updateForm');

updateBtn.addEventListener("click", function(){
    
    if(roasteryNameCheck && infoCheck && roasteryAddressCheck && imageCheck) {
        if(!confirm('수정하시겠습니까?')){
            return;
        } else {
            updateForm.submit();
        }
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
    } 
})