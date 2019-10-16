class ChatChannel < ApplicationCable::Channel
  def subscribed
    current_user.chats.each do |chat|
      stream_from "chat_#{chat.id}"
    end
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
