const price = () => {


  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const itemValue = parseInt(itemPrice.value);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    const tax = 0.10;
    addTaxPrice.innerHTML = Math.floor(itemValue * tax);
    profit.innerHTML = Math.floor(itemValue - addTaxPrice.innerHTML);



  })

};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
