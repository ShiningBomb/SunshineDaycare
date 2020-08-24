class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :children
  has_one :timeline

  validates :email, uniqueness: true
  
  after_create :create_timeline

  def create_timeline
    Timeline.create(parent: self)
  end
end
