const listResult = document.querySelector('#listResult');

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