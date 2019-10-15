class ChatsController < ApplicationController
  require 'securerandom'

  before_action :authenticate_user!

  def index
    @chats = current_user.chats
    @existing_chats_users = current_user.existing_chats_users
  end

  def create
    @other_user = User.find(params[:other_user])
    # has_secure_token in chat.rb model generates a unique aplhanumeric token
    @chat = find_chat(@other_user) || Chat.new()
    # if !@chat.persisted?
      @chat.save
      @chat.subscription.create(
        user_id: current_user.id
      )
      @chat.subscriptions.create(
        user_id: @other_user.id
      )
      
      redirect_to user_chat_path(
        current_user,
        @chat,
        :other_user => @other_user.id
      )
    # end
  end

  def show
    @other_user = User.find(params[:other_user])
    @chat = Chat.find_by(id: params[:id])
    @message = Message.new
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
  end
end
