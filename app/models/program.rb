class Program < ApplicationRecord
    has_many :weekly_schedules
    validates :name, :from_age, :to_age, :presence => true
end
