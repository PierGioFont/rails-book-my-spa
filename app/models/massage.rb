class Massage < ApplicationRecord
  after_initialize :set_defaults, unless: :persisted?

  belongs_to :spa
  validates :name, presence: true
  has_many :users, through: :bookings

  def set_defaults
    self.price = 0 if self.price.nil?
  end
end
