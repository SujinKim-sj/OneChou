const paymentSection = document.querySelector('#paymentSection');

paymentSection.addEventListener("click", function(event){
    if(event.target.classList.contains('shipmentSearchBtn')) {
        let paidProductNum = event.target.getAttribute('data-num');

        const deliveryCompany = document.querySelector('#deliveryCompany'+paidProductNum);
        const shipmentNum = document.querySelector('#shipmentNum'+paidProductNum);

        let uri = "https://tracker.delivery/#/"+deliveryCompany.value+"/"+shipmentNum.value;

        window.open(uri, 'target', 'top=100, left=300, width=500, height=600, toolbar=no, menubar=no, location=no, status=no, resizable=no')
    }
})