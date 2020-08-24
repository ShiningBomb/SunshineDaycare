class Timeline < ApplicationRecord
    belongs_to :parent
    has_and_belongs_to_many :posts
end
  