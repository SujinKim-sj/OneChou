const sortingSelect = document.querySelector('#sortingSelect');
const searchForm = document.querySelector('#searchForm');

sortingSelect.addEventListener("change", function(){
    searchForm.submit();
})