


// $(document).ready(function () {
//     svg4everybody({});
// });
//
//
// function initMap() {
//   var center = {lat: 55.733113, lng: 49.137079 };
//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 18,
//     center: center
//   });
//   var marker = new google.maps.Marker({
//   position:center,
//   map: map
//   });
// }




$('.drop-menu-head-name').on('click',function(){

  $(this).find('.icon-chevron-down').toggleClass('icon-chevron-down--top');
  $(this).closest('.drop-menu-head').find('.drop-menu-body').toggleClass('drop-menu-body--visible');
  $(this).closest('.drop-menu-head').find('.drop-menu-body-name').toggleClass('drop-menu-body-name--visible');
})

$('.drop-menu-body-name').on('click',function(){
  $(this).closest('.drop-menu-body').find('.drop-menu-body-content').toggleClass('drop-menu-body-content--visible');
  $(this).closest('.drop-menu-body').find('.drop-menu-body-name').toggleClass('dark');
  $(this).closest('.drop-menu-body').find('.drop-menu-body-icon').toggleClass('icon-dark');
})
$( "#slider-range" ).slider({
  range: true,
  min: 1000,
  max: 75000,
  values: [ 7150, 50000 ],
  slide: function( event, ui ) {
    $( "#amount-f" ).val(  ui.values[ 0 ]);
    $( "#amount-s" ).val(  ui.values[ 1 ]);
  }
});
$( "#amount-f" ).val($( "#slider-range" ).slider( "values", 0 ) );
  $( "#amount-s" ).val($( "#slider-range" ).slider( "values", 1 ) );





$('.drop-menu-head-name').on('click', function(){
  $(this).siblings('.filter-items').toggleClass('filter-items--open');
})


$('.close-icon-row').on('click', function(){
  $(this).closest('.popup').removeClass('popup--active');
})

$('[data-button-basket]').on('click', function (e) {
   $(this).parents().find('.popup-basket').addClass('popup--active');
  e.preventDefault()
  });



  $('[data-button-call]').on('click', function (e) {
     $(this).parents().find('.popup').siblings('[data-call=' + $(this).data('button-call') + ']').addClass('popup--active');
    e.preventDefault()
    $('.btn-decline').on('click', function(){
      $('.popup').removeClass('popup--active');
      })
    });

  $('.btn-order').on('click', function (e) {
     $('.popup-order').addClass('popup--active');
     $('.btn-decline').on('click', function(){
       $('.popup').removeClass('popup--active');
       })
    });

$('.mobile-menu-icon-wrap').on('click', function(){
  $('.icon-menu').toggleClass('icon-menu--open');
    $('.icon-close-menu').toggleClass('icon-close-menu--open')
    $('.navigation').toggleClass('navigation--open');
      $('.overlay-body').toggleClass('overlay-body--open');
        $('body').toggleClass('overflow-hidden');
})



$('.filter-item-name-row').on('click', function(){
  $(this).closest('.filter-item-row').find('.filter-check-row').toggleClass('open');
  $(this).find('.mobile-chevron').toggleClass('icon-chevron-down--top');
})
$('.filter-item-name-row').on('click', function(){
  $(this).closest('.filter-item-row').find('.filter-items-wrap').toggleClass('open');
  $(this).find('.mobile-chevron').toggleClass('icon-chevron-down--top');
})
$('.filter-item-name-row').on('click', function(){
  $(this).closest('.filter-item-row').find('.slider-range-row').toggleClass('open');
  $(this).find('.mobile-chevron').toggleClass('icon-chevron-down--top');
})

$('.action-link').on('click', function(){
  $(this).closest('.action-link-row--main').find('.action-link').toggleClass('action-link--active')
  $('.ugg-info--hoverable').toggleClass('hidden');
})


$('.product-slider-main').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  asNavFor: '.product-slider-nav'
});


$('.product-slider-nav').slick({
  slidesToShow: 4,
  slidesToScroll: 1,
  asNavFor: '.product-slider-main',
  dots: false,
  focusOnSelect: true,
  responsive: [{
      breakpoint: 579,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false,
        focusOnSelect: true,
        infite: false
    },

    }]
});

$('.product-slider-nav .slick-slide').addClass('custom-slide');

$('.product-slider-main').on('afterChange', function(event, slick, currentSlide) {
 $('.product-slider-nav').slick('slickGoTo', currentSlide);
 var currrentNavSlideElem = '.product-slider-nav .slick-slide[data-slick-index="' + currentSlide + '"]';
 $('.product-slider-nav .slick-slide.is-active').removeClass('is-active');
 $(currrentNavSlideElem).addClass('is-active');
});

$('.product-slider-nav').on('click', '.slick-slide', function(event) {
 event.preventDefault();
 var goToSingleSlide = $(this).data('slick-index');

 $('.product-slider-main').slick('slickGoTo', goToSingleSlide);
});


$('.product-size').on('click', function (e) {
   $(this).addClass('product-size--active').siblings().removeClass('product-size--active');
  });

$('.btn-quick-order').on('click', function (e) {
   $('.popup--quick-order').addClass('popup--active');
  });

$('.action-btn--how-work').on('click', function (e) {
   $('.popup--how-we-work').addClass('popup--active');
  });

$('.action-btn--refund').on('click', function (e) {
   $('.popup--exchange-refunds').addClass('popup--active');
  });

$('.text-row--dropdown').on('click', function (e) {
  $(this).toggleClass('text-row--dropdown-open');
   $(this).closest('.popup-form-description').find('.table-content').toggleClass('table-active');
   $(this).closest('.text-row--dropdown').find('.drop-table-icon').toggleClass('icon-chevron-down--top');
  });

  $('.text-row--dropdown').on('click', function (e) {
    $(this).toggleClass('text-row--dropdown-open');
     $(this).closest('.row-description').find('.drop-content').toggleClass('table-active');
     $(this).closest('.text-row--dropdown').find('.drop-table-icon').toggleClass('icon-chevron-down--top');
    });


  $('.text-row--dropdown').on('click', function (e) {
    $(this).toggleClass('text-row--dropdown-open');
     $(this).closest('.popup-form--contacts').find('.drop-content').toggleClass('table-active');
     $(this).closest('.text-row--dropdown').find('.drop-table-icon').toggleClass('icon-chevron-down--top');
    });


$('.action-btn--choose-size').on('click', function (e) {
   $('.popup--size-set').toggleClass('popup--active');
  });


  $('[data-tab]').on('click', function (e) {
    $(this).addClass('tab-name--active').siblings('[data-tab]').removeClass('tab-name--active')
    $(this).closest('.catlog-tab-name-row').siblings('[data-content=' + $(this).data('tab') + ']').addClass('tab-content--active').siblings('[data-content]').removeClass('tab-content--active')
    e.preventDefault()
  });

  $(document).ready(function(){
    var sum = 0;
   $(document).on("change", ".input_amount", function() {
     sum = 0;
    $('.input_amount').each(function(){
      sum += +$(this).val();
      });
      // console.log(sum);
      $('.total-items-in-basket').html(sum);
    });
    $('.input_amount').each(function(){
      sum += +$(this).val();
      });
    // $('.total-items-in-basket').html(sum);
    //   console.log(sum);
  })

  // $('.input_amount').each(function(){
  //   sum += +$(this).val();
  //   });
  //   $('.total-items-in-basket').val(sum);
// $('input.input_amount').on("change", function() {
//     var sum = 0;
//     console.log(sum);
//     $('.input_amount.item-amount').each(function(){
//         sum = Number(sum) + Number($(this).val();)
//         console.log(sum);
//     });
//     $('.total-items-in-basket').val(sum);
// });
