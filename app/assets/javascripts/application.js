// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).ready(function() {
	shakeButton();
	openNav();
});

function shakeButton(){
	setInterval(function(){
	      $('.nav-button').addClass("animated swing").one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd onanimationend', function() {
			$(this).removeClass('animated swing')
		  })
    },4000);
}

function openNav(){
	$('.nav-button')[0].click(function(event) {
		console.log("daf"); 
	});
}