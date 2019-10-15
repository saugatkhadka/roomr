import consumer from "./consumer"

consumer.subscriptions.create({
    channel: "MessagesChannel",
    chat_id: parseInt($("#message_chat_id").val())
  }, 
  {
    // connected() {
    //   // Called when the subscription is ready for use on the server
    // },

    // disconnected() {
    //   // Called when the subscription has been terminated by the server
    // },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      // this.appendLine(data)

      // Temporary Workaround
      $("#messages").removeClass('hidden')
      return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
      return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
    },

    appendLine(data) {
      // const html = this.createLine(data)
      // const element = document.querySelector()
    }
  }
);
