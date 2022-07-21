class User < ApplicationRecord
  # has_many: orders

  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  
  
end
