const sortingSelect = document.querySelector('#sortingSelect');
const searchForm = document.querySelector('#searchForm');

sortingSelect.addEventListener("change", function(){
    searchForm.submit();
})

const productSection = document.querySelector('#productSection');

productSection.addEventListener("click", function(event){
    if(event.target.classList.contains('updateBtn')) {
        if(!confirm("업데이트 하시겠습니까?\n기존의 리뷰와 질문이 사라집니다.")){
            return;
        }
        const num = event.target.getAttribute('data-num');
        const updateForm = document.querySelector('#updateForm'+num);
        updateForm.submit();
    }

})
