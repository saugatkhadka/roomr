class MessagesChannel < ApplicationCable::Channel
  def subscribed(params)
    stream_from "messages_#{ params[:chat_id] }"
  end

  def unsubscribed
    stop_all_streams
  end
end
