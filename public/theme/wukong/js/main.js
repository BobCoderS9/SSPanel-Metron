/* ======================================
	
	Template: Mason - App Landing Page
	Css Name: Main Js
	Version: 1
	 

========================================= */

/*================================================
[  Table of contents  ]
================================================

	01. Menu Navvar
	02. Nav Var Remove Add
	03. Scrool Spy
	04. Sticky Header
	05. Counter Up
	06. Testimonial Owl Active
	07. Mailchimp Active
	08. Magnific Popup Video
	09. Slider Full Carousel
	10. Slider Text Carousel
	11. YTPlayer Active
	12. Screenshot Slider
	13. scrollUp
	14. Wow JS 
	
================================================*/

(function ($) {
 "use strict";
	
	//  01. Menu Navvar
	$(".navbar-nav a, .scroll-icon a, .appai-preview .button-group a").on('click', function(event) {
        if (this.hash !== "") {
            event.preventDefault();
            var hash = this.hash;
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function() {
                window.location.hash = hash;
            });
        }
    });
	
	// 02. Nav Var Remove Add
    $(document).on("click", ".navbar-nav a", function() {
        $(".navbar-nav").find("li").removeClass("active");
        $(this).closest("li").addClass("active");
    });
	
	// 03. Scrool Spy
    $('body').scrollspy({ target: '#navigation' })
 
	// 04. Sticky Header
    $(window).on('scroll', function() {
        if ($(this).scrollTop() > 0) {
            $('#header-top').addClass("navbar-fixed-top");
        } else {
            $('#header-top').removeClass("navbar-fixed-top");
        }
    });
	
	// 05. Counter Up
    $('.counter').counterUp({
        delay: 10,
        time: 1000
    });
	
	// 06. Testimonial Owl Active
	$('.testimonial-active').owlCarousel({
		items:1,
		lazyLoad:true,
		dots:false,
		loop:false,
		margin:10
	});
	
	// 07. Mailchimp Active
	$('#mc-form').ajaxChimp({
		 language: 'en',
		 callback: mailChimpResponse,
		 // ADD YOUR MAILCHIMP URL BELOW HERE!
		 url: '#'
		});
		function mailChimpResponse(resp) {
		 if (resp.result === 'success') {
		  $('.mailchimp-success').html('' + resp.msg).fadeIn(900);
		  $('.mailchimp-error').fadeOut(400);
		  
		 } else if(resp.result === 'error') {
		  $('.mailchimp-error').html('' + resp.msg).fadeIn(900);
		 }  
	}
	
    // 08. Magnific Popup Video		
	$('.video-popup').magnificPopup({
		type: 'iframe'
	});
	
    // 09. Slider Full Carousel
    $(".slider-full-carousel").owlCarousel({
        loop:true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        smartSpeed: 2500,
        nav:true,
        navText: ["<i class='icofont icofont-thin-left'></i>","<i class='icofont icofont-thin-right'></i>"],
        items:1,
		dots:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });
	
    // 10. Slider Text Carousel
    $(".slider-carousel").owlCarousel({
        loop:true,
        smartSpeed: 2500,
        nav:true,
        navText: ["<i class='icofont icofont-thin-left'></i>","<i class='icofont icofont-thin-right'></i>"],
        items:1,
        dots:true,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:1
            },
            1000:{
                items:1
            }
        }
    });
	
	// 11. YTPlayer Active
    $("#bgndVideo").YTPlayer();
	
	// 12. Screenshot Slider
	$('.screenshot-slider').slick({
	  centerMode: true,
	  centerPadding: '0',
	  slidesToShow: 3,
	  dots: false,
	  arrows: false,
	  autoplay:true,
	  prevArrow: '<button class="slick-prev ss2-prev" type="button"><i class="icofont icofont-thin-left"></i></i></button>',
	  nextArrow: '<button class="slick-next ss2-next" type="button"><i class="icofont icofont-thin-right"></i></button>',
	});
	
	// 13. scrollUp
	$.scrollUp({
		scrollText: '<i class="fa fa-angle-up"></i>',
		easingType: 'linear',
		scrollSpeed: 900,
		animation: 'fade'
	});
	
	// 14. Wow JS 
	new WOW().init();
	
})(jQuery);  