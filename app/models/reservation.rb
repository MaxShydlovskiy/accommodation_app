class Reservation < ApplicationRecord
  has_many :accommodations
  has_many :reservations

  belongs_to :user
  belongs_to :accommodation
end
