const frm = document.getElementById("frm");
const light = document.getElementById("light");
const medium = document.getElementById("medium");
const dark = document.getElementById("dark");
const roastingPoint = document.getElementById("roastingPoint");
const acidity = document.getElementById("acidity");
const nutty = document.getElementById("nutty");
const deep = document.getElementById("deep");
const flavor = document.getElementById("flavor");
const btn = document.getElementById("btn");
const option1 = document.getElementById("option1");
const option2 = document.getElementById("option2");
const option3 = document.getElementById("option3");
const cupnote1 = document.getElementById("cupnote1");
const cupnote2 = document.getElementById("cupnote2");
const cupnote3 = document.getElementById("cupnote3");
const cupnote = document.getElementById("cupnote");

option1.addEventListener("click",function(){
	cupnote1.value=option1.value;		
	cupnote.value=cupnote1.value+" "+cupnote2.value+" "+cupnote3.value;
})
option2.addEventListener("click",function(){
	cupnote2.value=option2.value;		
	cupnote.value=cupnote1.value+" "+cupnote2.value+" "+cupnote3.value;
})
option3.addEventListener("click",function(){
	cupnote3.value=option3.value;		
	cupnote.value=cupnote1.value+" "+cupnote2.value+" "+cupnote3.value;
})

light.addEventListener("click",function(){
	roastingPoint.value =1;
})
medium.addEventListener("click",function(){
	roastingPoint.value = 2;
})
dark.addEventListener("click",function(){
	roastingPoint.value = 3;
})

acidity.addEventListener("click",function(){
	flavor.value=1;
})
nutty.addEventListener("click",function(){
	flavor.value=2;
})
deep.addEventListener("click",function(){
	flavor.value=3;
})

btn.addEventListener("click",function(){
	if(roastingPoint.value.length>0 && flavor.value.length>0){
		frm.submit();
	}
	else{
		alert("추천 원두 정보를 입력하세요.");
	}
})