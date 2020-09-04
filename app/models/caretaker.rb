class Caretaker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable
  has_many :posts
  has_many :activities

  validates :email, uniqueness: true

  def to_s
    email
  end
end
