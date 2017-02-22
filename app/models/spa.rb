class Spa < ApplicationRecord
  attr_accessor :distance
  belongs_to :user
  validates :name, presence: true
  has_many :massages
  has_attachment :photo
  has_many :bookings, through: :massages
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def equipments
    self.amenities['equipments'].split(';')
  end

  def installations
    self.amenities['installations'].split(';')
  end
end
