/* global $ */
$(document).ready(function() {
  $(".change_account_status").on('show.bs.modal', function(event){
    var button = $(event.relatedTarget);
    var recipient = button.data('whatever');
    var modal = $(this);
    $('.this-modal-account-email').attr(recipient.email);
    $('.this-modal-account-status').attr($('.account_status').val())    
            
  });

  $(".account_status").on('click', function(){
      console.log("AA");
  });    

 $("p").css("color", "red");

})
