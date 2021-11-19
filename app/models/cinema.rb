class Cinema < ApplicationRecord
  has_many :movies
  has_many :rooms
end
