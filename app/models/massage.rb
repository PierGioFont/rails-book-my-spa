class Massage < ApplicationRecord
  belongs_to :spa
  validates :name, presence: true
  has_many :users, through: :bookings
end
