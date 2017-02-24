class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :massage
  has_one :spa, :through => :massage
  validates :date, presence: true
  validates :time_in, presence: true
  validates :massage_id, presence: true
  # validates :time_out, presence: true

  def reviewed?
    if content.nil? || content.empty?
      return false
    else
      return true
    end
  end
end
