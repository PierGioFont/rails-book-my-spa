class Spa < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :massages
  has_attachment :photo
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :bookings, through: :massages

  def equipments
    self.amenities['equipments'].split(';')
  end

  def installations
    self.amenities['installations'].split(';')
  end
end
