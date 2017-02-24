class Spa < ApplicationRecord
  attr_accessor :distance
  attr_accessor :avg_rating

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
    self.amenities['equipments'].split(';') unless self.amenities['equipments'].nil?
  end

  def installations
    self.amenities['installations'].split(';') unless self.amenities['installations'].nil?
  end

  def upd_avg_rating(id_spa)
    tot_rate = 0
    rating_spa = Spa.find(id_spa)
    rating_spa.bookings.each do |bking|
      tot_rate += bking.rating unless bking.rating.nil?
    end
    #byebug
    rating_spa.avg_rating = tot_rate / rating_spa.bookings.count unless rating_spa.bookings.count == 0
    rating_spa.save
  end
end
