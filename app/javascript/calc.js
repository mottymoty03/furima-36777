function calc (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceVal = itemPrice.value;
    const commission = parseInt(priceVal * 0.1);
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = commission.toLocaleString();
    profit.innerHTML = (priceVal - commission).toLocaleString();
  });
};

window.addEventListener('load', calc);
