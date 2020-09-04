class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  has_many :children
  has_one :timeline

  has_and_belongs_to_many :favorite_posts, :class_name => 'Post', :join_table => :parents_favorite_posts

  validates :email, uniqueness: true
  
  after_create :create_timeline

  def create_timeline
    Timeline.create(parent: self)
  end
end
