const options = document.getElementById('options');
const addBtn = document.getElementById('addBtn');

let count = 0;

addBtn.addEventListener("click", function(){
    count++
    
    if(count > 4) {
        alert("옵션은 최대 5개까지 추가 가능합니다.");
        return;
    }


    let divRow = document.createElement("div"); //<div>
    divRow.classList.add('row');

    let divCol1 = document.createElement("div");
    divCol1.classList.add('col', 'form-floating', 'mb-3');

    let input1 = document.createElement("input");
    input1.classList.add('form-control');
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
    divCol2.classList.add('col', 'form-floating', 'mb-3');

    let input2 = document.createElement("input");
    input2.classList.add('form-control');
    input2.setAttribute("type", "text");
    input2.setAttribute("id", "addPrices")
    input2.setAttribute("name", "addPrices")
    input2.setAttribute("placeholder", "옵션가격입력")

    let label2 = document.createElement("label");
    label2.setAttribute("for", "addPrices");
    label2.innerHTML = "&nbsp;&nbsp;옵션가격입력";

    divCol2.append(input2);
    divCol2.append(label2);

    divRow.append(divCol1);
    divRow.append(divCol2);

    options.append(divRow);

})