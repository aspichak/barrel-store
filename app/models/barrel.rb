class Barrel < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates_numericality_of :volume, greater_than: 0
  validates_numericality_of :price, greater_than: 0
end
