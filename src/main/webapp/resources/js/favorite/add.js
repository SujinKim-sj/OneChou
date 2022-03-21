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




light.addEventListener("click",function(){
	roastingPoint.value = "light";
})
medium.addEventListener("click",function(){
	roastingPoint.value = "medium";
})
dark.addEventListener("click",function(){
	roastingPoint.value = "dark";
})

acidity.addEventListener("click",function(){
	flavor.value="산미";
})
nutty.addEventListener("click",function(){
	flavor.value="고소함";
})
deep.addEventListener("click",function(){
	flavor.value="묵직함";
})

btn.addEventListener("click",function(){
	if(roastingPoint.value.length>0&&flavor.value.length>0){
		frm.submit();
	}
	else{
		alert("추천 원두 정보를 입력하세요.");
	}
})