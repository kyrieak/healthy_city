# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {

  $("img.icon-big").bind("click", renderCompForm());

  var activity = new Activity();

  function Activity(){
    this.id = 0;

    this.getId = function(){
      return this.id;
    };

    this.setId = function(aId) {
      this.id = aId;
    };
  }

  function renderCompForm() {
    activity.setId(this.id);
    document.getElementById("comp_form").load("_completion_form.erb"));
  }

  function hideCompForm() {
    document.getElementById("comp_form").style.display = "none";
  }

});