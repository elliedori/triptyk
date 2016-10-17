$(document).ready(function() {
  createUnselectedButtonListener();
  // createSelectedButtonListener();
});

var createUnselectedButtonListener = function(){
  $('#heart-buttons').on('submit', function(event){
    event.preventDefault();
    var form = $(this).children();
    console.log(form)

    if (form.hasClass( "add-to-wanderlist" )){
      var button = form.children().last();
      var url = form.attr('action');
      var method = "PUT"

      var request = $.ajax({
        url: url,
        method: method
      })

      request.done(function(response){
        console.log("Success!")
        $('#heart-buttons').empty().append(response);
      })
    }

    if (form.hasClass( "remove-from-wanderlist" )){
      var button = form.children().last();
      var url = form.attr('action');
      var method = "DELETE"

      var request = $.ajax({
        url: url,
        method: method
      })

      request.done(function(response){
        console.log("Success!")
        $('#heart-buttons').empty().append(response);
      })
    }