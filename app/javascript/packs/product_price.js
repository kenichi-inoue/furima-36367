window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  // console.log(priceInput);
  priceInput.addEventListener("input", () => {
  // console.log("イベント発火");

  const inputValue = priceInput.value;
  // console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
  // console.log(addTaxDom);
  addTaxDom.innerHTML = Math.floor(inputValue*0.1)

  const Profit = document.getElementById("profit");
  Profit.innerHTML = inputValue-Math.floor(inputValue*0.1)


 })

});

