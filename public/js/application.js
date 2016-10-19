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
        console.log(url)

      var request = $.ajax({
        url: url,
        method: method
      })

      request.done(function(response){
        console.log("Success!")
        $('#heart-buttons').children().remove();
        $('#heart-buttons').append(response);
      })
    }

    else {
      var button = form.children().last();
      var url = form.attr('action');
      console.log(url)
      var method = "DELETE"

      var request = $.ajax({
        url: url,
        method: method
      })

      request.done(function(response){
        console.log("Success!")
        $('#heart-buttons').children().remove();
        $('#heart-buttons').append(response);
      })
    }

})
};

function initMap(){
 var map = new google.maps.Map(document.getElementById('map'), {
   center: {lat: -34.397, lng: 150.644},
   zoom: 8
   });

 var options = {
  types: ['(cities)'],
  // componentRestrictions: {country: "us"}
 };
 var input = $("#city")[0]
 var autocomplete = new google.maps.places.Autocomplete(input, options).getPlace();
 autocomplete.bindTo('bound', map);

input.keydown(function(event){
   if(event.keyCode == 13) {
     event.preventDefault();
     return false;
   }
 });
};

