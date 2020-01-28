import "bootstrap";
const stripe = Stripe('pk_test_pWFCbIFHRFsjcdrkgpjQYLq200G6vlRXfx');

const homeBanner = document.querySelector('.home_banner')
const navbar = document.querySelector('.navbar');
const title = document.querySelector('.title')
const tabs = document.querySelector('.tabs')
if (homeBanner) {
  window.onscroll = function () {
      "use strict";
      if (document.documentElement.scrollTop >= 900 ) {
          console.log('if')
          navbar.classList.add("navbar-colored");
          title.innerHTML = "FERME DE BEAU PRINTEMPS";
          tabs.innerHTML = "<a href=" + "/products" + ">Nos Produits</a><a href=" + "/products" + ">Notre Elevage</a><a href=" + "/delivery_zone" + ">Zone de Livraison</a>";
          navbar.classList.remove("navbar-lewagon");
      }
      else {

          navbar.classList.add("navbar-lewagon");
          navbar.classList.remove("navbar-colored");
          title.innerHTML = "";
          tabs.innerHTML = "";
      }
  };
}




const bob = document.querySelector('#bob')
const btn = document.querySelector('#btn')
bob.addEventListener('input', (event) => {
  if (event.data >= 1) {
    btn.href = btn.href.slice(0, -1) + event.data
    console.log(btn.href)
  } else {

  };
});

bob.addEventListener('click',(event) => {
  if (bob.value >= 1) {
    btn.href = btn.href.slice(0, -1) + bob.value
    console.log(btn.href)
  };
});

const modal = document.querySelector('#modal')
console.log(modal)
btn.addEventListener('click', (event) => {
  modal.modal('toggle')
})

const productPrice = document.querySelector('#productPrice');
const testModal = document.querySelector('.qtyAdded');
const totalPrice = document.querySelector('.qtyTotal');
btn.addEventListener('click', (event) => {
  testModal.innerText = bob.value
  totalPrice.innerText = Number.parseInt(bob.value,10) * Number.parseInt(productPrice.dataset.price, 10) + '€';
})

