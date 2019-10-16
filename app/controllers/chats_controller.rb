require 'securerandom'

class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
    @chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
  end

  # Joining the chat
  def create
    @other_user = User.find(params[:other_user])
    # has_secure_token in chat.rb model generates a unique aplhanumeric token
    @chat = find_chat(@other_user) || Chat.new(identifier: SecureRandom.hex)
    # Creates a new subsscription for current and the other user with a single chat
    if !@chat.persisted?
      @chat.save
      @chat.subscriptions.create(user_id: current_user.id)
      @chat.subscriptions.create(user_id: @other_user.id)
    end
      
    redirect_to user_chat_path(
      current_user,
      @chat,
      :other_user => @other_user.id
    )
  end

  def show
    @other_user = User.find(params[:other_user])
    @chat = Chat.find(params[:id])
    @message = Message.new
    @messages = @chat.messages.order(created_at: :desc).limit(100).reverse
    @existing_chats_users = current_user.existing_chats_users
  end

  private
  def find_chat(second_user)  
    chats = current_user.chats
    
    chats.each do |chat|
      chat.subscriptions.each do |s|
        if s.user_id == second_user.id
          return chat
        end
      end
    end
    # If current user is not found, returns nil
    return nil
  end
end
