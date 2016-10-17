$(document).ready(function() {
  createUnselectedButtonListener();
  createSelectedButtonListener();
});

var createButtonListener = function(){
  $('#add-to-wanderlist').on('submit', function(event){
    event.preventDefault();
    var button = $(this).children().last();
    console.log(button)
    var url = $(this).attr('action');
    var method = "PUT"

    var request = $.ajax({
      url: url,
      method: method
    })

    request.done(function(response){
      console.log("Success!")
      button.removeClass("unselected").addClass("selected")
    })
  });
}
