class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_#{ message.chat.id }", {
      message: MessagesController.render(message),
      chat_id: message.chat.id
    }
  end
end
