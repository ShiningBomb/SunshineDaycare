class Child < ApplicationRecord
  belongs_to :parent
  belongs_to :program, optional: true
  has_and_belongs_to_many :posts
  
  validates :name, :age, :presence => true
end
