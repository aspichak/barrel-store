class Barrel < ApplicationRecord
  validates :name, presence: true
  validates_numericality_of :volume, greater_than: 0
  validates_numericality_of :price, greater_than: 0
end
