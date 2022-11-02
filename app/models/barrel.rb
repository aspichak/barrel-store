class Barrel < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper

  has_one_attached :image

  validates :name, presence: true
  validates_numericality_of :volume, greater_than: 0
  validates_numericality_of :price, greater_than: 0
  validate :valid_image

  before_validation :sanitize_description

  private

  def valid_image
    errors.add :description, 'required'
    errors.add :image, 'required' unless image.attached?
    errors.add :image, 'invalid or corrupt image' unless image.variable?
  end

  def sanitize_description
    self.description = sanitize self.description
  end
end
