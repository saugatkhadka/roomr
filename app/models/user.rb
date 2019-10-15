class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Rails 6.1 explicitly asks for case_sensitive:true for uniqueness validator
  validates :username, uniqueness: {case_sensitive: true}, presence: true
end
