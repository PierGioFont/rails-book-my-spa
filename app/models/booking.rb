class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :massage
  has_one :spa, :through => :massage
  validates :date, presence: true
  validates :time_in, presence: true
  # validates :time_out, presence: true
end
