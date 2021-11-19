class Movie < ApplicationRecord
  belongs_to :room
  has_many :schedules
end
