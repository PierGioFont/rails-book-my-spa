class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :massage
  has_one :spa, :through => :massage
  validates :date, presence: true
  validates :time_in, presence: true
  validates :massage_id, presence: true
  # validates :time_out, presence: true
  # after_save :update_spa_booking_number


  def reviewed?
    if content.nil? || content.empty?
      return false
    else
      return true
    end
  end

  # def update_spa_booking_number
  #   # spa_id = self.massage.spa.id
  #   massage = Massage.find(massage_id)
  #   spa = Spa.find(massage.spa_id)

  #   upcoming_bookings = Booking.joins(:massages).where(spa_id: massage.spa_id)
  #   upcoming_bookings = upcoming_bookings.where("date > ?", Date.today)
  #   spa.booking_number = upcoming_bookings.size
  #   spa.save
  # end
end
