const navbar = document.querySelector('.navbar');
const title = document.querySelector('.title')
window.onscroll = function () {
    "use strict";
    if (document.documentElement.scrollTop >= 900 ) {
        console.log('if')
        navbar.classList.add("navbar-colored");
        title.innerHTML = "FERME DE <span>BEAU</span> PRINTEMPS";
        navbar.classList.remove("navbar-lewagon");
    }
    else {

        navbar.classList.add("navbar-lewagon");
        navbar.classList.remove("navbar-colored");
        title.innerHTML = "";
    }
};
