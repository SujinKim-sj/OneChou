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

// 최종 검증
const updateBtn = document.querySelector('#updateBtn');
const updateForm = document.querySelector('#updateForm');

updateBtn.addEventListener("click", function(){

    if(noteCheck && roastingCheck && flavorCheck) {
        if(!confirm('수정하시겠습니까?')) {
            return;
        }
        updateForm.submit();
    } else if(!noteCheck) {
        alert('컵노트를 골라주세요');
    } else if(!roastingCheck) {
        alert('로스팅포인트를 골라주세요');
    } else {
        alert('선호하는 커피를 골라주세요');
    }
})
