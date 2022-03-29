const myform = document.querySelector('#myform');
const regBtn = document.querySelector('#regBtn');
const addForm = document.querySelector('#addForm');
const contents = document.querySelector('#contents');

let contentsCheck = false;
let reviewCheck = false;

myform.addEventListener("click", function(event){
    if(event.target.classList.contains('rating')){
        reviewCheck = true
    }
})

contents.addEventListener("blur", function(){
    contentsCheck = true;
    if(contents.value == '') {
        contentsCheck = false;
    }
})

regBtn.addEventListener("click", function(){
    if(!confirm("등록하시겠습니까?")) {
        return;
    } else if(reviewCheck && contentsCheck) {
        addForm.submit();
    } else if(!reviewCheck) {
        alert('별점을 입력해주세요');
    } else {
        alert('리뷰 내용을 입력해주세요');
        contents.focus();
    }
})