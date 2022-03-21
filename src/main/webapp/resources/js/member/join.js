const id = document.getElementById("id");
const idResult = document.getElementById("idResult");
const pw = document.getElementById("pw");
const pwResult = document.getElementById("pwResult");
const pw2 = document.getElementById("pw2");
const pw2Result = document.getElementById("pw2Result");
const fullname = document.getElementById("name");
const nickname = document.getElementById("nickname");
const email = document.getElementById("email");
const phone = document.getElementById("phone");
const address = document.getElementById("address");
const btn = document.getElementById("btn");
const frm = document.getElementById("frm");
const kind = document.getElementsByName("kind");

let idCheck=false;
let pwCheck=false;
let pw2Check=false;
let nameCheck=false;
let nicknameCheck=false;
let emailCheck=false;
let phoneCheck=false;
let addressCheck=false;


id.addEventListener("blur",function(){
	if(id.value.length>0){
		idCheck=true;
		pw2Result.innerHTML= "";
	}
	else{
		pw2Check=false;
		idResult.innerHTML="ID를 입력해주세요.";
	}
});

pw.addEventListener("blur",function(){
	if(pw.value.length>7&&pw.value.length<13){
		pwCheck=true;
		pwResult.innerHTML="";
	}
	else{
		pw2Check=false;
		pwResult.innerHTML="8글자 이상 12글자 이하로 작성해주세요.";
	}
});

pw2.addEventListener("blur",function(){
	if(pw2.value==pw.value){
		pw2Result.innerHTML= "";
		pw2Check=true;
	}
	else{
		pw2Check=false;
		pw2Result.innerHTML= "비밀번호가 일치하지 않습니다.";
	}
})

pw.addEventListener("change",function(){
	if(pw.value.length>7&&pw.value.length<13&&pw2.value==pw.value){
		pwResult.innerHTML= "";
		pw2Result.innerHTML= "";
		pwCheck=true;
		pw2Check=true;	
	}
})

fullname.addEventListener("blur",function(){
	if(fullname.value.length>0){
		nameCheck=true;
	}
	else{
		nameCheck=false;
	}
})
nickname.addEventListener("blur",function(){
	if(nickname.value.length>0){
		nicknameCheck=true;
	}
	else{
		nicknameCheck=false;
	}
})
email.addEventListener("blur",function(){
	if(email.value.length>0){
		emailCheck=true;
	}
	else{
		emailCheck=false;
	}
})
phone.addEventListener("blur",function(){
	if(phone.value.length>0){
		phoneCheck=true;
	}
	else{
		phoneCheck=false;
	}
})
address.addEventListener("blur",function(){
	if(address.value.length>0){
		addressCheck=true;
	}
	else{
		addressCheck=false;
	}
})





btn.addEventListener("click",function(){
	
	if(idCheck&&pwCheck&&pw2Check&&nameCheck&&nicknameCheck&&emailCheck&&phoneCheck&&addressCheck){
		frm.submit();
	}
	else if(idCheck==false){
		alert("ID가 잘못되었습니다.");
		id.focus=true;
	}
	else if(pwCheck==false){
		alert("비밀번호가 잘못되었습니다.");
		pw.focus=true;
	}
	else if(pw2Check==false){
		alert("비밀번호가 올바른지 확인해주세요.");
		pw2.focus=true;
	}
	else if(nameCheck==false){
		alert("이름을 확인해주세요.");
		fullname.focus=true;
	}
	else if(nicknameCheck==false){
		alert("닉네임을 확인해주세요.");
		nickname.focus=true;
	}
	else if(emailCheck==false){
		alert("이메일을 확인해주세요.");
		email.focus=true;
	}
	else if(phoneCheck==false){
		alert("전화번호를 확인해주세요.");
		phone.focus=true;
	}
	else if(addressCheck==false){
		alert("주소를 확인해주세요.");
		address.focus=true;
	}

})









