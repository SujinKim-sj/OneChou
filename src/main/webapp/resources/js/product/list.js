const sortingSection = document.querySelector('#sortingSection');
const searchForm = document.querySelector('#searchForm');

sortingSection.addEventListener("click", function(event){
    if(event.target.classList.contains('sorting')){
        searchForm.submit();
    }
})