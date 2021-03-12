window.addEventListener('load', function(){
  
  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue/10); 

      const addTaxProfit = document.getElementById("profit")
      addTaxProfit.innerHTML = Math.floor(inputValue - (inputValue/10))
  })
})
