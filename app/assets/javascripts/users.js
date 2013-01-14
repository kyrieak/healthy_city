// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {

  var tagsNodeList = document.querySelectorAll('.icon-big');
  var tag_id;

  function renderCompForm(a_id) {
    $("#comp_form").load("/completions/new?a_id="+a_id);
  }

  for (var i = 0; i < tagsNodeList.length; ++i) {
    tag_id = tagsNodeList[i].id;
    $("#".concat(tag_id)).click(function() {renderCompForm(tag_id);});
  }

});