// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  setTimeout(function() {
    $('.alert-dismissable').hide(300);
  }, 5000);
})

function openTab(evt, TabName) {
  // Declare all variables
  var i, tabcontent, tablinks;

  // Get all elements with class="tabcontent" and hide them
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(TabName).style.display = "block";
  evt.currentTarget.className += " active";
}

$(document).ready(function() {
  $('.js-example-basic-multiple').select2({
    placeholder: 'Select an option'
  });
});

$(document).change(function() {
  //var ids = $(test).val(); // works
  //var selections = $(test).filter('option:selected').text(); // doesn't work
  //var ids = $(test).select2('data').id; // doesn't work (returns 'undefined')
  //var selections = $(test).select2('data').text; // doesn't work (returns 'undefined')
  //var selections = $(test).select2('data');
  var selections = ( JSON.stringify($(test).select2('data')) );
  //console.log('Selected IDs: ' + ids);
  console.log('Selected options: ' + selections);
  //$('#selectedIDs').text(ids);
  $('#selectedText').text(selections);
});

