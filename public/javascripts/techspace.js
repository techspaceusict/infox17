$('.button-collapse').sideNav({
	menuWidth: 300, // Default is 300
	edge: 'left', // Choose the horizontal origin
	closeOnClick: true, // Closes side-nav on <a> clicks, useful for Angular/Meteor
	draggable: true, // Choose whether you can drag to open on touch screens
});

//scroll animations
  window.sr = ScrollReveal();
  sr.reveal('#body .card-container .card',{
      duration: 1000,
      origin :'bottom',
      viewFactor: 0,
   });
  sr.reveal('#footer .col',{
      duration: 2000,
      origin :'top',
   });
  sr.reveal('#sponsors img',{
    duration: 1000,
    origin: 'bottom',
  })
