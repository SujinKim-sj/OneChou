
const kind = document.getElementsByName("kind");
const btn = document.getElementById("btn");
const frm = document.getElementById("frm");

btn.addEventListener("click",function(){
	if(!kind[0].checked&&!kind[1].checked){
		alert("회원 유형을 선택해주세요.");
		location.href='./kindSelect';
	}
	else{
		frm.submit();
	}
})
