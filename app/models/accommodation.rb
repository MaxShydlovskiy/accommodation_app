class Accommodation < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
end
