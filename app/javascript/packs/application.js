import "bootstrap";
const stripe = Stripe('pk_test_pWFCbIFHRFsjcdrkgpjQYLq200G6vlRXfx');

// stripe.redirectToCheckout({
//   // Make the id field from the Checkout Session creation API response
//   // available to this file, so you can provide it as parameter here
//   // instead of the {{CHECKOUT_SESSION_ID}} placeholder.
//   sessionId: '{{CHECKOUT_SESSION_ID}}'
// }).then(function (result) {
//   // If `redirectToCheckout` fails due to a browser or network
//   // error, display the localized error message to your customer
//   // using `result.error.message`.
// });
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
          title.innerHTML = "FERME DE <span>BEAU</span> PRINTEMPS";
          tabs.innerHTML = "<a href=" + "/products" + ">Nos Produits</a><a href=" + "/products" + ">Notre Elevage</a><a href=" + "/products" + ">Zone de Livraison</a>";
          navbar.classList.remove("navbar-lewagon");
      }
      else {

          navbar.classList.add("navbar-lewagon");
          navbar.classList.remove("navbar-colored");
          title.innerHTML = "";
      }
  };
}

