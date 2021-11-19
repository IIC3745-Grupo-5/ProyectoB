class Schedule < ApplicationRecord
  belongs_to :movie
  has_and_belongs_to_many :rooms
end
