class Post < ApplicationRecord
  belongs_to :caretaker
  belongs_to :activity
  has_and_belongs_to_many :children
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  validates :title, :description, :presence => true
end
