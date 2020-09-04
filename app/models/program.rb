class Program < ApplicationRecord
    has_many :weekly_schedules
    has_many :children
    validates :name, :from_age, :to_age, :presence => true
end
