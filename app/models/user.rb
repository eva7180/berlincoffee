class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :comments
  has_many :carts 

  after_create :welcome
  def welcome
  	UserMailer.welcome(self).deliver_now
  end
end
