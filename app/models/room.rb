class Room < ApplicationRecord
  belongs_to :cinema
  has_many :reservations
  has_and_belongs_to_many :schedules
end
