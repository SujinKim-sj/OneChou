const btn = document.querySelector("#btn"); 
const frm = document.querySelector("#frm");
const rName = document.querySelector("#name");
const address = document.querySelector("#address");
const info = document.querySelector("#info");


btn.addEventListener("click",function(){
	if(rName.value.length>0&&address.value.length>0&&info.value.length>0){		
	frm.submit();
	}
	else if(rName.value.length<1){
		alert("로스터리 이름을 입력하세요");
		return;
	}
	else if(address.value.length<1){
		alert("로스터리 주소를 입력하세요");
		return;
	}
	else if(info.value.length<1){
		alert("로스터리 설명을 입력하세요");
		return;
	}
	
});
