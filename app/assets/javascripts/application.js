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
//= require jquery_ujs
//= require turbolinks
//= require_tree .

  function updateTotal(){

    var quantity = document.getElementById('qty').value;
    var current_price = document.getElementById('current_price').value;
    
    document.getElementById('total').value = quantity * current_price ; 
  }

$(document).ready(updateDoge())

function updateDoge() {
 $('#doge_qty').on('keyup', function() {
    var quantity = $('#doge_qty').val();
      console.log(quantity);
      var current_price = $('#doge_current_price').val();
      console.log(current_price);
      $('#doge_total_dollars').val() = quantity * current_price;
 })
};
      



