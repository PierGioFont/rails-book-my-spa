class Spa < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :massages
  has_attachment :photo

  def equipments
    self.amenities['equipments'].split(';')
  end

  def installations
    self.amenities['installations'].split(';')
  end
end
