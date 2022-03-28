const btn = document.getElementById("btn");
const pw = document.getElementById("pw");
const pw2 = document.getElementById("pw2");
const rName = document.getElementById("name");
const nickname = document.getElementById("nickname");
const email = document.getElementById("email");
const phone = document.getElementById("phone");
const address = document.getElementById("address");
const frm = document.getElementById("frm");


btn.addEventListener("click",function(){
	if(pw.value.length>12 || pw.value.length<8){
		alert("올바른 비밀번호를 입력해주세요.");
		pw.focus();
		return;
	}
	if(pw.value!=pw2.value){
		alert("비밀번호가 일치하지 않습니다.");
		pw2.focus();
		return;
	}
	if(rName.value.length<1){
		alert("이름을 입력해주세요.");
		rName.focus();
		return;
	}
	if(nickname.value.length<1){
		alert("별명을 입력해주세요.");
		nickname.focus();
		return;
	}
	if(email.value.length<1){
		alert("이메일을 입력해주세요.");
		email.focus();
		return;
	}
	if(phone.value.length<1){
		alert("전화번호를 입력해주세요.");
		 phone.focus();
		return;
	}
	if(address.value.length<1){
		alert("주소를 입력해주세요.");
		address.focus();
		return;
	}
	
	frm.submit();
})



