const checkAll = document.getElementById("checkAll");
const check = document.getElementsByClassName("check");
const btn = document.getElementById('btn');
const rules = document.getElementById("rules");


checkAll.onclick = function (){
	for(v of check){
		if(checkAll.checked){
			v.checked=true;
		}
		else{
			v.checked=false;
		}
	}
}

rules.addEventListener("click",function(){
	let final = true;
	for(c of check){
		if(!c.checked){
			final = false;
		}
	}
	checkAll.checked = final;
})

btn.onclick = function(){
	if(checkAll.checked){
		location.href='./join';
	}
	else{
		alert("약관에 동의해주세요.");
	}
}