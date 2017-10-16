/* global $ */
$(document).ready(function() {
  var oppositeStatus = function(val){
    if (val == "アンロック"){
      return "ロック"
    }else{
      return "アンロック"
    }
  }
  
  $('.change_account_status').on('click', function(){
    var email = $(this).siblings(".email_col").val() 
    var nowstatus = $(this).siblings(".status_col").val()
    var newstatus = oppositeStatus($(this).siblings(".status_col").val())
    
    window.confirm(email + "のアカウントステータスを変更します。\n" + nowstatus + "->" + newstatus)
    
  });
});