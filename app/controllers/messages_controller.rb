class MessagesController < ApplicationController
  before_action :set_chat

  def create
    # message = Message.new(message_params)
    message = @chat.messages.new(message_params)
    message.user = current_user

    if message.save
      # Broadcast message to all clients connected to the channel. A single client
      ActionCable.server.broadcast(
        "message_#{ message_params[:chat_id] }",
        message: message.content,
        user: message.user.username
      )
    else 
      redirect_to @chat
    end
  end

  private
  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
