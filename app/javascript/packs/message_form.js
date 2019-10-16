// function messageForm(){
//   var shiftDown = false;
//   var chatForm = $("#new-message");
//   var messageBox = chatForm.children("textarea");
//   $(document).keypress(function (e) {
//       if(e.keyCode == 13) {
//           if(messageBox.is(":focus") && !shiftDown) {
//             e.preventDefault(); // prevent another \n from being entered
//             chatForm.submit();
//             $(chatForm).trigger('reset');
//           }
//       }
//   });

//   $(document).keydown(function (e) {
//       if(e.keyCode == 16) shiftDown = true;
//   });

//   $(document).keyup(function (e) {
//       if(e.keyCode == 16) shiftDown = false;
//   });
// }

// messageForm();


// function process(e) {
//     var code = (e.keyCode ? e.keyCode : e.which);
//     if (code == 13) { //Enter keycode
//         alert("Sending your Message : " + document.getElementById('new-message-textarea').value);
//     }
// }

// $('#new-message-textarea').on("keypress", function(e){
//     if(e.which == 13){
//         console.log("Enter pressed")
//         e.preventDefault(); // prevent another \n from being entered
//         this.submit();
//         this.trigger('reset');
//     }
// })

// function checkForKeyPress() {
    
//     $('#new-message-textarea').on("keydown", function(e){
//         if(e.which == 13){
//             e.preventDefault(); // prevent another \n from being entered
//             this.submit();
//             this.trigger('reset');
//         }
//     })
// }

// checkForKeyPress();

$( document ).ready(function() {
  $('#new_message').on("keypress", function(e) {
    // return console.log(e.keyCode);
    if(e && e.keyCode == 13) {
      e.preventDefault()
      $(this).submit()
    }
  });
});
