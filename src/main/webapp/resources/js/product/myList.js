const sortingSelect = document.querySelector('#sortingSelect');
const searchForm = document.querySelector('#searchForm');

sortingSelect.addEventListener("change", function(){
    searchForm.submit();
})

const updateForm = document.querySelector('#updateForm');
const updateBtn = document.querySelector('#updateBtn');

updateBtn.addEventListener("click", function(){
    if(confirm("상품 수정 후에는 작성된 리뷰, 질문이 사라집니다.\n계속하시겠습니까?")) {
        updateForm.submit();
    }
})