import "bootstrap";
const stripe = Stripe('pk_test_pWFCbIFHRFsjcdrkgpjQYLq200G6vlRXfx');

const test = document.querySelectorAll('#podCrownrr');
test.forEach(item => item.addEventListener('click', (event) => {
  item.style.color = "#43E140";
}))


const undelivered_order = document.querySelectorAll('.undelivered');
undelivered_order.forEach(item => item.addEventListener('click', event => {
  item.style.color = "#43E140";
}))



// mark_delivered();

const homeBanner = document.querySelector('.home_banner');
const navbar = document.querySelector('.navbar');
const title = document.querySelector('.title');
const tabs = document.querySelector('.tabs');
const scroll = document.getElementById('scroll');
if (homeBanner) {
  window.onscroll = function () {
      "use strict";
      if (document.documentElement.scrollTop >= scroll.offsetTop ) {
          // console.log('if')
          navbar.classList.add("navbar-colored");
          title.innerHTML = "FERME DE BEAU PRINTEMPS";
          tabs.innerHTML = "<a href=" + "/products" + ">Nos Produits</a><a href=" + "/delivery_zone" + ">Zone de Livraison</a>" + "<a href=" + "/elevage" + ">Notre Élevage</a>";
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
if (bob) {
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

}

const modal = document.querySelector('#modal')
if (btn) {
  btn.addEventListener('click', (event) => {
    modal.modal('toggle')
  })

}

const productPrice = document.querySelector('#productPrice');
const testModal = document.querySelector('.qtyAdded');
const totalPrice = document.querySelector('.qtyTotal');
if (btn) {
  btn.addEventListener('click', (event) => {
    testModal.innerText = bob.value
    totalPrice.innerText = Number.parseInt(bob.value,10) * Number.parseInt(productPrice.dataset.price, 10) + '€';
  })

}


