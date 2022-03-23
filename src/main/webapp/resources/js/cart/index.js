const listResult = document.querySelector('#listResult');
const deleteBtn = document.querySelector('#deleteBtn');

getList();

function getList() {
    const xhttp = new XMLHttpRequest();

    xhttp.open("GET", "./list")

    xhttp.send();

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200) {
            listResult.innerHTML = this.responseText.trim();
        }
    }
}

deleteBtn.addEventListener("click", function(){
    const cartClick = document.querySelectorAll('.cartClick');
    let nums = [];

    for(cc of cartClick) {
        if(cc.checked) {
            nums.push(cc.getAttribute('value'));
        }
    }

    let param = "nums="+nums[0];
    for(let i=1;i<nums.length;i++) {
        param = param + "&nums="+nums[i];
    }

    const xhttp = new XMLHttpRequest();

    xhttp.open("POST", "./delete");

    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhttp.send(param);

    xhttp.onreadystatechange = function(){
        if(this.readyState == 4 && this.status == 200){
            let result = this.response.trim();
            if(result) {
                alert('삭제되었습니다');
                for(n of nums) {
                    const listMain = document.querySelector('#listMain'+n);
                    listMain.remove();
                }
            } else {
                alert('삭제에 실패했습니다.');
            }
        }
    }

})