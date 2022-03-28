// 상품 이미지 변경시 처리
const productImageDiv = document.querySelector('#productImageDiv');
const changeImageBtn = document.querySelector('#changeImageBtn');
const originalImage = document.querySelector('#originalImage');

// 파일 값 검증도 여기서 같이 처리
let fileCheck = true;

changeImageBtn.addEventListener("click", function(){
    if(!confirm("변경하시겠습니까? \n되돌릴 수 없습니다.")) {
        return;
    }

    fileCheck = false; // 버튼을 누르면 file값 검증해야함
    originalImage.remove();

    const newImageDiv = document.createElement("div");
    newImageDiv.classList.add("input-group", "p-3");

    const newImageInput = document.createElement("input");
    newImageInput.classList.add("form-control");
    newImageInput.setAttribute("type", "file");
    newImageInput.setAttribute("id", "file");
    newImageInput.setAttribute("name", "file");

    const newImageLabel = document.createElement("label");
    newImageLabel.classList.add("input-group-text");
    newImageLabel.setAttribute("for", "file");
    newImageLabel.innerHTML = "로스터리 이미지 파일 등록";

    newImageDiv.append(newImageInput);
    newImageDiv.append(newImageLabel);
    productImageDiv.append(newImageDiv);
})

// 파일값 검증
productImageDiv.addEventListener("focusout", function(event){ 
    if(event.target.id == "file") {
        const file = document.querySelector('#file');
        if(file.value == '') {
            fileCheck = false;
        } else {
            fileCheck = true;
        }
    }
})

// ---- 옵션 관련 기능들 ----
const optionsDiv = document.querySelector('#optionsDiv');

// 옵션 검증용
let optionNameCheck = true;
let optionPriceCheck = true;
// 옵션을 추가하지 않을 수도 있어서 true로 해야 함, 추가버튼을 눌렀을 때 false로 초기화

// 옵션 삭제 처리
optionsDiv.addEventListener("click", function(event){
    // 오리지널 상품옵션 삭제시 처리
    if(event.target.classList.contains('originalDel')) {
        let oriOptionNum = event.target.getAttribute('data-num');

        const originalOptionDiv = document.querySelector('#originalOption'+oriOptionNum);
        originalOptionDiv.remove();
        
        optionNameCheck = true;
        const optionName = document.getElementsByClassName('optionName');
        for(let opName of optionName) {
            if(opName.value == "") {
                optionNameCheck = false;
            }
        }

        optionPriceCheck = true;
        const optionPrice = document.getElementsByClassName('optionPrice');
        for(let opPrice of optionPrice) {
            if(opPrice.value == "") {
                optionPriceCheck = false;
            }
        }

        console.log(optionPriceCheck);
        console.log(optionNameCheck);
    }

    // 버튼으로 추가된 옵션 삭제시 처리
    if(event.target.classList.contains('del')){
        let delNum = event.target.getAttribute("data-num");
        document.getElementById(delNum).remove();
        count--;

        optionNameCheck = true;
        const optionName = document.getElementsByClassName('optionName');
        for(let opName of optionName) {
            if(opName.value == "") {
                optionNameCheck = false;
            }
        }

        optionPriceCheck = true;
        const optionPrice = document.getElementsByClassName('optionPrice');
        for(let opPrice of optionPrice) {
            if(opPrice.value == "") {
                optionPriceCheck = false;
            }
        }
        console.log(optionPriceCheck);
        console.log(optionNameCheck);
    }
})

// 옵션 추가기능
const addBtn = document.getElementById('addBtn');

let count = 0;
let num = 0;

optionsDiv.addEventListener("focusout", function(event){
    if(event.target.classList.contains('optionName')){
        if(!event.target.value == ""){
            optionNameCheck = true;
        }
        const optionName = document.getElementsByClassName('optionName');
        for(let opName of optionName) {
            if(opName.value == "") {
                optionNameCheck = false;
            }
        }
    }

    if(event.target.classList.contains('optionPrice')){
        if(!event.target.value == ""){
            optionPriceCheck = true;
        }
        const optionPrice = document.getElementsByClassName('optionPrice');
        for(let opPrice of optionPrice) {
            if(opPrice.value == "") {
                optionPriceCheck = false;
            }
        }
    }

    console.log(optionPriceCheck);
    console.log(optionNameCheck);
})

addBtn.addEventListener("click", function(){
    
    if(count > 4) {
        alert("옵션은 최대 5개까지 추가 가능합니다.");
        return;
    }
    
    count++

    let divRow = document.createElement("div"); //<div>
    divRow.classList.add('row', 'mx-3');
    divRow.setAttribute("id", "del"+num);

    let divCol1 = document.createElement("div");
    divCol1.classList.add('col', 'form-floating', 'mt-3', 'mb-3');

    let input1 = document.createElement("input");
    input1.classList.add('form-control', 'optionName');
    input1.setAttribute("type", "text");
    input1.setAttribute("id", "optionNames"+num)
    input1.setAttribute("name", "optionNames")
    input1.setAttribute("placeholder", "옵션명입력")

    let label1 = document.createElement("label");
    label1.setAttribute("for", "optionNames"+num);
    label1.innerHTML = "&nbsp;&nbsp;옵션명입력";

    divCol1.append(input1);
    divCol1.append(label1);

    let divCol2 = document.createElement("div");
    divCol2.classList.add('col', 'form-floating', 'mt-3', 'mb-3');

    let input2 = document.createElement("input");
    input2.classList.add('form-control', 'optionPrice');
    input2.setAttribute("type", "number");
    input2.setAttribute("id", "addPrices"+num)
    input2.setAttribute("name", "addPrices")
    input2.setAttribute("placeholder", "옵션가격입력")

    let label2 = document.createElement("label");
    label2.setAttribute("for", "addPrices"+num);
    label2.innerHTML = "&nbsp;&nbsp;옵션가격입력";

    divCol2.append(input2);
    divCol2.append(label2);

    let divCol3 = document.createElement("div");
    divCol3.classList.add('col', 'col-2', 'd-flex', 'align-items-center', 'justify-content-center');

    let delBtn = document.createElement("button");
    delBtn.setAttribute("type", "button");
    delBtn.setAttribute("data-num", "del"+num);
    delBtn.classList.add("btn", "btn-secondary", "del");
    delBtn.innerHTML = "옵션지우기";

    divCol3.append(delBtn);

    divRow.append(divCol1);
    divRow.append(divCol2);
    divRow.append(divCol3);

    optionsDiv.append(divRow);
    num++;
    
    // 추가버튼을 누르면 옵션값을 검증하게끔
    optionNameCheck = false;
    optionPriceCheck = false;

    console.log(optionPriceCheck);
    console.log(optionNameCheck);
})

// 값 검증

const name = document.getElementById('name');
const price = document.getElementById('price');
const deliveryFee = document.getElementById('deliveryFee');
const info = document.getElementById('info');
const cupnote1 = document.getElementById('cupnote1');
const cupnote2 = document.getElementById('cupnote2');
const cupnote3 = document.getElementById('cupnote3');
const updateBtn = document.getElementById('updateBtn');
const frm = document.getElementById('frm');

// 전체적으로 폼에 내용들이 입력되어 있기 때문에 true로 초기화, 이후 변경 시에 이벤트를 걸어 true, false 여부 확인
let nameCheck = true;
let priceCheck = true;
let deliveryFeeCheck = true;
let infoCheck = true;
let cupnote1Check = true;
let cupnote2Check = true;
let cupnote3Check = true;
let cupnoteSameCheck = true;

name.addEventListener("blur", function(){
    if(name.value == ''){
        nameCheck = false;
    } else {
        nameCheck = true;
    }
});

price.addEventListener("blur", function(){
    if(price.value == ''){
        priceCheck = false;
    } else {
        priceCheck = true;
    }
});

deliveryFee.addEventListener("blur", function(){
    if(deliveryFee.value == ''){
        deliveryFeeCheck = false;
    } else {
        deliveryFeeCheck = true;
    }
})

info.addEventListener("blur", function(){
    if(info.value == ''){
        infoCheck = false;
    } else {
        infoCheck = true;
    }
});

cupnote1.addEventListener("blur", function(){
    if(cupnote1.value == 'no') {
        cupnote1Check = false;
    } else {
        cupnote1Check = true;
    }

    if(cupnote1.value == cupnote2.value || cupnote1.value == cupnote3.value || cupnote2.value == cupnote3.value) {
        cupnoteSameCheck = false;
    } else {
        cupnoteSameCheck = true;
    }
})

cupnote2.addEventListener("blur", function(){
    if(cupnote2.value == 'no') {
        cupnote2Check = false;
    } else {
        cupnote2Check = true;
    }

    if(cupnote1.value == cupnote2.value || cupnote1.value == cupnote3.value || cupnote2.value == cupnote3.value) {
        cupnoteSameCheck = false;
    } else {
        cupnoteSameCheck = true;
    }
})

cupnote3.addEventListener("blur", function(){
    if(cupnote3.value == 'no') {
        cupnote3Check = false;
    } else {
        cupnote3Check = true;
    }

    if(cupnote1.value == cupnote2.value || cupnote1.value == cupnote3.value || cupnote2.value == cupnote3.value) {
        cupnoteSameCheck = false;
    } else {
        cupnoteSameCheck = true;
    }
})

// roasting, flavor는 이미 하나가 선택되어 있어서 검증하지 않아도 됨


updateBtn.addEventListener("click", function(){
    if(!confirm('수정하시겠습니까?')) {
        return;
    }

    if(nameCheck && priceCheck && deliveryFeeCheck && infoCheck && fileCheck && optionNameCheck && optionPriceCheck && cupnote1Check && cupnote2Check && cupnote3Check && cupnoteSameCheck) {
        console.log("합격입니다");
        //frm.submit();
    } else if(!nameCheck) {
        alert("상품명을 입력하세요.");
        name.focus();
    } else if(!priceCheck) {
        alert("상품가격을 입력하세요.");
        price.focus();
    } else if(!deliveryFeeCheck) {
        alert("상품가격을 입력하세요.");
        deliveryFee.focus();
    } else if(!infoCheck) {
        alert("상품설명을 입력하세요.");
        info.focus();
    } else if(!fileCheck) {
        alert("상품이미지를 올려주세요.");
        file.focus();
    } else if(!optionNameCheck) {
        alert("옵션 이름을 확인하세요.");
    } else if(!optionPriceCheck) {
        alert("옵션 가격을 확인하세요.");
    } else if(!cupnote1Check) {
        alert("첫 번째 컵노트를 등록하세요.");
        cupnote1.focus();
    } else if(!cupnote2Check) {
        alert("두 번째 컵노트를 등록하세요.");
        cupnote2.focus();
    } else if(!cupnote3Check) {
        alert("세 번째 컵노트를 등록하세요.");
        cupnote3.focus();
    } else if(!cupnoteSameCheck) {
        alert("컵노트가 중복됩니다.");
        cupnote3.focus();
    }
})