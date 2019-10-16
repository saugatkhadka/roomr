function messageForm(){
  var shiftDown = false;
  var chatForm = $("#new-message");
  var messageBox = chatForm.children("textarea");
  $(document).keypress(function (e) {
      if(e.keyCode == 13) {
          if(messageBox.is(":focus") && !shiftDown) {
            e.preventDefault(); // prevent another \n from being entered
            chatForm.submit();
            $(chatForm).trigger('reset');
          }
      }
  });

  $(document).keydown(function (e) {
      if(e.keyCode == 16) shiftDown = true;
  });

  $(document).keyup(function (e) {
      if(e.keyCode == 16) shiftDown = false;
  });
}

// messageForm();

function checkForKeyPress() {
    
    $('#new-message-textarea').on("keydown", function(e){
        if(e.which == 13){
            e.preventDefault(); // prevent another \n from being entered
            this.submit();
            this.trigger('reset');
        }
    })
}