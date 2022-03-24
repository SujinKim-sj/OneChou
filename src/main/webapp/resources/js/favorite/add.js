const frm = document.getElementById("frm");
const roastingPoint = document.getElementById("roastingPoint");
const flavor = document.getElementById("flavor");
const btn = document.getElementById("btn");
const check = document.getElementsByClassName("btn-check");
const noteSelect = document.getElementById("noteSelect"); 

let count = 0;



noteSelect.addEventListener("change",function(event){
	if(count>=3&&event.target.checked==true){
		alert("최대 3개까지");
		event.target.checked=false;	
		return;	
	}
	
	if(event.target.checked){
		count++;
	}else{
		count--;
	}
	console.log(count);
});

               


btn.addEventListener("click",function(){
	if(roastingPoint.value.length>0 && flavor.value.length>0){
		frm.submit();
	}
	else{
		alert("추천 원두 정보를 입력하세요.");
	}
})