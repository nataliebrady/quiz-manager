// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require cocoon
//= require_tree .


var counter = 1;
var questionCounter = 0;

 function toggleIcon(e) {
 	$(e.target)
 	.prev('.panel-heading')
 	.find(".more-less")
 	.toggleClass('glyphicon-plus glyphicon-minus');
 }

$(document).ready(function() {
 $('#new_quiz').on('cocoon:after-insert', function(e, insertedItem) {
 	counter++;
    insertedItem.addClass('collapse-'+counter);

 if ($('.nested-fields').hasClass("collapse-"+counter)) { 
 	$('.collapse-'+counter+' .panel-collapse').attr('id', 'collapse-'+counter);
 	$('.collapse-'+counter+' .panel-collapse').removeClass('collapse-1');
 	$(".collapse-"+counter+" .panel-title a").attr("href", "#collapse-"+counter);
 	$(".collapse-"+counter+" .panel-title a").empty();
  	$(".collapse-"+counter+" .panel-title a").append('Question '+counter+' <i class="more-less glyphicon glyphicon-plus"></i>');
 }
  });

 	$('.panel-group').on('hidden.bs.collapse', toggleIcon);
 	$('.panel-group').on('shown.bs.collapse', toggleIcon);
});
