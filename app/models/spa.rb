class Spa < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :massages
  has_attachment :photo
end