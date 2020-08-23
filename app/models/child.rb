class Child < ApplicationRecord
  belongs_to :parent
  belongs_to :program, optional: true
  validates :name, :age, :presence => true
end
