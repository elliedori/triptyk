$(document).ready(function() {
  createButtonListener();
});

var createButtonListener = function(){
  $('#add-to-wanderlist').on('submit', function(event){
    event.preventDefault();
    url = $(this).attr('action');
    $.ajax({
      url: url
    })
    
  });
}
