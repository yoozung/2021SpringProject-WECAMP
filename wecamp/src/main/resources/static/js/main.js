let button = document.querySelector('.drop-button');

button.addEventListener('click', () => {
    const dropdown = document.querySelector('#drop-content');
    dropdown.style.display = 'block';
  });

  button.addEventListener('blur', () => {
    const dropdown = document.querySelector('#drop-content');
	
    setTimeout(() => {
        dropdown.style.display = 'none'
       
      }, 200);
   ;
  });
  

    var header = document.querySelector(".t-navbar");
	var sticky = header.offsetTop;

    window.onscroll = function() {myFunction()};
	    

    
    function myFunction() {
      if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
      } else {
        header.classList.remove("sticky");
      }
    }   
   



/** 모달------------------------------------------------------------------------- */

let modal = document.getElementById('t-modal')
let close = document.getElementById('t-close');
let login = document.getElementById('login');

//Show modal
login.addEventListener('click', () => {
  modal.classList.add('t-show-modal')
})

//Hide modal
close.addEventListener('click', () => {
  modal.classList.remove('t-show-modal')
})

window.addEventListener('click', (e) => {
  e.target === modal ? modal.classList.remove('t-show-modal') : false
})