
const kind = document.getElementsByName("kind");
const btn = document.getElementById("btn");

btn.addEventListener("click",function(){
	if(kind[0].checked){
		location.href='./join?kind='+kind[0].value;
	}
	else if(kind[1].checked){
		location.href='./join?kind='+kind[1].value;
	}
	else{
		alert("회원 유형을 선택해주세요.");
	}
})
