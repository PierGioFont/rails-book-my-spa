class Spa < ApplicationRecord
  attr_accessor :distance
  belongs_to :user
  validates :name, presence: true
  has_many :massages
  has_attachment :photo
  has_many :bookings, through: :massages
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :bookings, through: :massages
  include Bootsy::Container

  def equipments
    self.amenities['equipments'].split(';')
  end

  def installations
    self.amenities['installations'].split(';')
  end

  def upd_avg_rating(total_rating, bkings_count)
    avg_rating = total_rating / bkings_count
    save
  end
end
