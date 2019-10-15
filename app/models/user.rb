class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :subscription
  has_many :chats, through: :subscription

  # Rails 6.1 explicitly asks for case_sensitive:true for uniqueness validator
  validates :username, uniqueness: { case_sensitive: true }, presence: true


  # TODO: Reformat the function to only show those users that were invited by the user
  def existing_chats_users
    existing_chat_users = []

    self.chats.each do |chat|
      # Returns all chat subscriptions that are not to themselves
      user_subscription = chat.subscriptions.where.not(user_id: self.id)

      # Adds all the users available for chat beside self to existing_chat_user 
      existing_chat_users.concat(
        user_subscription.map { |subscription| subscription.user }
      )
    end

    # Returns only unique user chat instances
    existing_chat_users.uniq
  end

end
