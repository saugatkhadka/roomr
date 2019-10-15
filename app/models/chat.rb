class Chat < ApplicationRecord
  # Destroys all messages and subscription if chat is destroyed
  has_secure_token :identifier
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  has_many :users, through: :subscriptions

  validates :identifier, presence: true, uniqueness: { case_sensitive: false }
end
