// 옵션 추가 기능
const options = document.getElementById('options');
const addBtn = document.getElementById('addBtn');

let count = 0;
let num = 0;

// 옵션을 추가해놓고 값을 입력하지 않을 때 검증
let optionNameCheck = true;
let optionPriceCheck = true;
// 옵션을 추가하지 않을 수도 있어서 true로 해야 함, 추가버튼을 눌렀을 때 false로 초기화

options.addEventListener("focusout", function(event){
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
})

addBtn.addEventListener("click", function(){
    
    if(count > 4) {
        alert("옵션은 최대 5개까지 추가 가능합니다.");
        return;
    }
    
    count++

    let divRow = document.createElement("div"); //<div>
    divRow.classList.add('row');
    divRow.setAttribute("id", "del"+num);

    let divCol1 = document.createElement("div");
    divCol1.classList.add('col', 'form-floating', 'mt-3', 'mb-3');

    let input1 = document.createElement("input");
    input1.classList.add('form-control', 'optionName');
    input1.setAttribute("type", "text");
    input1.setAttribute("id", "optionNames")
    input1.setAttribute("name", "optionNames")
    input1.setAttribute("placeholder", "옵션명입력")

    let label1 = document.createElement("label");
    label1.setAttribute("for", "optionNames");
    label1.innerHTML = "&nbsp;&nbsp;옵션명입력";

    divCol1.append(input1);
    divCol1.append(label1);

    let divCol2 = document.createElement("div");
    divCol2.classList.add('col', 'form-floating', 'mt-3', 'mb-3');

    let input2 = document.createElement("input");
    input2.classList.add('form-control', 'optionPrice');
    input2.setAttribute("type", "number");
    input2.setAttribute("id", "addPrices")
    input2.setAttribute("name", "addPrices")
    input2.setAttribute("placeholder", "옵션가격입력")

    let label2 = document.createElement("label");
    label2.setAttribute("for", "addPrices");
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

    options.append(divRow);
    num++;
    
    // 추가버튼을 누르면 옵션값을 검증하게끔
    optionNameCheck = false;
    optionPriceCheck = false;
})

options.addEventListener("click", function(event) {
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
    }
})

// 값 검증

const name = document.getElementById('name');
const price = document.getElementById('price');
const deliveryFee = document.getElementById('deliveryFee');
const info = document.getElementById('info');
const file = document.getElementById('file');
// const cupnote = document.getElementsByClassName('cupnote');
const cupnote1 = document.getElementById('cupnote1');
const cupnote2 = document.getElementById('cupnote2');
const cupnote3 = document.getElementById('cupnote3');
const roasting = document.getElementsByClassName('roasting');
const flavor = document.getElementsByClassName('flavor');
const regBtn = document.getElementById('regBtn');
const frm = document.getElementById('frm');

let nameCheck = false;
let priceCheck = false;
let deliveryFeeCheck = false;
let infoCheck = false;
let fileCheck = false;
let cupnote1Check = false;
let cupnote2Check = false;
let cupnote3Check = false;
let cupnoteSameCheck = false;
let roastingCheck = false;
let flavorCheck = false;

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

file.addEventListener("blur", function(){
    if(file.value == ''){
        fileCheck = false;
    } else {
        fileCheck = true;
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
    console.log(cupnote1Check);
    console.log(cupnoteSameCheck);
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
    console.log(cupnote2Check);
    console.log(cupnoteSameCheck);
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
    console.log(cupnote3Check);
    console.log(cupnoteSameCheck);
})


// let cupnoteCheckNum = 0;
// let compare;

// for(let c of cupnote) {
//     c.addEventListener("change", function(){
//         // value 값을 no로 바꿀 경우 CheckNum을 -1
//         if(c.value=='no') {
//             cupnoteCheckNum--;
//         } else {
//             cupnoteCheckNum++;
//         }
//         console.log("compare",compare);
//         console.log("c.value",c.value);
//         console.log("c.value == compare",c.value == compare);
//         if(c.value == compare) {
//             cupnoteCheck = false;
//         } else {
//             cupnoteCheck = true;
//         }
//         compare = c.value;

//         // 3개의 값을 모두 골라야만(checkNum==3) true
//         if(cupnoteCheckNum == 3) {
//             cupnoteCheck = true;
//         } else {
//             cupnoteCheck = false;
//         }
//         console.log("cupnoteCheckNum",cupnoteCheckNum);
//         console.log("cupnoteCheck",cupnoteCheck);
//     })
// };



// 라디오 박스라 클릭만 일어나도 값이 입력된 것이나 다름없음
for(let r of roasting) {
    r.addEventListener("click", function(){
        roastingCheck = true;
    })
}

for(let f of flavor) {
    f.addEventListener("click", function(){
        flavorCheck = true;
    })
}

regBtn.addEventListener("click", function(){
    if(nameCheck && priceCheck && deliveryFeeCheck && infoCheck && fileCheck && optionNameCheck && optionPriceCheck && cupnote1Check && cupnote2Check && cupnote3Check && cupnoteSameCheck && roastingCheck && flavorCheck) {
        frm.submit();
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
    } else if(!roastingCheck) {
        alert("로스팅포인트를 골라주세요.");
        roasting[0].focus();
    } else {
        alert("향미를 골라주세요.");
        flavor[0].focus();
    }
})